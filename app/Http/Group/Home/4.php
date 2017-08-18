<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	return array(
		
		'group' => array(
			'id'         => 4 ,
			'group_name' => '客服' ,
		) ,
		
		'power' => array(
			
			'special' => array(
				'message/webHook'            => 1 ,
				'configure/facebookcallback' => 1 ,
			) ,
			
			'advanced' => array(
				'index/index' => 1 ,
				
				'bbs/index'    => 3 ,
				'bbs/case'     => 3 ,
				'bbs/notebook' => 3 ,
				'bbs/meho'     => 3 ,
				
				'user/lists'          => 5 ,
				'user/find_user'      => 5 ,
				'user/casual'         => 5 ,
				'user/search'         => 5 ,
				'user/editcasual'     => 5 ,
				'user/insertcasual'   => 5 ,
				'user/add'            => 5 ,
				'user/edit'           => 5 ,
				'user/childmanager'   => 5 ,
				'user/addchild'       => 5 ,
				'user/editchild'      => 5 ,
				'user/statistics'     => 5 ,
				'user/packagemanager' => 5 ,
				'user/additem'        => 5 ,
				'user/edititem'       => 5 ,
				'user/toggleitem'     => 5 ,
				'user/showcontent'    => 5 ,
				'user/inputkeywords'  => 5 ,
				'user/toggle'         => 5 ,
				'user/enable'         => 5 ,
				'user/triallist'      => 5 ,
				'user/trialedit'      => 5 ,
				'user/trialapply'     => 5 ,
				'user/trialtrade'     => 5 ,
				'user/trialexport'    => 5 ,
				'user/trialfind'      => 5 ,
				
				'configure/conf'                  => 5 ,
				'configure/addnew'                => 5 ,
				'configure/add_save'              => 5 ,
				'configure/editinfo'              => 5 ,
				'configure/edit_save'             => 5 ,
				'configure/platformconf'          => 5 ,
				'configure/platformconf_editsave' => 5 ,
				
				'member/index' => 15 ,
			) ,
		
		) ,
		
		'menu' => array(
			
			'top'   => array(
				array( 'title' => '首页' , 'url' => '/member' , 'type' => 2 ) ,/* 1 normal 2 common*/
				array( 'title' => '用户管理' , 'url' => '/user/lists' , 'type' => 1 ) ,
				array( 'title' => '镁好社区' , 'url' => '/bbs' , 'type' => 2 ) ,
			) ,
			'left'  => array(
				1 => array() ,
				3 => array(
					array( 'title' => '客户案例' , 'url' => '/bbs/case' , 'type' => 1 ) ,
					array( 'title' => '操作手册' , 'url' => '/bbs/notebook' , 'type' => 1 ) ,
					array( 'title' => '关于镁好' , 'url' => '/bbs/meho' , 'type' => 1 ) ,
				) ,
				
				5 => array(
					array( 'title' => '用户列表' , 'url' => '/user/lists' , 'type' => 1 ) ,
					/*array( 'title' => '试用管理' , 'url' => '/user/casual' , 'type' => 1 ) ,*/
					array( 'title' => '申请管理' , 'url' => '/user/trialList' , 'type' => 1 ) ,
				) ,
				
				15 => array(
					array( 'title' => '基本资料' , 'url' => '/member' , 'type' => 1 ) ,
				) ,
			) ,
			'right' => array() ,
		
		) ,
		'db'   => array(
			'user' => array( 'where' , 'uid' ) ,
		) ,
	);