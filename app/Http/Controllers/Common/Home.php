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
	
	use Illuminate\Http\Request;
	use App\Http\Middleware\Home\Init;
	use Illuminate\Container\Container;
	
	
	class Home extends BaseController
	{
		use AuthorizesRequests , DispatchesJobs , ValidatesRequests;
		
		public static $home;
		public        $cryptKey     = '-+[{somy68686809';
		public        $splitString  = 'q_Y_p';
		public        $userInfo;
		public        $groupInfo;
		public        $skin;
		public        $instructions;
		public        $path;
		public        $baseStatic;
		public        $action;
		public        $initInstance;
		public        $specialAuth  = false;
		public        $baseAuth     = false;
		public        $advancedAuth = false;
		public        $needLogin    = true;
		
		
		public function __construct(Request $request)
		{
			$template   = Container::getInstance()->make( 'config' )->get( 'home.template' );
			self::$home = $this;
			$this->skin = $template['dir'] . '.' . $template['skin'] . '.';
			defined( 'DS' ) or define( 'DS' , DIRECTORY_SEPARATOR );
			$this->middleware( 'App\Http\Middleware\Home\Init:' . __CLASS__ );
		}
		
		public static function getSelf()
		{
			return self::$home;
		}
		
		/**
		 * 解密
		 *
		 * @param string $plainText
		 * @return string
		 */
		public function decrypt($encryptedText , $key)
		{
			$cryptText   = base64_decode( $encryptedText );
			$ivSize      = mcrypt_get_iv_size( MCRYPT_RIJNDAEL_256 , MCRYPT_MODE_ECB );
			$iv          = mcrypt_create_iv( $ivSize , MCRYPT_DEV_URANDOM );
			$decryptText = mcrypt_decrypt( MCRYPT_RIJNDAEL_256 , $key , $cryptText , MCRYPT_MODE_ECB , $iv );
			return trim( $decryptText );
		}
		
		/**
		 * 加密
		 *
		 * @param string $plainText
		 * @return string
		 */
		public function encrypt($plainText , $key)
		{
			$ivSize      = mcrypt_get_iv_size( MCRYPT_RIJNDAEL_256 , MCRYPT_MODE_ECB );
			$iv          = mcrypt_create_iv( $ivSize , MCRYPT_DEV_URANDOM );
			$encryptText = mcrypt_encrypt( MCRYPT_RIJNDAEL_256 , $key , $plainText , MCRYPT_MODE_ECB , $iv );
			return trim( base64_encode( $encryptText ) );
		}
		
		/**
		 * openssl解密
		 *
		 * @param string $plainText
		 * @return string
		 */
		public function odecrypt($encryptedText , $key)
		{
			$o = new \extend\common\Openssl();
			return trim( $o->privateDecrypt( $encryptedText ) );
		}
		
		/**
		 * openssl加密
		 *
		 * @param string $plainText
		 * @return string
		 */
		public function oencrypt($plainText , $key)
		{
			$o = new \extend\common\Openssl();
			return $o->publicEncrypt( $plainText );
		}
	}
