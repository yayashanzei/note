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
	
	class Redirect extends Home
	{
		use Construct;
		
		public function __construct(Request $request)
		{
			$this->construct( $request );
		}
		
		public function tip(Request $request)
		{
			$info = $request->all();
			
			return view( $this->skin . 'redirect.tip' , [
				'title' => '跳转提示' ,
				'skin'  => $this->skin ,
				'path'  => $this->path ,
				'code'  => isset( $info['code'] ) ? $info['code'] : 2 ,
				'msg'   => isset( $info['msg'] ) ? $info['msg'] : '未知错误' ,
				'url'   => isset( $info['url'] ) ? $info['url'] : '/' ,
				'wait'  => isset( $info['wait'] ) ? $info['wait'] : 2 ,
			] );
		}
		
	}
