<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	
	namespace App\Http\Controllers\Admin;
	
	use Illuminate\Http\Request;
	use App\Http\Controllers\Common\Admin;
	
	class Index extends Admin
	{
		public function index(Request $request)
		{
			echo __CLASS__ . '==' . __FUNCTION__;
			
			return view( 'main' , [ 'blog' => 'my first blog by laravel' ] );
		}
		
		public function test(Request $request)
		{
			$request->session()->put( 'userId' , 2 );
		}
		
		public function filter(Request $request)
		{
			$this->validate( $request , [
				'title' => 'required|max:10' ,
				'body'  => 'required' ,
			] );
			
			print_r( $_SESSION );
			exit;
			echo $request->session()->get();
			exit;
			var_dump( $request );
			exit;
			
			var_dump( $errors->all() );
			exit;
		}
		
	}
