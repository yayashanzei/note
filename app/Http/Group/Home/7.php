<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	return array(
		
		'group' => array(
			'id'         => 7 ,
			'group_name' => '试用账号' ,
		) ,
		
		'power' => array(
			
			'special' => array(
				'message/webHook'            => 1 ,
				'configure/facebookcallback' => 1 ,
				'configure/linkedincallback' => 1 ,
			) ,
			
			'advanced' => array(
				'index/index' => 1 ,
				
				'sns/index'       => 2 ,
				'sns/showrank'    => 2 ,
				'sns/historyrank' => 2 ,
				'sns/charts'      => 2 ,
				'sns/pie'         => 2 ,
				
				'content/index'            => 3 ,
				'content/facebook'         => 3 ,
				'content/twitter'          => 3 ,
				'content/vk'               => 3 ,
				'content/linkedin'         => 3 ,
				'content/google'           => 3 ,
				'content/status'           => 3 ,
				'content/getstatus'        => 3 ,
				'content/getfbstatus'      => 3 ,
				'content/getttstatus'      => 3 ,
				'content/getvkstatus'      => 3 ,
				'content/uploadpic'        => 3 ,
				'content/uploadpicfb'      => 3 ,
				'content/uploadpictt'      => 3 ,
				'content/uploadpicvk'      => 3 ,
				'content/publishstatus'    => 3 ,
				'content/publishfbstatus'  => 3 ,
				'content/publishttstatus'  => 3 ,
				'content/publishvkstatus'  => 3 ,
				'content/publishlnstatus'  => 3 ,
				'content/publishggstatus'  => 3 ,
				'content/pages'            => 3 ,
				'content/fbpages'          => 3 ,
				'content/vkpages'          => 3 ,
				'content/lnpages'          => 3 ,
				'content/getfbpages'       => 3 ,
				'content/getvkpages'       => 3 ,
				'content/getpagecontent'   => 3 ,
				'content/getfbpagecontent' => 3 ,
				'content/getvkpagecontent' => 3 ,
				'content/uploadpicpages'   => 3 ,
				'content/uploadpicfbpages' => 3 ,
				'content/uploadpicvkpages' => 3 ,
				'content/publishpage'      => 3 ,
				'content/publishfbpages'   => 3 ,
				'content/publishvkpages'   => 3 ,
				'content/publishlnpages'   => 3 ,
				'content/draft'            => 3 ,
				'content/restore'          => 3 ,
				'content/deldraft'         => 3 ,
				
				'message/index'             => 4 ,
				'message/getreceivedglobal' => 4 ,
				'message/openchatroom'      => 4 ,
				'message/getonereceived'    => 4 ,
				'message/send'              => 4 ,
				'message/group'             => 4 ,
				'message/addgroup'          => 4 ,
				'message/editmarkname'      => 4 ,
				'message/grouping'          => 4 ,
				'message/delgroup'          => 4 ,
				'message/multisend'         => 4 ,
				'message/one'               => 4 ,
				
				'group/index'           => 7 ,
				'group/facebook'        => 7 ,
				'group/vk'              => 7 ,
				'group/google'          => 7 ,
				'group/status'          => 7 ,
				'group/publishfbstatus' => 7 ,
				'group/publishvkstatus' => 7 ,
				'group/publishggstatus' => 7 ,
				'group/publishstatus'   => 7 ,
				'group/draft'           => 7 ,
				'group/restore'         => 7 ,
				'group/deldraft'        => 7 ,
				
				'bbs/index' => 8 ,
				
				'interact/index'     => 9 ,
				'interact/timeline'  => 9 ,
				'interact/person'    => 9 ,
				'interact/page'      => 9 ,
				'interact/group'     => 9 ,
				'interact/reply'     => 9 ,
				'interact/getlikers' => 9 ,
				'interact/like'      => 9 ,
				'interact/test'      => 9 ,
				
				'member/index'            => 10 ,
				'member/video'            => 10 ,
				'member/picture'          => 10 ,
				'member/drafts'           => 10 ,
				'member/addvideo'         => 10 ,
				'member/addpic'           => 10 ,
				'member/save_pic'         => 10 ,
				'member/add_save'         => 10 ,
				'member/save_video'       => 10 ,
				'member/add_save_video'   => 10 ,
				'member/delete_video'     => 10 ,
				'member/delete_pic'       => 10 ,
				'member/material'         => 10 ,
				'member/list_albums'      => 10 ,
				'member/add_albums'       => 10 ,
				'member/delete_albums'    => 10 ,
				'member/bind'             => 10 ,
				'member/bindfb'           => 10 ,
				'member/bindgg'           => 10 ,
				'member/bindln'           => 10 ,
				'member/bindtt'           => 10 ,
				'member/bindvk'           => 10 ,
				'member/bindtube'         => 10 ,
				'member/bindpin'          => 10 ,
				'member/bindggcallback'   => 10 ,
				'member/bindttcallback'   => 10 ,
				'member/bindlncallback'   => 10 ,
				'member/bindfbcallback'   => 10 ,
				'member/bindvkcallback'   => 10 ,
				'member/bindtubecallback' => 10 ,
				'member/bindpincallback'  => 10 ,
				'member/bindaccount'      => 10 ,
				'member/help'             => 10 ,
				'member/revoketoken'      => 10 ,
				'member/removebind'       => 10 ,
				
				'dig/index'          => 11 ,
				'dig/screen'         => 11 ,
				'dig/country'        => 11 ,
				'dig/chb'            => 11 ,
				'dig/check_catch'    => 11 ,
				'dig/email'          => 11 ,
				'dig/export'         => 11 ,
				'dig/send_email'     => 11 ,
				'dig/resume'         => 11 ,
				'dig/history'        => 11 ,
				'dig/t_search'       => 11 ,
				'dig/t_follow'       => 11 ,
				'dig/t_forward'      => 11 ,
				'dig/t_reply'        => 11 ,
				'dig/m_search'       => 11 ,
				'dig/l_search'       => 11 ,
				'dig/f_search'       => 11 ,
				'dig/v_search'       => 11 ,
				'dig/g_search'       => 11 ,
				'analysis/index'     => 12 ,
				'analysis/twitter'   => 12 ,
				'analysis/vk'        => 12 ,
				'analytics/index'    => 12 ,
				'analytics/facebook' => 12 ,
				'analytics/linkedin' => 12 ,
				
				'bidding/index' => 13 ,
				
				'bbs/index'    => 14 ,
				'bbs/case'     => 14 ,
				'bbs/notebook' => 14 ,
				'bbs/meho'     => 14 ,
				
				'material'       => 15 ,
				'material/index' => 15 ,
				
				'index/getnotelist' => 16 ,
			
			) ,
		
		) ,
		
		'menu' => array(
			
			'top'   => array(
				array( 'title' => '首页' , 'url' => '/' , 'type' => 2 ) ,/* 1 normal 2 common*/
				array( 'title' => '询盘互动' , 'url' => '/interact?type=1' , 'type' => 1 ) ,
				array( 'title' => '即时消息' , 'url' => '/message' , 'type' => 1 ) ,
				array( 'title' => '内容群发' , 'url' => '/content' , 'type' => 1 ) ,
				array( 'title' => '发现好友' , 'url' => '/dig/t_search' , 'type' => 1 ) ,
				array( 'title' => '成效分析' , 'url' => '/analytics' , 'type' => 1 ) ,
				/*
				array( 'title' => '素材市场' , 'url' => '/material' , 'type' => 1 ) ,
				array( 'title' => '竞价管理' , 'url' => '/bidding' , 'type' => 1 ) ,
				array( 'title' => '镁好社区' , 'url' => '/bbs' , 'type' => 2 ) ,
				*/
			) ,
			'left'  => array(
				
				1  => array(
					array( 'title' => 'SNS关键词排名' , 'url' => '/sns' , 'type' => 1 ) ,
					array( 'title' => '客户管理' , 'url' => '/user/lists' , 'type' => 1 ) ,
				) ,
				2  => array(
					array( 'title' => 'sns关键词排名' , 'url' => '/sns' , 'type' => 1 ) ,
					array( 'title' => '排名明细' , 'url' => '/sns/showrank' , 'type' => 1 ) ,
					array( 'title' => '历史排名' , 'url' => '/sns/historyrank' , 'type' => 1 ) ,
					array( 'title' => '达成数量走势图' , 'url' => '/sns/charts' , 'type' => 1 ) ,
					array( 'title' => '达成数量饼图' , 'url' => '/sns/pie' , 'type' => 1 ) ,
				) ,
				3  => array(
					array( 'title' => 'Facebook动态' , 'url' => '/content/facebook' , 'type' => 1 ) ,
					array( 'title' => 'Twitter推文' , 'url' => '/content/twitter' , 'type' => 1 ) ,
					array( 'title' => 'VK新闻' , 'url' => '/content/vk' , 'type' => 1 ) ,
					array( 'title' => 'Linkedin动态' , 'url' => '/content/linkedin' , 'type' => 1 ) ,
					array( 'title' => '一键动态' , 'url' => '/content/status' , 'type' => 1 ) ,
					array( 'title' => '一键主页' , 'url' => '/content/pages' , 'type' => 1 ) ,
					array( 'title' => 'Facebook主页' , 'url' => '/content/fbpages' , 'type' => 1 ) ,
					array( 'title' => 'VK主页' , 'url' => '/content/vkpages' , 'type' => 1 ) ,
					array( 'title' => 'Linkedin主页' , 'url' => '/content/lnpages' , 'type' => 1 ) ,
				) ,
				4  => array(
					array( 'title' => '即时消息' , 'url' => '/message' , 'type' => 1 ) ,
				) ,
				7  => array(
					array( 'title' => 'facebook群组' , 'url' => '/group/facebook' , 'type' => 1 ) ,
					array( 'title' => 'vk群组' , 'url' => '/group/vk' , 'type' => 1 ) ,
					array( 'title' => '一键群组' , 'url' => '/group/status' , 'type' => 1 ) ,
				) ,
				8  => array(
					array( 'title' => '关于镁好' , 'url' => '/somy/index' , 'type' => 1 ) ,
				) ,
				9  => array(
					array( 'title' => '个人动态' , 'url' => '/interact?type=1' , 'type' => 1 ) ,
					array( 'title' => '主页动态' , 'url' => '/interact/page?type=1' , 'type' => 1 ) ,
					array( 'title' => '群组动态' , 'url' => '/interact/group?type=1' , 'type' => 1 ) ,
					array( 'title' => '时间线' , 'url' => '/interact/timeLine/?type=5' , 'type' => 1 ) ,
				) ,
				10 => array(
					array( 'title' => '基本资料' , 'url' => '/member' , 'type' => 1 ) ,
					array( 'title' => '视频管理' , 'url' => '/member/video' , 'type' => 1 ) ,
					array( 'title' => '图片管理' , 'url' => '/member/picture' , 'type' => 1 ) ,
					array( 'title' => '素材管理' , 'url' => '/member/material' , 'type' => 1 ) ,
				) ,
				11 => array(
					array( 'title' => '发现好友' , 'url' => '/dig/t_search' , 'type' => 1 ) ,
				) ,
				12 => array(
					array( 'title' => 'facebook' , 'url' => '/analytics/facebook' , 'type' => 1 ) ,
					array( 'title' => 'vk' , 'url' => '/analysis/vk' , 'type' => 1 ) ,
					array( 'title' => 'twitter' , 'url' => '/analysis/twitter' , 'type' => 1 ) ,
					array( 'title' => 'linkedin' , 'url' => '/analytics/linkedin' , 'type' => 1 ) ,
				) ,
				13 => array(
					array( 'title' => '竟价管理' , 'url' => '/bidding' , 'type' => 1 ) ,
				) ,
				14 => array(
					array( 'title' => '客户案例' , 'url' => '/bbs/case' , 'type' => 1 ) ,
					array( 'title' => '操作手册' , 'url' => '/bbs/notebook' , 'type' => 1 ) ,
					array( 'title' => '关于镁好' , 'url' => '/bbs/meho' , 'type' => 1 ) ,
				) ,
				15 => array(
					array( 'title' => '内容' , 'url' => '/material' , 'type' => 1 ) ,
					array( 'title' => '图片' , 'url' => '/material' , 'type' => 1 ) ,
				) ,
			) ,
			'right' => array() ,
		
		) ,
		'db'   => array(
			'user' => array( 'where' , 'uid' ) ,
		) ,
	);
