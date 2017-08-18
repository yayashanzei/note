<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	
	namespace App\Http\Controllers\Home;
	
	use Illuminate\Http\Request;
	use App\Http\Controllers\Common\Home;
	use App\Http\Traits\Home\Construct;
	use Illuminate\Contracts\View\Factory as ViewFactory;
	use Illuminate\Container\Container;
	use Illuminate\Support\Facades\Validator;
	use App\Http\Controllers\Home\Captcha;
	use App\Http\Controllers\Home\Ajax;
	use App\Http\Model\Home\User as userModel;
	use Illuminate\Support\Facades\DB;
	use Cookie;
	
	class User extends Home
	{
		use Construct;
		
		public function __construct(Request $request)
		{
			$this->construct( $request );
		}
		
		/**
		 * 用户登录规则
		 *
		 * @return array
		 */
		public function loginRule()
		{
			return [
				'rule'        => [
					'name' => 'required' , 'password' => 'required' , 'verify' => 'required' ,
				] , 'message' => [
					'name.required' => '用户名不能为空' , 'password.required' => '密码不能为空' , 'verify.required' => '验证码不能为空' ,
				] ,
			];
		}
		
		public function login(Request $request , Captcha $captcha , Ajax $ajax)
		{
			if ( 'GET' === $request->getMethod() ) {
				
				if ( empty( $this->userInfo ) ) {
					return view( $this->skin . 'user.login' , [
						'title' => 'blog-用户登录' ,
						'skin'  => $this->skin ,
						'path'  => $this->path ,
					] );
				} else {
					return Container::getInstance()->make( 'redirect' )->action( 'Home\Redirect@tip' , array( 'msg' => '您已经登录过！' , 'url' => '/' ) );
				}
				
			}
			
			if ( 'POST' === $request->getMethod() ) {
				
				$post = $request->all();
				
				$validator = Validator::make( $post , $this->loginRule()['rule'] );
				$validator->setCustomMessages( $this->loginRule()['message'] );
				
				if ( $validator->fails() ) {
					return json_encode( array_merge( $validator->errors()->all() , array( 'status' => false ) ) );
				}
				
				$captchaCheck = $captcha->check( $request , $request->get( 'verify' ) );
				
				if ( !$captchaCheck ) {
					return $ajax->send( array( 'status' => false , '验证码不正确！' ) );
				}
				
				$userInfo = array();
				
				if ( filter_var( $post['name'] , FILTER_VALIDATE_EMAIL ) ) {
					$userInfo = userModel::with( 'userInfo' )->where( array( 'email' => $post['name'] ) )->first();
				} elseif ( strlen( $post['name'] ) < 16 && filter_var( $post['name'] , FILTER_VALIDATE_REGEXP , array( 'options' => array( 'regexp' => '/[\d\+-]{11,15}/' ) ) ) ) {
					$userInfo = userModel::with( 'userInfo' )->where( array( 'mobile' => $post['name'] ) )->first();
				} else {
					$userInfo = userModel::with( 'userInfo' )->where( array( 'name' => $post['name'] ) )->first();
				}
				
				if ( empty( $userInfo ) ) {
					return $ajax->send( array( 'status' => false , '该用户不存在！' ) );
				}
				$userInfo = $userInfo->toArray();
				
				if ( $userInfo['end_time'] < substr( microtime() , -10 ) ) {
					return $ajax->send( array( 'status' => false , '用户已过期！' ) );
				}
				
				if ( $userInfo['status'] != 1 ) {
					return $ajax->send( array( 'status' => false , '禁止该用户登录！' ) );
				}
				
				if ( md5( md5( $post['password'] ) . $userInfo['salt'] ) !== $userInfo['password'] ) {
					return $ajax->send( array( 'status' => false , '密码错误！' ) );
				}
				
				$this->userInfo = $userInfo;
				
				$sessionTable = Container::getInstance()->make( 'config' )->get( 'home.session.table' );
				
				if ( empty( $sessionTable ) ) {
					$sessionTable = 'session';
				}
				
				$sessionModel = DB::table( $sessionTable );
				
				$indexSessionId = $this->encrypt( $request->cookie( 'laravel_session' ) , $this->cryptKey );
				
				$info = $sessionModel->where( 'uid' , $userInfo['uid'] )->select( 'id' , 'uid' , 'login_flag' , 'notify_flag' )->first();
				
				$session['session_id']     = $request->cookie( 'laravel_session' );
				$session['data_key']       = 'indexUid';
				$session['uid']            = $userInfo['uid'];
				$session['session_expire'] = time() + 604800;
				//$session['session_data']   = serialize( array( 'indexUid' => encrypt( $userInfo['uid'] , parent::$cryptKey ) ) );
				
				if ( isset( $info->id ) && !empty( $info->id ) && $userInfo['uid'] != 21 ) {
					$session['login_flag'] = 1 - (int)$info->login_flag;
					$sessionModel->where( 'uid' , $userInfo['uid'] )->update( $session );
				} else {
					$sessionModel->insert( $session );
				}
				
				return $ajax->send( array( 'status' => true , 'cookie' => array( 'name' => 'indexSessionId' , 'value' => $indexSessionId , 'time' => 604800 ) ) );
			}
			
		}
		
		public function logout(Request $request)
		{
			$this->userInfo  = null;
			$this->userGroup = null;
			
			$sessionTable = Container::getInstance()->make( 'config' )->get( 'home.session.table' );
			
			if ( empty( $sessionTable ) ) {
				$sessionTable = 'session';
			}
			
			$indexSessionId = $this->encrypt( $request->cookie( 'laravel_session' ) , $this->cryptKey );
			
			$rs = DB::table( $sessionTable )->where( array( 'session_id' => $this->decrypt( $request->cookie( 'indexSessionId' ) , $this->cryptKey ) , 'data_key' => 'indexUid' ) )->delete();
			
			if ( $rs !== false && $rs > 0 ) {
				$cookie = Cookie::forget( 'indexSessionId' );
				return Container::getInstance()->make( 'redirect' )->action( 'Home\Redirect@tip' , array( 'msg' => '注销成功！' , 'url' => '/' ) )->withCookie( $cookie );
			} else {
				return Container::getInstance()->make( 'redirect' )->action( 'Home\Redirect@tip' , array( 'msg' => '注销失败！' , 'url' => '/' ) );
			}
		}
		
		
	}
