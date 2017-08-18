/**
 * Created by PhpStorm.
 * User: icebr:ice_br2046@163.com
 * Date: 17-7-26
 * Time: 上午8:50
 */

layui.define( [ 'element' ], function( exports ) {
	exports( 'home', {} );
} );
var ue, layerFlag, noParseContent = false,oldTitle=false;
var zTree, rMenu;
var addCount = 1;
$( document ).ready( function() {

	resizeWindow();
	$( window ).resize( function() {
		resizeWindow();
		scrollResize();
	} );

	$( '.scroll_left' ).niceScroll( {
		cursorcolor: '#ccc',
		cursorborder: '0',
		cursoropacitymax: '.7',
		cursorwidth: '6',
		horizrailenabled: true
	} );

	$( '.scroll_middle' ).niceScroll( {
		cursorcolor: '#ccc',
		cursorborder: '0',
		cursoropacitymax: '.7',
		cursorwidth: '6',
		horizrailenabled: true,
		railpadding: { top: 0, right: 0, left: -8, bottom: 0 },
	} );

	$( ".middle_content .item" ).live( "contextmenu", function() {
		return false;
	} ).live( 'mousedown', function( e ) {
		switch ( e.which ) {
			case 3:
				$( this ).addClass( 'middle_content_item_pop' );
				showMiddleRightMenu( "node", e.clientX, e.clientY );
				break;
			case 1:
				if ( $( ".note_content_html" ).is( ":hidden" ) ) {
					layer.msg( '请关闭右侧编辑界面之后操作！' );
					return;
				}
				$( this ).siblings( '.item' ).removeClass( 'middle_content_item_select' ).end().addClass( 'middle_content_item_select' );
				getNoteContent( $( this ) );
				break;
		}
	} );

	$( '.btn_view' ).live( 'mousedown', function( e ) {
		switch ( e.which ) {
			case 3:
				break;
			case 1:
				$( this ).css( 'color', '#f7b824' );
				showMiddleViewMenu( "node", e.clientX, e.clientY );
				break;
		}
	} );

	$( '.btn_sort' ).live( 'mousedown', function( e ) {
		switch ( e.which ) {
			case 3:
				break;
			case 1:
				$( this ).css( 'color', '#f7b824' );
				showMiddleSortMenu( "node", e.clientX, e.clientY );
				break;
		}
	} );

	$( '.btn_edit' ).live( 'click', function() {
		$( '.note_content_html' ).find( 'img' ).unbind( 'click' );
		$( '.note_title' ).attr( 'readonly', false );
		$( '.note_content_html' ).hide();
		$( this ).removeClass( 'btn_edit' ).addClass( 'btn_read' ).find( '.fa' ).removeClass( 'fa-lock' ).addClass( 'fa-unlock' ).end().find( '.font' ).text( '阅读' );
		$( '.note_content_edit' ).show();
		ue = UE.getEditor( 'container' );
		ue.ready( function() {

			var h = parseInt( $( window ).height() - $( '.edui-editor-toolbarbox' ).offset().top - $( '.edui-editor-toolbarbox' ).height() - $( window ).height() * 0.02 - 11 );
			ue.setHeight( h );
			$( this.iframe.contentWindow.document.getElementsByTagName( 'body' ) ).height( h - 16 );

			var con = ue.execCommand( 'drafts' );

			ue.setContent( !noParseContent ? $( '.note_content_html' ).html() : noParseContent );
			//ue.setHide();
			ue.addListener( 'contentChange', function() {
				var _con = '';
				_con = ue.getContent();
				try {
					var imgList = '';
					imgList = $( _con ).find( 'img' );
					if ( imgList.length > 0 ) {
						var _imgs = false;
						imgList.each( function() {
							if ( !$( this ).attr( 'src' ).match( /ueditor|api\.map\.baidu\.com\/staticimage|\.svg/ ) ) {
								console.log( $( this ).attr( 'src' ) );
								_imgs = true;
							}
						} );

						if ( _imgs ) {
							layerFlag = layer.msg( '请稍等，正在获取内容中的远程图片，期间请勿保存直到提示成功！', { time: 30000 } );
						}
					}

				} catch ( e ) {
				}
				$( '.note_content_html' ).html( _con );
			} );

			ue.addListener( 'catchremotesuccess', function() {
				var _con = ue.getContent();
				$( '.note_content_html' ).html( _con );
				layer.close( layerFlag );
				layer.msg( '获取完毕！可以保存啦！' );
			} );

			ue.addListener( 'catchremoteerror', function() {
				layer.close( layerFlag );
				layer.msg( '获取失败！请清除内容重新粘贴！' );
			} );


		} );
	} );

	$( '.btn_read' ).live( 'click', function() {

		var _this = $( this );
		var _data = { 'content': ue.getContent() };
		$( '.note_title' ).attr( 'readonly', true );

		if(noParseContent && noParseContent == _data.content ){
			$( '.note_content_edit' ).hide();
			_this.removeClass( 'btn_read' ).addClass( 'btn_edit' ).find( '.fa' ).removeClass( 'fa-unlock' ).addClass( 'fa-lock' ).end().find( '.font' ).text( '编辑' );
			$( '.note_content_html' ).show();
			$( '.note_content_html' ).find( 'img' ).bind( 'click', imgClick );
			return;
		}


		$.ajax( {
			url: '/savenotecontent?id=' + $( '.note_title' ).attr( 'data-id' ),
			type: 'post',
			cache: false,
			data: $.param( _data ),
			async: true,
			dataType: 'text',
			crossDomain: false,
			headers: {
				'X-XSRF-TOKEN': $.cookie( 'XSRF-TOKEN' )
			},
			beforeSend: function() {

				_mask = layer.msg('保存内容中，请稍后...', {
					icon: 16,
					shade: 0.01
				});

			},
			success: function( data ) {
				if ( !data ) {
					return;
				}
				if ( data == 'error' ) {
					layer.msg( '参数错误！' );
					return;
				}

				var data = $.parseJSON( data );

				if ( !data ) {
					return;
				}

				$( '.note_title' ).text( data[ 'title' ] );
				$( '.note_update' ).text('更新日期：'+moment.unix(data['update_time'] ).format( 'YYYY/MM/DD HH:mm:ss'));
				$( '.note_content_edit' ).hide();
				_this.removeClass( 'btn_read' ).addClass( 'btn_edit' ).find( '.fa' ).removeClass( 'fa-unlock' ).addClass( 'fa-lock' ).end().find( '.font' ).text( '编辑' );

				noParseContent = data[ 'content' ];
				$( '.note_content_html' ).html( data[ 'content' ] );
				$( '.note_content_html' ).css( 'height', $( window ).height() - 60 - 62 - $( window ).height() * 0.02 );
				$( '.note_content_html' ).show();
				uParse( '.note_content_html' );
				layer.close( _mask );

				$( '.note_content_html' ).find( 'img' ).bind( 'click', imgClick );

			},
			complete: function() {
				if ( _mask ) {
					layer.close( _mask );
				}
			}
		} );

	} );

	$( '.note_title' ).blur( function() {

		if ( $( '.note_title' ).attr( "readonly" ) ) {
			return;
		}
		var title = $('.note_title').val();
		if(oldTitle && oldTitle == title){
			return;
		}

		var _this = $( this );
		var _data = { 'title': title };

		$.ajax( {
			url: '/changetitle?id=' + $( '.note_title' ).attr( 'data-id' ),
			type: 'post',
			cache: false,
			data: $.param( _data ),
			async: true,
			dataType: 'text',
			crossDomain: false,
			headers: {
				'X-XSRF-TOKEN': $.cookie( 'XSRF-TOKEN' )
			},
			beforeSend: function() {

				_mask = layer.msg('保存标题中，请稍后...', {
					icon: 16,
					time: 2,
					shade: 0.01
				});

			},
			success: function( data ) {
				if ( !data ) {
					return;
				}
				if ( data == 'error' ) {
					layer.msg( '参数错误！' );
					return;
				}

				var data = $.parseJSON( data );

				if ( !data ) {
					return;
				}

				oldTitle = data['title'];
				$( '.note_title' ).val( data[ 'title' ] );
				$( '.note_update' ).text('更新日期：'+moment.unix(data['update_time'] ).format( 'YYYY/MM/DD HH:mm:ss'));
				$('.middle_content_item_select').find('.title').text(data['title']);
				layer.close( _mask );

			},
			complete: function() {
				if ( _mask ) {
					layer.close( _mask );
				}
			}
		} );

	} );

} );
var isDOM = ( typeof HTMLElement === 'object' ) ?
	function( obj ) {
		return obj instanceof HTMLElement;
	} :
	function( obj ) {
		return obj && typeof obj === 'object' && obj.nodeType === 1 && typeof obj.nodeName === 'string';
	};

