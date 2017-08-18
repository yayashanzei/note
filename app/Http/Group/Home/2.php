<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	return array(
		
		'group' => array(
			'id'         => 2 ,
			'group_name' => '管理员' ,
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
				
				'user/agency'       => 5 ,
				'user/searchagency' => 5 ,
				'user/editagency'   => 5 ,
				'user/addagency'    => 5 ,
				'user/toggle'       => 5 ,
				'user/enable'       => 5 ,
				
				'member/index' => 15 ,
			) ,
		
		) ,
		
		'menu' => array(
			
			'top' => array(
				array( 'title' => '首页' , 'url' => '/member' , 'type' => 2 ) ,/* 1 normal 2 common*/
				array( 'title' => '客户管理' , 'url' => '/user/agency' , 'type' => 1 ) ,
				array( 'title' => '镁好社区' , 'url' => '/bbs' , 'type' => 2 ) ,
			) ,
			
			'left'  => array(
				1 => array() ,
				3 => array(
					array( 'title' => '客户案例' , 'url' => '/bbs/case' , 'type' => 1 ) ,
					array( 'title' => '操作手册' , 'url' => '/bbs/notebook' , 'type' => 1 ) ,
					array( 'title' => '关于镁好' , 'url' => '/bbs/meho' , 'type' => 1 ) ,
				) ,
				
				5  => array(
					array( 'title' => '代理商列表' , 'url' => '/user/agency' , 'type' => 1 ) ,
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