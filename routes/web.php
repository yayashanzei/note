<?php
	
	/*
	|--------------------------------------------------------------------------
	| Web Routes
	|--------------------------------------------------------------------------
	|
	| Here is where you can register web routes for your application. These
	| routes are loaded by the RouteServiceProvider within a group which
	| contains the "web" middleware group. Now create something great!
	|
	*/
	
	Route::group( [ 'middleware' => 'App\Http\Middleware\Admin\Login' ] , function(){
		Route::get( '/admin' , 'Admin\Index@index' );
		Route::get( '/admin/login' , 'Admin\User@login' );
		Route::get( '/admin/test' , 'Admin\Index@test' );
		Route::get( '/admin/filter' , 'Admin\Index@filter' );
	} );
	
	
	Route::group( [ 'namespace' => 'Home' ] , function(){
		Route::get( '/' , 'Index@index' );
		Route::get( '/getnotelist' , 'Index@getNoteList' );
		Route::get( '/getnotecontent' , 'Index@getNoteContent' );
		Route::post( '/savenotecontent' , 'Index@saveNoteContent' );
		Route::post( '/changetitle' , 'Index@changeTitle' );
		Route::get( '/test' , 'Index@test' );
		Route::get( '/filter' , 'Index@filter' );
	} );
	
	Route::group( [ 'namespace' => 'Home' ] , function(){
		Route::get( '/ueditor/controller' , 'Ueditor@controller' );
		Route::post( '/ueditor/controller' , 'Ueditor@controller' );
	} );
	
	Route::group( [ 'namespace' => 'Home' ] , function(){
		Route::get( '/user/login' , 'User@login' );
		Route::post( '/user/login' , 'User@login' );
		Route::get( '/user/logout' , 'User@logout' );
		Route::post( '/user/logout' , 'User@logout' );
	} );
	
	Route::group( [ 'namespace' => 'Home' ] , function(){
		Route::get( '/captcha/entry' , 'Captcha@entry' );
		Route::get( '/captcha/check' , 'Captcha@check' );
	} );
	
	Route::group( [ 'namespace' => 'Home' ] , function(){
		Route::get( '/redirect/tip' , 'Redirect@tip' );
		Route::get( '/redirect/error' , 'Redirect@error' );
		Route::get( '/redirect/success' , 'Redirect@success' );
	} );
	