function imgClick() {

	var photoJson = {
		"title": "", //相册标题
		"id": 123, //相册id
		"start": 0, //初始显示的图片序号，默认0
		"data": []
	};

	$( '.note_content_html' ).find( 'img' ).each( function( i ) {
		photoJson.data[ i ] = {
			'alt': $( this ).attr( 'title' ),
			'pid': $( this ).attr( 'id' ),
			'src': $( this ).attr( 'src' ),
			'thumb': $( this ).attr( 'src' )
		};
	} );

	layer.photos( {
		photos: photoJson
		, anim: 5 //0-6的选择，指定弹出图片动画类型，默认随机（请注意，3.0之前的版本用shift参数）
	} );

	return false;

}

function htmlencode( s ) {
	var div = document.createElement( 'div' );
	div.appendChild( document.createTextNode( s ) );
	return div.innerHTML;
}

function htmldecode( s ) {
	var div = document.createElement( 'div' );
	div.innerHTML = s;
	return div.innerText || div.textContent;
}

function getNoteContent( node ) {
	$.ajax( {
		url: '/getnotecontent?id=' + node.attr( 'data-id' ),
		type: 'get',
		cache: false,
		data: '',
		async: true,
		dataType: 'text',
		crossDomain: false,
		headers: {
			'X-XSRF-TOKEN': $.cookie( 'XSRF-TOKEN' )
		},
		beforeSend: function() {

			_mask = $.i_mask.add( {
				insertBox: 'mainright',
				boxOffsetX: 432,
				boxOffsetY: 60,
			} );

		},
		success: function( data ) {
			if ( !data ) {
				return;
			}
			if ( data == 'error' ) {
				layer.msg( '参数错误！' );
				return;
			}

			var data = $.parseJSON( data );

			if ( !data ) {
				return;
			}
			$( '.note_content_html' ).html( '' );
			$( '.note_bar' ).show();
			$( '.note_title' ).val( data[ 'title' ] ).attr( 'data-id', data[ 'id' ] );
			$( '.note_date' ).text('创建日期：'+moment.unix(data['create_time'] ).format( 'YYYY/MM/DD HH:mm:ss'));
			$( '.note_update' ).text('更新日期：'+moment.unix(data['update_time'] ).format( 'YYYY/MM/DD HH:mm:ss'));

			noParseContent = data[ 'content' ];
			$( '.note_content_html' ).html( data[ 'content' ] );
			$( '.note_content_html' ).css( 'height', $( window ).height() - 60 - 62 - $( window ).height() * 0.02 );
			uParse( '.note_content_html' );
			$( '.note_content_html' ).find( 'img' ).bind( 'click', imgClick );
		},
		complete: function() {
			if ( _mask ) {
				$.i_mask.remove( _mask );
			}
		}
	} );
}

