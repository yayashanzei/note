<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	
	namespace App\Http\Middleware\Admin;
	
	use Closure;
	
	class Login
	{
		public function handle($request , Closure $next , $guard = null)
		{
			return $next( $request );
		}
	}
