<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	
	namespace App\Http\Middleware\Home;
	
	use Closure;
	use Illuminate\Container\Container;
	use Illuminate\Contracts\View\Factory as ViewFactory;
	use Illuminate\Support\Facades\DB;
	use App\Http\Model\Home\User as userModel;
	
	class Init
	{
		
		public function handle($request , Closure $next , $caller = null)
		{
			$callerObj = $caller::getSelf();
			$this->getInstruction( $request , $callerObj );
			$this->initStaticEnvironment( $request , $callerObj );
			$this->assignBase( $request , $callerObj );
			$this->checkNoLogin( $request , $callerObj );
			$this->checkSpecial( $request , $callerObj );
			$this->checkLogin( $request , $callerObj );
			$this->checkPower( $request , $callerObj );
			$this->assignGroupInfo( $callerObj );
			$checkResult = $this->checkInitResult( $callerObj );
			if ( isset( $checkResult['status'] ) && !$checkResult['status'] ) {
				return $checkResult['handle'];
			}
			return $next( $request );
		}
		
		protected function checkInitResult($callerObj)
		{
			
			$redirect = Container::getInstance()->make( 'redirect' );
			
			if ( $callerObj->needLogin && empty( $callerObj->userInfo ) ) {
				return array(
					'status' => false ,
					'handle' => $redirect->action( 'Home\Redirect@tip' , array( 'msg' => '请登录' , 'url' => '/user/login' ) ) ,
				);
			}
			
			if ( !( $callerObj->specialAuth || $callerObj->baseAuth || $callerObj->advancedAuth ) ) {
				return array(
					'status' => false ,
					'handle' => $redirect->action( 'Home\Redirect@tip' , array( 'msg' => '您无权操作' , 'url' => isset( $_SERVER["HTTP_REFERER"] ) ? $_SERVER["HTTP_REFERER"] : '/' ) ) ,
				);
			}
			
		}
		
		protected function getInstruction($request , $callerObj)
		{
			$callerObj->instructions['action'] = $request->route()->getActionMethod();
			$controller                        = $callerObj->instructions['controllerMethod'] = get_class( $request->route()->getController() );
			if ( !empty( $controller ) ) {
				$controller                            = $callerObj->instructions['controllerMethodArray'] = explode( '\\' , $controller );
				$callerObj->instructions['controller'] = array_pop( $controller );
				$callerObj->instructions['module']     = array_pop( $controller );
			}
			$callerObj->action = strtolower( $callerObj->instructions['controller'] ) . '/' . strtolower( $callerObj->instructions['action'] );
		}
		
		protected function initStaticEnvironment($request , $callerObj)
		{
			$callerObj->path['skin']      = Container::getInstance()->make( 'config' )->get( 'home.template.skin' );
			$callerObj->path['uploadUrl'] = '/';
			$callerObj->path['staticUrl'] = '/';
			$callerObj->path['resources'] = 'resources/assets/';
			
			$callerObj->path['upload'] = $callerObj->path['uploadUrl'] . 'upload';
			$callerObj->path['static'] = $callerObj->path['staticUrl'] . $callerObj->path['resources'];
			
			$callerObj->path['common'] = $callerObj->path['static'] . 'common';
			$callerObj->path['image']  = $callerObj->path['static'] . strtolower( $callerObj->instructions['module'] ) . '/' . $callerObj->path['skin'] . '/images';
			$callerObj->path['css']    = $callerObj->path['static'] . strtolower( $callerObj->instructions['module'] ) . '/' . $callerObj->path['skin'] . '/css';
			$callerObj->path['js']     = $callerObj->path['static'] . strtolower( $callerObj->instructions['module'] ) . '/' . $callerObj->path['skin'] . '/js';
		}
		
		public function assignBase($request , $callerObj)
		{
			Container::getInstance()->make( ViewFactory::class )->share( 'baseStatic' ,
				<<<static
	<link rel="stylesheet" href="{$callerObj->path['common']}/layui1.0.9rls/css/layui.css">
	<link rel="stylesheet" href="{$callerObj->path['common']}/fontawesome4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="{$callerObj->path['css']}/home.css" id="link">
	<script type="text/javascript" src="{$callerObj->path['common']}/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="{$callerObj->path['common']}/layer3.0.3/layer.js"></script>
	<script type="text/javascript" src="{$callerObj->path['common']}/layui1.0.9rls/layui.js"></script>
	<script type="text/javascript" src="{$callerObj->path['common']}/js/respond.js"></script>
	<script type="text/javascript" src="{$callerObj->path['common']}/js/moment.min.js"></script>
static
			);
		}
		
		public function assignBaseFull($request , $callerObj)
		{
			Container::getInstance()->make( ViewFactory::class )->share( 'baseFullStatic' ,
				<<<static
<link rel="stylesheet" href="{$callerObj->path['css']}/base.css">
	<link rel="stylesheet" href="{$callerObj->path['common']}/layui/css/layui.css">
	<link rel="stylesheet" href="{$callerObj->path['css']}/index.css" id="link">
	<script type="text/javascript" src="{$callerObj->path['common']}/js/jquery-1.12.3.min.js"></script>
	<script type="text/javascript" src="{$callerObj->path['common']}/layer/layer.js"></script>
	<script type="text/javascript" src="{$callerObj->path['common']}/layui/layui.js"></script>
	<script type="text/javascript" src="{$callerObj->path['common']}/js/respond.js"></script>
static
			);
		}
		
		/* 检测用户组是否需要登录 */
		public function checkNoLogin($request , $callerObj)
		{
			$basePath = Container::getInstance()->basePath();
			$noLogin  = include_once( $basePath . DS . 'app' . DS . 'Http' . DS . 'Group' . DS . $callerObj->instructions['module'] . DS . 'nologin.php' );
			if ( !empty( $noLogin ) ) {
				
				if ( isset( $noLogin[ $callerObj->action ] ) && $noLogin[ $callerObj->action ] == 1 ) {
					$callerObj->needLogin = false;
					return;
				}
			}
		}
		
		/* 检测是否是否是一个特殊的操作 */
		public function checkSpecial($request , $callerObj)
		{
			
			$basePath = Container::getInstance()->basePath();
			$special  = include_once( $basePath . DS . 'app' . DS . 'Http' . DS . 'Group' . DS . $callerObj->instructions['module'] . DS . 'special.php' );
			
			if ( !empty( $special ) ) {
				
				if ( isset( $special[ $callerObj->action ] ) && $special[ $callerObj->action ] == 1 ) {
					$callerObj->specialAuth = true;
					return;
				}
			}
			
		}
		
		/* 检测是否已经登录，如果已经登录则检测是否是管理员 */
		public function checkLogin($request , $callerObj)
		{
			
			$sessionTable = Container::getInstance()->make( 'config' )->get( 'home.session.table' );
			if ( empty( $sessionTable ) ) {
				$sessionTable = 'session';
			}
			
			$indexSessionId = '';
			
			if ( !empty( $request->cookie( 'indexSessionId' ) ) ) {
				$indexSessionId = $callerObj->decrypt( $request->cookie( 'indexSessionId' ) , $callerObj->cryptKey );
			}
			
			$userInfo = array();
			
			$sessionModel = DB::table( $sessionTable );
			$sessionUser  = $sessionModel->where( array( 'session_id' => $indexSessionId , 'data_key' => 'indexUid' ) )->get()->toArray();
			
			if ( !empty( $sessionUser ) && count( $sessionUser ) > 0 ) {
				$sessionUser = array_pop( $sessionUser );
			}
			
			if ( empty( $sessionUser ) || empty( $sessionUser->uid ) || $sessionUser->session_expire < time() ) {
				return false;
			} else {
				
				$userInfo = userModel::with( 'userInfo' )->where( 'uid' , $sessionUser->uid )->first()->toArray();
				
				if ( !empty( $userInfo ) ) {
					$callerObj->userInfo = $userInfo;
					
					Container::getInstance()->make( ViewFactory::class )->share( 'userInfo' , $callerObj->userInfo );
					
					/*头像处理*/
					/*if ( !empty( $this->userInfo['avatar'] ) ) {
						$avatar   = M( 'avatar' )->where( array( 'id' => $this->userInfo['avatar'] ) )->field( 'path' )->find();
						$pathInfo = pathinfo( $avatar['path'] );
						if ( isset( $pathInfo['dirname'] ) ) {
							$this->userInfo['avatarPath'] = $avatar['path'];
							$this->userInfo['avatarPic']  = $pathInfo['dirname'] . '/crop_' . $pathInfo['basename'];
						}
					}*/
				}
				return $callerObj->userInfo;
			}
		}
		
		/* 检测是否是管理员 */
		public function isAdmin($callerObj)
		{
			if ( intval( $callerObj->userInfo['groupid'] ) < 3 ) {
				Container::getInstance()->make( ViewFactory::class )->share( 'isAdmin' , true );
				return true;
			}
			return false;
		}
		
		public function checkPower($request , $callerObj)
		{
			
			if ( $callerObj->specialAuth ) {
				return;
			}
			
			if ( empty( $callerObj->userInfo['uid'] ) ) {
				return;
			}
			$basePath             = Container::getInstance()->basePath();
			$callerObj->groupInfo = include_once( $basePath . DS . 'app' . DS . 'Http' . DS . 'Group' . DS . $callerObj->instructions['module'] . DS . $callerObj->userInfo['groupid'] . '.php' );
			
			if ( empty( $callerObj->groupInfo ) || empty( $callerObj->groupInfo['power'] ) ) {
				return;
			}
			
			if ( isset( $callerObj->groupInfo['power']['special'][ $callerObj->action ] ) && $callerObj->groupInfo['power']['special'][ $callerObj->action ] > 0 ) {
				$callerObj->specialAuth = true;
				return;
			}
			
			if ( isset( $callerObj->groupInfo['power']['base'][ $callerObj->action ] ) && $callerObj->groupInfo['power']['base'][ $callerObj->action ] > 0 ) {
				$callerObj->baseAuth = true;
				return;
			}
			
			if ( isset( $callerObj->groupInfo['power']['advanced'][ $callerObj->action ] ) && $callerObj->groupInfo['power']['advanced'][ $callerObj->action ] > 0 ) {
				$callerObj->advancedAuth = true;
				return;
			}
			
		}
		
		public function assignGroupInfo($callerObj)
		{
			
			if ( empty( $callerObj->userInfo['uid'] ) ) {
				return;
			}
			
			Container::getInstance()->make( ViewFactory::class )->share( array(
				                                                             'menu'  => $callerObj->groupInfo['menu'] ,
				                                                             'power' => $callerObj->groupInfo['power'] ,
				                                                             'group' => $callerObj->groupInfo['group'] ,
			                                                             ) );
			
		}
		
		//随机产生六位数密码Begin
		public function randStr($len = 4 , $format = 'all')
		{
			switch ( $format ) {
				case 'all':
					$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-@#~';
				break;
				case 'char':
					$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz-@#~';
				break;
				case 'number':
					$chars = '0123456789';
				break;
				default :
					$chars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-@#~';
				break;
			}
			mt_srand( (double)microtime()*1000000*getmypid() );
			$rs = "";
			while ( strlen( $rs ) < $len ) {
				$rs .= substr( $chars , ( mt_rand()%strlen( $chars ) ) , 1 );
			}
			
			return $rs;
		}
		
	}
