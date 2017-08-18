<?php
	
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-24
	 * Time: 下午5:02
	 */
	
	namespace App\Http\Controllers\Home;
	
	use Illuminate\Http\Request;
	use App\Http\Controllers\Common\Home;
	use App\Http\Traits\Home\Construct;
	use Illuminate\Contracts\View\Factory as ViewFactory;
	use Illuminate\Container\Container;
	use Illuminate\Support\Facades\Validator;
	use Illuminate\Support\Facades\Response;
	use App\Http\Controllers\Home\Captcha;
	use Illuminate\Contracts\Cookie\Factory as CookieFactory;
	
	class Ajax extends Home
	{
		use Construct;
		
		public function __construct(Request $request)
		{
			$this->construct( $request );
		}
		
		public function success($content , array $option = array())
		{
			
			!$content ? $content = '操作成功！' : true;
			
			$_config = array(
				'ask'   => 98 ,
				'title' => false ,
				'time'  => 2000 ,
				'icon'  => 6 ,
			);
			
			$_config['content'] = $content;
			!empty( $option ) ? $_config = array_merge( $_config , $option ) : true;
			
			Response::send( $_config , 'json' );
			exit;
		}
		
		public function error($content , array $option = array())
		{
			!$content ? $content = '操作失败！' : true;
			
			$_config = array(
				'ask'   => 98 ,
				'title' => false ,
				'time'  => 2000 ,
				'icon'  => 5 ,
			);
			
			$_config['content'] = $content;
			!empty( $option ) ? $_config = array_merge( $_config , $option ) : true;
			
			Response::send( $_config , 'json' );
			exit;
		}
		
		
		public function tip($content , array $option = array())
		{
			!$content ? $content = '操作失败！' : true;
			
			$_config = array(
				'ask'      => 97 ,
				'title'    => false ,
				'time'     => 1500 ,
				'icon'     => 0 ,
				'shift'    => 4 ,
				'callback' => false ,
				'sortBox'  => '#sort_list' ,
			);
			
			$_config['content'] = $content;
			!empty( $option ) ? $_config = array_merge( $_config , $option ) : true;
			
			Response::send( $_config , 'json' );
			exit;
		}
		
		public function send(array $option = array())
		{
			
			$_config = array(
				'status'  => false ,
				'message' => false ,
				'goto'    => '/' ,
			);
			
			!empty( $option ) ? $_config = array_merge( $_config , $option ) : true;
			
			if ( isset( $_config['cookie'] ) && !empty( $_config['cookie'] ) ) {
				$_cookie = Container::getInstance()->make( CookieFactory::class )->make( $_config['cookie']['name'] , $_config['cookie']['value'] , $_config['cookie']['time'] );
			}
			
			return !isset($_cookie) ? Response::json( $_config ) : Response::json( $_config )->withCookie( $_cookie );
		}
	}