function showMiddleRightMenu( type, x, y ) {
	$( "#middleRightMenu ul" ).show();
	$( "#middleRightMenu" ).css( { "top": (y - 50) + "px", "left": x + "px", "display": "block" } );
	$( "body" ).bind( "mousedown", onBodyMouseDownForRightMenu );
}

function showMiddleViewMenu( type, x, y ) {
	$( "#middleViewMenu ul" ).show();
	$( "#middleViewMenu" ).css( { "top": (y - 50) + "px", "left": x + "px", "display": "block" } );
	$( "body" ).bind( "mousedown", onBodyMouseDownForViewMenu );
}

function showMiddleSortMenu( type, x, y ) {
	$( "#middleSortMenu ul" ).show();
	$( "#middleSortMenu" ).css( { "top": (y - 50) + "px", "left": x + "px", "display": "block" } );
	$( "body" ).bind( "mousedown", onBodyMouseDownForSortMenu );
}

function onBodyMouseDownForRightMenu( event ) {
	if ( 1 == event.which ) {
		$( '.middle_content .item' ).removeClass( 'middle_content_item_pop' );
		if ( !(event.target.id == "middleRightMenu" || $( event.target ).parents( "#middleRightMenu" ).length > 0) ) {
			$( "#middleRightMenu" ).css( { "display": "none" } );
			$( "body" ).unbind( "mousedown", onBodyMouseDownForRightMenu );
		}
	}
}

