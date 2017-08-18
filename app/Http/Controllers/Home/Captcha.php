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
	use Illuminate\Container\Container;
	use think\captcha\Captcha as thinkCaptcha;
	
	class Captcha extends Home
	{
		use Construct;
		
		protected $config = array(
			'fontSize'  => 18 ,
			'length'    => 4 ,
			'useCurve'  => false ,
			'useNoise'  => false ,
			'imageW'    => 140 ,
			'imageH'    => 34 ,
			'bg'        => [ 8 , 200 , 201 ] , // 背景颜色
			'fontColor' => [ 255 , 255 , 255 ] ,
			'fontttf'   => '2.ttf' ,
		);
		
		public function __construct(Request $request)
		{
			$this->construct( $request );
			
			$captchaConfig = Container::getInstance()->make( 'config' )->get( 'home.captcha' );
			$this->config  = array_merge( $captchaConfig , $this->config );
		}
		
		public function entry(Request $request)
		{
			$captcha = new thinkCaptcha( $this->config );
			return $captcha->entry( '' , $request );
		}
		
		public function check(Request $request)
		{
			$captcha = new thinkCaptcha( $this->config );
			return $captcha->check( $request->get( 'verify' ) , '' , $request );
		}
		
	}
