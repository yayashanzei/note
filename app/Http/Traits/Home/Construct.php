<?php
	/**
	 * Created by PhpStorm.
	 * User: icebr:ice_br2046@163.com
	 * Date: 17-7-20
	 * Time: 下午4:31
	 */
	
	namespace App\Http\Traits\Home;
	
	use Illuminate\Container\Container;
	use Illuminate\Http\Request;
	
	trait Construct
	{
		
		public function construct(Request $request)
		{
			parent::__construct( $request );
		}
		
		/**
		 * Exception Handler
		 * @param  \Exception|\Throwable $e
		 */
		public function appException($e)
		{
			
			if ( !$e instanceof \Exception ) {
				//$this->appError($e);
			}
			
			$jump = new Jump();
			
			$error = array(
				'file'    => $e->getFile() ,
				'line'    => $e->getLine() ,
				'message' => $e->getMessage() ,
				'code'    => $e->getCode() ,
			);
			
			$rs1 = preg_match( "/Call to a member function .*? on null/Uism" , $error['message'] );
			
			if ( $rs1 > 0 ) {
				$jump->productRuntimeError( 'facebook帐号异常，请检查或者联系客服人员处理后再尝试访问！' , '/' , null , 4 );
				exit;
			}
			
			$rs2 = preg_match( "/Base table or view not found: 1146 Table" , $error['message'] );
			
			if ( $rs2 > 0 ) {
				$jump->productRuntimeError( '模块儿调试中，敬请期待！' , '/' );
				exit;
			}
			
			$jump->productRuntimeError( $error['message'] , '/' );
		}
		
		/**
		 * Error Handler
		 * @param  integer $errno   错误编号
		 * @param  integer $errstr  详细错误信息
		 * @param  string  $errfile 出错的文件
		 * @param  integer $errline 出错行号
		 * @param array    $errcontext
		 * @throws ErrorException
		 */
		public function appError($errno , $errstr , $errfile = '' , $errline = 0 , $errcontext = [])
		{
			echo $errstr;
			exit;
			$exception = new ErrorException( $errno , $errstr , $errfile , $errline , $errcontext );
			if ( error_reporting() & $errno ) {
				// 将错误信息托管至 think\exception\ErrorException
				throw $exception;
			} else {
				self::getExceptionHandler()->report( $exception );
			}
		}
		
		/**
		 * Shutdown Handler
		 */
		public function appShutdown()
		{
			if ( !is_null( $error = error_get_last() ) && self::isFatal( $error['type'] ) ) {
				// 将错误信息托管至think\ErrorException
				$exception = new ErrorException( $error['type'] , $error['message'] , $error['file'] , $error['line'] );
				
				self::appException( $exception );
			}
			
		}
		
		
	}