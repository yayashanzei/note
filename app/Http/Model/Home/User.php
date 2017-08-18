<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午6:08
	 */
	
	namespace App\Http\Model\Home;
	
	use Illuminate\Database\Eloquent\Model;
	
	class User extends Model
	{
		protected $table      = 'user';
		protected $primaryKey = 'uid';
		
		/* 用户的基本信息关联到用户的详情 */
		
		public function userInfo()
		{
			return $this->hasOne( 'App\Http\Model\Home\UserInfo' , 'uid' , 'uid' );
		}
	}
	
	class UserInfo extends Model
	{
		protected $table      = 'user_info';
		protected $primaryKey = 'uid';
		
		/* 用户的详情关联到用户的基本信息 */
		public function user()
		{
			return $this->belongsTo( 'App\Http\Model\Home\User' , 'uid' , 'uid' );
		}
	}
