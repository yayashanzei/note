<?php
	
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-24
	 * Time: 下午1:57
	 */
	
	namespace App\Http\Controllers\Home;
	
	use Illuminate\Http\Request;
	use App\Http\Controllers\Common\Home;
	use App\Http\Traits\Home\Construct;
	use Illuminate\Contracts\View\Factory as ViewFactory;
	use Illuminate\Container\Container;
	use App\Http\Controllers\Home\Captcha;
	
	class Test extends Home
	{
		use Construct;
		
		public function __construct(Request $request)
		{
			$this->construct( $request );
		}
		
		public function test()
		{
			/*var_dump($this);exit;
			$skin = $request->attributes->get('skin');
			var_dump($skin);exit;
			//var_dump( $request->attributes->all() );
			exit;
			echo __CLASS__ . '==' . __FUNCTION__;
			
			echo $this->skin;*/
			//exit;
			/*echo $request->path().'<br/>';
			echo $request->url().'<br/>';
			echo $request->fullUrl().'<br/>';
			var_dump($request->all());
			echo '<br/>';
			var_dump($request->cookie());
			exit;
			var_dump($request);exit;
			echo __CLASS__.'=='.__FUNCTION__;*/
			//return response('Hello World', 200)->header('Content-Type', 'text/plain');
			//return redirect()->action('Index@test',['id'=>2]);
			//echo $request->session()->get('userId');exit;
			//Container::getInstance()->singleton('App\Http\Middleware\Home\Init');
			//$this->initInstance = Container::getInstance()->make('App\Http\Middleware\Home\Init');
		}
	}
	