function onBodyMouseDownForViewMenu( event ) {
	if ( 1 == event.which ) {
		$( '.btn_view' ).css( 'color', '#ccc' );
		if ( !(event.target.id == "middleViewMenu" || $( event.target ).parents( "#middleViewMenu" ).length > 0) ) {
			$( "#middleViewMenu" ).css( { "display": "none" } );
		}
	}
}

function onBodyMouseDownForSortMenu( event ) {
	if ( 1 == event.which ) {
		$( '.btn_sort' ).css( 'color', '#ccc' );
		if ( !(event.target.id == "middleSortMenu" || $( event.target ).parents( "#middleSortMenu" ).length > 0) ) {
			$( "#middleSortMenu" ).css( { "display": "none" } );
		}
	}
}

function scrollResize() {
	if ( $( '.scroll_left' ).height() > 0 ) {
		$( '.scroll_left' ).height( $( window ).height() - 60 );
	}
	if ( $( '.scroll_middle' ).height() > 0 ) {
		$( '.scroll_middle' ).height( $( window ).height() - 60 );
	}
}

function resizeWindow() {
	var headerBox = $( '.header' );
	var main = $( '.main' );
	var mainr = $( '.mainright' )
	main.height( $( window ).height() - headerBox.height() ) + "px";
	$( '.note_content' ).css( 'height', $( window ).height() - 60 - 57 - $( window ).height() * 0.02 );
}


/**
 * 和PHP一样的时间戳格式化函数
 * @param {string} format 格式
 * @param {int} timestamp 要格式化的时间 默认为当前时间
 * @return {string}   格式化的时间字符串
 */
