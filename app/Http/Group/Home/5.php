<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	return array(
		
		'group' => array(
			'id'         => 5 ,
			'group_name' => '用户(主)' ,
		) ,
		
		'power' => array(
			
			'special' => array(
				'message/webHook'            => 1 ,
				'configure/facebookcallback' => 1 ,
			) ,
			
			'advanced' => array(
				'index/index' => 1 ,
				
				'report/index' => 2 ,
				
				'bbs/index'    => 3 ,
				'bbs/case'     => 3 ,
				'bbs/notebook' => 3 ,
				'bbs/meho'     => 3 ,
				
				'user/editchildpassword' => 4 ,
				
				'member/index'    => 5 ,
				'member/record'   => 5 ,
				'member/child'    => 5 ,
				'member/keywords' => 5 ,
				'member/addwords' => 5 ,
				
				'analysis/index'     => 6 ,
				'analysis/twitter'   => 6 ,
				'analysis/vk'        => 6 ,
				'analytics/index'    => 6 ,
				'analytics/facebook' => 6 ,
				'analytics/linkedin' => 6 ,
			) ,
		
		) ,
		
		'menu' => array(
			
			'top'   => array(
				array( 'title' => '首页' , 'url' => '/' , 'type' => 2 ) ,/* 1 normal 2 common*/
				//array( 'title' => '数据报告' , 'url' => '/report' , 'type' => 2 ) ,
				array( 'title' => '镁好社区' , 'url' => '/bbs' , 'type' => 2 ) ,
			) ,
			'left'  => array(
				2 => array(
					array( 'title' => '数据报告' , 'url' => '/report' , 'type' => 1 ) ,
				) ,
				3 => array(
					array( 'title' => '客户案例' , 'url' => '/bbs/case' , 'type' => 1 ) ,
					array( 'title' => '操作手册' , 'url' => '/bbs/notebook' , 'type' => 1 ) ,
					array( 'title' => '关于镁好' , 'url' => '/bbs/meho' , 'type' => 1 ) ,
				) ,
				5 => array(
					array( 'title' => '基本资料' , 'url' => '/member' , 'type' => 1 ) ,
					array( 'title' => '子账户管理' , 'url' => '/member/child' , 'type' => 1 ) ,
					array( 'title' => '设置关键词' , 'url' => '/member/addwords' , 'type' => 1 ) ,
				) ,
				6 => array(
					array( 'title' => 'facebook' , 'url' => '/analytics/facebook' , 'type' => 1 ) ,
					array( 'title' => 'twitter' , 'url' => '/analysis/twitter' , 'type' => 1 ) ,
					array( 'title' => 'vk' , 'url' => '/analysis/vk' , 'type' => 1 ) ,
					array( 'title' => 'linkedin' , 'url' => '/analytics/linkedin' , 'type' => 1 ) ,
				) ,
			
			) ,
			'right' => array() ,
		
		) ,
		'db'   => array(
			'user' => array( 'where' , 'uid' ) ,
		) ,
	);