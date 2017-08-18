<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	
	return array(
		
		'group' => array(
			'id'         => 1 ,
			'group_name' => '超级管理员' ,
		) ,
		
		'power' => array(
			'special'  => array(
				'message/webhook'            => 1 ,
				'configure/facebookcallback' => 1 ,
			) ,
			'advanced' => array(
				'index/index' => 1 ,
				'index/ceshi' => 1 ,
				
				'sns/index'       => 2 ,
				'sns/showrank'    => 2 ,
				'sns/historyrank' => 2 ,
				'sns/charts'      => 2 ,
				'sns/pie'         => 2 ,
				
				'content/index'    => 3 ,
				'content/facebook' => 3 ,
				'content/twitter'  => 3 ,
				'content/vk'       => 3 ,
				'content/status'   => 3 ,
				'content/pages'    => 3 ,
				
				'message/index' => 4 ,
				
				'user/lists'                      => 5 ,
				'user/statistics'                 => 5 ,
				'user/add'                        => 5 ,
				'user/edit'                       => 5 ,
				'user/toggle'                     => 5 ,
				'user/admin'                      => 5 ,
				'user/searchadmin'                => 5 ,
				'user/addadmin'                   => 5 ,
				'user/editadmin'                  => 5 ,
				'user/agency'                     => 5 ,
				'user/addagency'                  => 5 ,
				'user/editagency'                 => 5 ,
				'user/service'                    => 5 ,
				'user/addservice'                 => 5 ,
				'user/editservice'                => 5 ,
				'user/showcontent'                => 5 ,
				'user/packagemanager'             => 5 ,
				'user/edititem'                   => 5 ,
				'user/additem'                    => 5 ,
				'user/inputkeywords'              => 5 ,
				'user/childmanager'               => 5 ,
				'user/addchild'                   => 5 ,
				'user/editchild'                  => 5 ,
				'configure/conf'                  => 5 ,
				'configure/addnew'                => 5 ,
				'configure/add_save'              => 5 ,
				'configure/edit_save'             => 5 ,
				'configure/editinfo'              => 5 ,
				'configure/platformconf'          => 5 ,
				'configure/platformconf_editsave' => 5 ,
				
				/*				'monitor/taskstatus'              => 6 ,
								'monitor/serverstatus'            => 6 ,
								'monitor/serveradd'               => 6 ,
								'monitor/serveredit'              => 6 ,*/
				'server/index'                    => 6 ,
				'server/serveradd'                => 6 ,
				'server/serveredit'               => 6 ,
				'server/serverToggle'             => 6 ,
				'server/proxy_list'               => 6 ,
				
				'bbs/index'    => 7 ,
				'bbs/case'     => 7 ,
				'bbs/notebook' => 7 ,
				'bbs/meho'     => 7 ,
				
				
				'member/index' => 15 ,
			) ,
		
		) ,
		
		'menu' => array(
			
			'top'   => array(
				array( 'title' => '首页' , 'url' => '/' , 'type' => 2 ) ,/* 1 normal 2 common*/
				array( 'title' => '询盘互动' , 'url' => '/interact' , 'type' => 1 ) ,
				array( 'title' => '即时消息' , 'url' => '/message' , 'type' => 1 ) ,
				array( 'title' => '内容群发' , 'url' => '/content' , 'type' => 1 ) ,
				array( 'title' => '群组管理' , 'url' => '/group' , 'type' => 1 ) ,
				array( 'title' => '客户管理' , 'url' => '/user/admin' , 'type' => 1 ) ,
				array( 'title' => '服务器' , 'url' => '/server/index' , 'type' => 1 ) ,
				array( 'title' => '镁好社区' , 'url' => '/bbs' , 'type' => 2 ) ,
			) ,
			'left'  => array(
				1 => array(
					array( 'title' => 'SNS关键词排名' , 'url' => '/sns' , 'type' => 1 ) ,
					array( 'title' => '客户管理' , 'url' => '/user/lists' , 'type' => 1 ) ,
				) ,
				2 => array(
					array( 'title' => 'sns关键词排名' , 'url' => '/sns' , 'type' => 1 ) ,
					array( 'title' => '排名明细' , 'url' => '/sns/showrank' , 'type' => 1 ) ,
					array( 'title' => '历史排名' , 'url' => '/sns/historyrank' , 'type' => 1 ) ,
					array( 'title' => '达成数量走势图' , 'url' => '/sns/charts' , 'type' => 1 ) ,
					array( 'title' => '达成数量饼图' , 'url' => '/sns/pie' , 'type' => 1 ) ,
				) ,
				3 => array(
					array( 'title' => 'Facebook动态' , 'url' => '/content/facebook' , 'type' => 1 ) ,
					array( 'title' => 'Twitter推文' , 'url' => '/content/twitter' , 'type' => 1 ) ,
					array( 'title' => 'VK新闻' , 'url' => '/content/vk' , 'type' => 1 ) ,
					array( 'title' => '一键动态' , 'url' => '/content/status' , 'type' => 1 ) ,
					array( 'title' => '一键主页' , 'url' => '/content/pages' , 'type' => 1 ) ,
				) ,
				4 => array(
					array( 'title' => '即时消息' , 'url' => '/message' , 'type' => 1 ) ,
				) ,
				5 => array(
					array( 'title' => '管理员列表' , 'url' => '/user/admin' , 'type' => 1 ) ,
					array( 'title' => '代理商列表' , 'url' => '/user/agency' , 'type' => 1 ) ,
					array( 'title' => '客服列表' , 'url' => '/user/service' , 'type' => 1 ) ,
					array( 'title' => '用户列表' , 'url' => '/user/lists' , 'type' => 1 ) ,
					array( 'title' => '盈收统计' , 'url' => '/user/statistics' , 'type' => 1 ) ,
				) ,
				6 => array(
					array( 'title' => '任务执行状态' , 'url' => '/monitor/taskStatus' , 'type' => 1 ) ,
					array( 'title' => '服务器状态    ' , 'url' => '/monitor/serverStatus' , 'type' => 1 ) ,
				) ,
				7 => array(
					array( 'title' => '客户案例' , 'url' => '/bbs/case' , 'type' => 1 ) ,
					array( 'title' => '操作手册' , 'url' => '/bbs/notebook' , 'type' => 1 ) ,
					array( 'title' => '关于镁好' , 'url' => '/bbs/meho' , 'type' => 1 ) ,
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