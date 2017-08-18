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
	use App\Http\Traits\Admin\Construct;
	
	class User extends Admin
	{
		use Construct;
		
		public function __construct()
		{
			$this->construct();
		}
		
		public function login(Request $request)
		{
			
			echo __CLASS__ . '==' . __FUNCTION__;
			
			echo $this->skin;
			exit;
			
			return view( $this->skin . '.main' , [ 'blog' => 'my first blog by laravel' ] );
		}
		
	}