function date( format, timestamp ) {
	var a, jsdate = ((timestamp) ? new Date( timestamp * 1000 ) : new Date());
	var pad = function( n, c ) {
		if ( (n = n + "").length < c ) {
			return new Array( ++c - n.length ).join( "0" ) + n;
		} else {
			return n;
		}
	};
	var txt_weekdays = [ "Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday" ];
	var txt_ordin = { 1: "st", 2: "nd", 3: "rd", 21: "st", 22: "nd", 23: "rd", 31: "st" };
	var txt_months = [ "", "January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December" ];
	var f = {
		// Day
		d: function() {
			return pad( f.j(), 2 )
		},
		D: function() {
			return f.l().substr( 0, 3 )
		},
		j: function() {
			return jsdate.getDate()
		},
		l: function() {
			return txt_weekdays[ f.w() ]
		},
		N: function() {
			return f.w() + 1
		},
		S: function() {
			return txt_ordin[ f.j() ] ? txt_ordin[ f.j() ] : 'th'
		},
		w: function() {
			return jsdate.getDay()
		},
		z: function() {
			return (jsdate - new Date( jsdate.getFullYear() + "/1/1" )) / 864e5 >> 0
		},

		// Week
		W: function() {
			var a = f.z(), b = 364 + f.L() - a;
			var nd2, nd = (new Date( jsdate.getFullYear() + "/1/1" ).getDay() || 7) - 1;
			if ( b <= 2 && ((jsdate.getDay() || 7) - 1) <= 2 - b ) {
				return 1;
			} else {
				if ( a <= 2 && nd >= 4 && a >= (6 - nd) ) {
					nd2 = new Date( jsdate.getFullYear() - 1 + "/12/31" );
					return date( "W", Math.round( nd2.getTime() / 1000 ) );
				} else {
					return (1 + (nd <= 3 ? ((a + nd) / 7) : (a - (7 - nd)) / 7) >> 0);
				}
			}
		},

		// Month
		F: function() {
			return txt_months[ f.n() ]
		},
		m: function() {
			return pad( f.n(), 2 )
		},
		M: function() {
			return f.F().substr( 0, 3 )
		},
		n: function() {
			return jsdate.getMonth() + 1
		},
		t: function() {
			var n;
			if ( (n = jsdate.getMonth() + 1) == 2 ) {
				return 28 + f.L();
			} else {
				if ( n & 1 && n < 8 || !(n & 1) && n > 7 ) {
					return 31;
				} else {
					return 30;
				}
			}
		},

		// Year
		L: function() {
			var y = f.Y();
			return (!(y & 3) && (y % 1e2 || !(y % 4e2))) ? 1 : 0
		},
		//o not supported yet
		Y: function() {
			return jsdate.getFullYear()
		},
		y: function() {
			return (jsdate.getFullYear() + "").slice( 2 )
		},

		// Time
		a: function() {
			return jsdate.getHours() > 11 ? "pm" : "am"
		},
		A: function() {
			return f.a().toUpperCase()
		},
		B: function() {
			// peter paul koch:
			var off = (jsdate.getTimezoneOffset() + 60) * 60;
			var theSeconds = (jsdate.getHours() * 3600) + (jsdate.getMinutes() * 60) + jsdate.getSeconds() + off;
			var beat = Math.floor( theSeconds / 86.4 );
			if ( beat > 1000 ) beat -= 1000;
			if ( beat < 0 ) beat += 1000;
			if ( (String( beat )).length == 1 ) beat = "00" + beat;
			if ( (String( beat )).length == 2 ) beat = "0" + beat;
			return beat;
		},
		g: function() {
			return jsdate.getHours() % 12 || 12
		},
		G: function() {
			return jsdate.getHours()
		},
		h: function() {
			return pad( f.g(), 2 )
		},
		H: function() {
			return pad( jsdate.getHours(), 2 )
		},
		i: function() {
			return pad( jsdate.getMinutes(), 2 )
		},
		s: function() {
			return pad( jsdate.getSeconds(), 2 )
		},
		//u not supported yet

		// Timezone
		//e not supported yet
		//I not supported yet
		O: function() {
			var t = pad( Math.abs( jsdate.getTimezoneOffset() / 60 * 100 ), 4 );
			if ( jsdate.getTimezoneOffset() > 0 ) t = "-" + t; else t = "+" + t;
			return t;
		},
		P: function() {
			var O = f.O();
			return (O.substr( 0, 3 ) + ":" + O.substr( 3, 2 ))
		},
		//T not supported yet
		//Z not supported yet

		// Full Date/Time
		c: function() {
			return f.Y() + "-" + f.m() + "-" + f.d() + "T" + f.h() + ":" + f.i() + ":" + f.s() + f.P()
		},
		//r not supported yet
		U: function() {
			return Math.round( jsdate.getTime() / 1000 )
		}
	};

	return format.replace( /[\\]?([a-zA-Z])/g, function( t, s ) {
		if ( t != s ) {
			// escaped
			ret = s;
		} else if ( f[ s ] ) {
			// a date function exists
			ret = f[ s ]();
		} else {
			// nothing special
			ret = s;
		}
		return ret;
	} );
}
