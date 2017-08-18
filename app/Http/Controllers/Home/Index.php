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
	use Illuminate\Support\Facades\DB;
	use Illuminate\Container\Container;
	use Illuminate\Contracts\View\Factory as ViewFactory;
	
	class Index extends Home
	{
		use Construct;
		
		public function __construct(Request $request)
		{
			$this->construct( $request );
		}
		
		public function index(Request $request)
		{
			$this->initLeft( $request );
			$notes = $this->getNoteList( $request );
			return view( $this->skin . 'index.main' , [
				'blog'  => 'my first blog by laravel' ,
				'skin'  => $this->skin ,
				'path'  => $this->path ,
				'notes' => $notes ,
			] );
		}
		
		public function getNoteList(Request $request)
		{
			$categoryId = $request->get( 'id' );
			
			if ( empty( $categoryId ) ) {
				$notes = DB::table( 'note' )->where( array( 'uid' => $this->userInfo['uid'] ) )->orderBy( 'create_time' , 'desc' )->limit( 20 )->get( [ 'id' , 'title' , 'name' , 'create_time' , 'category_id' ] )->toArray();
				return $notes;
			} else {
				$notes = DB::table( 'note' )->where( array( 'category_id' => $categoryId , 'uid' => $this->userInfo['uid'] ) )->get( [ 'id' , 'title' , 'name' , 'create_time' , 'category_id' ] )->toArray();
			}
			
			return json_encode( $notes );
			
		}
		
		
		public function getNoteContent(Request $request)
		{
			$noteId = $request->get( 'id' );
			
			if ( empty( $noteId ) ) {
				echo 'error';
				exit;
			}
			
			$note = DB::table( 'note' )->where( array( 'id' => $noteId , 'uid' => $this->userInfo['uid'] ) )->first( [ 'id' , 'title' , 'name' , 'create_time' , 'update_time' , 'category_id' , 'content' ] );
			
			if ( $note === false || empty( $note ) ) {
				echo 'error';
				exit;
			}
			
			$note = (array)$note;
			
			$content = DB::table( 'content' )->where( 'id' , $note['content'] )->first( [ 'id' , 'content' ] );
			
			$note['content'] = $content->content;
			
			return json_encode( $note );
			
		}
		
		public function saveNoteContent(Request $request)
		{
			$noteId      = $request->get( 'id' );
			$noteContent = $request->get( 'content' );
			
			if ( empty( $noteId ) ) {
				echo 'error';
				exit;
			}
			
			if(empty($noteContent)){
				$noteContent = '';
			}
			
			try {
				$note = DB::table( 'note' )->where( array( 'id' => $noteId , 'uid' => $this->userInfo['uid'] ) )->first( [ 'id' , 'title' , 'name' , 'content' ] );
				
				if ( $note === false || empty( $note ) ) {
					echo 'error';
					exit;
				}
				
			} catch ( \Exception $exception ) {
				echo 'error';
				exit;
			}
			
			$note = (array)$note;
			
			$updateTime          = substr( microtime() , -10 );
			$note['update_time'] = $updateTime;
			
			DB::transaction( function() use ($noteId , $note , $noteContent , $updateTime){
				DB::table( 'note' )->where( array( 'id' => $noteId , 'uid' => $this->userInfo['uid'] ) )->update( array( 'update_time' => $updateTime ) );
				DB::table( 'content' )->where( 'id' , $note['content'] )->update( array( 'content' => $noteContent ) );
			} , 3 );
			
			$note['content'] = $noteContent;
			
			return json_encode( $note );
			
		}
		
		public function changeTitle(Request $request)
		{
			$noteId    = $request->get( 'id' );
			$noteTitle = $request->get( 'title' );
			
			if ( empty( $noteId ) ) {
				echo 'error';
				exit;
			}
			
			try {
				$updateTime = substr( microtime() , -10 );
				$note       = DB::table( 'note' )->where( array( 'id' => $noteId , 'uid' => $this->userInfo['uid'] ) )->update( array( 'title' => $noteTitle , 'update_time' => $updateTime ) );
			} catch ( \Exception $exception ) {
				echo 'error';
				exit;
			}
			
			return json_encode( array( 'id' => $noteId , 'title' => $noteTitle , 'update_time' => $updateTime ) );
			
		}
		
		protected function initLeft(Request $request)
		{
			$rs = $this->getCategory();
			Container::getInstance()->make( ViewFactory::class )->share( 'tree' , $rs );
		}
		
		protected function getCategory()
		{
			$list = DB::table( 'category' )->where( array( 'uid' => $this->userInfo['uid'] , 'status' => 1 ) )->get( [ 'id' , 'name' , 'title' , 'uid' , 'up_uid' , 'origin_uid' , 'pid' , 'tid' , 'allow_publish' ] )->toArray();
			
			$list = $this->categoryList( $list );
			
			return json_encode( $list );
		}
		
		
		/**
		 * 把返回的数据集转换成Tree
		 */
		protected function categoryList($list , $pk = 'id' , $pid = 'pid' , $child = 'children' , $root = 0)
		{
			// 创建Tree
			$tree = array();
			if ( is_array( $list ) ) {
				
				// 创建基于主键的数组引用
				$refer = array();
				foreach ( $list as $key => $data ) {
					$list[ $key ]            = (array)$data;
					$list[ $key ]['catName'] = $list[ $key ]['name'];
					$list[ $key ]['name']    = $list[ $key ]['title'];
					$list[ $key ]['open']    = true;
					//$list[ $key ]['nocheck']    = true;
					$refer[ $data->$pk ] =& $list[ $key ];
				}
				
				foreach ( $list as $key => $data ) {
					// 判断是否存在parent
					$parentId = $data[ $pid ];
					if ( $root == $parentId ) {
						$tree[] =& $list[ $key ];
					} else {
						if ( isset( $refer[ $parentId ] ) ) {
							//$refer[ $parentId ]['nocheck'] = false;
							$parent             =& $refer[ $parentId ];
							$parent[ $child ][] =& $list[ $key ];
						}
					}
				}
			}
			
			return $tree;
		}
		
	}
