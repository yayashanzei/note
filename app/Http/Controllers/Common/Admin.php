<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	
	namespace App\Http\Controllers\Common;
	
	use Illuminate\Foundation\Bus\DispatchesJobs;
	use Illuminate\Routing\Controller as BaseController;
	use Illuminate\Foundation\Validation\ValidatesRequests;
	use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
	
	class Admin extends BaseController
	{
		use AuthorizesRequests , DispatchesJobs , ValidatesRequests;
		
		protected $skin;
		
		public function __construct()
		{
			$this->skin = config( 'admin.template.dir' ) . '.' . config( 'admin.template.skin' );
		}
		
	}
