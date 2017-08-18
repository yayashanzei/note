/*
 *  author:     icebr
 *	date:       2016-12
 *	function:   handle something for message
 */

$( document ).ready( function() {
	$.somysns.conf.checkAll.group = '.check-group';
	$.somysns.init();
} );

/* somysns 对象 */
(function( $ ) {

	$.somysns = {

		/* 配置信息 */
		conf: {
			globals: {
				splitString: 'q_Y_p' /* 分割字符串 */
			},
			init: {},
			cookieInit: {
				lists: {
					history: '1',
					history_r_top: location.href,
					history_l_con: location.href,
					history_r_con: location.href
				},
				step: 20, /*历史记录总步数*/
				current: 20 /*历史记录记步指针*/
			},
			scroll: {
				leftBox: { className: '.scroll_left', color: '#999', baseSize: $( window ), offset: 131 },
				rightBox: { className: '.r_l_box', color: '#ccc', baseSize: $( '.r_l_box' ), offset: 0 },
				friendBox: { className: '.f_box', color: '#ccc', baseSize: $( '.f_box' ), offset: 0 },
				groupBox: { className: '.g_box', color: '#ccc', baseSize: $( '.g_box' ), offset: 0 },
				mBox: { className: '.m_box', color: '#ccc', baseSize: $( '.m_box' ), offset: 0 }
			},
			navListen: {
				data: 'nav_class',
				navList: [ '.adi_h_nav', 'div' ],
				activeClass: 'item_active',
				siblingsName: '.item',
				childrenName: '.a',
				childrenClass: 'a_active'
			},
			leftAccordion: {
				box: '.info',
				head: '.info_lst_t',
				event: 'click',
				downIcon: 'icon-angle-down',
				upIcon: 'icon-angle-left',
				animateClass: '.info_lst_t_ico2'
			},
			checkAll: {
				group: '',
				head: '.check-head',
				item: '.check-item'
			},
			switchRoom: {},
			switchFriend: {
				eventItem: '.f_box .item,.g_box .g_c',
				insertBox: '.r_l_box'
			},
			switchCurrentFriend: {
				eventItem: '.r_l_box .item',
				insertBox: '.r_l_box'
			},
			getFriendListHtml: {},
			getCurrentFriendListHtml: {},
			getMessageHistory: {},
			closeRebindClick: { intVal: null },
			adminAjaxAsk: {
				a: false, /* 请求链接 */
				ask: 99, /* 默认99-请求页面，0-（信息框）1-（页面层）2-（iframe层）3-（加载层）4-（tips层）  */

				btnPosition: false, /* 点击按钮的位置 */
				replaceBox: 'r_con', /* $.ajax: success 返回值的容器的class名 */
				form: '', /* 要提交的表单class名 */

				current: false, /* 上次点击是否是history,方便重置cookieInit的current fasle-不是，true-是 */
				noCookie: false, /* 是否记录此次点击，false-记录 true 不记录 默认记录 */
				history: false, /* 返回 为true时不记录此次点击 */
				reload: false, /* 刷新整个页面 */
				refresh: false, /* 刷新区域 */
				custom: false, /* ajax请求 成功 的回调函数 在adminAjaxAsk:success最开始调用且中断后续操作 */
				callback: false, /* ajax请求 完成 的回调函数 在adminAjaxAsk:complete中调用 */

				layer: {}, /* layer 插件的参数 */
				ajax: {
					crossDomain: false, /* 是否跨域请求,默认同域 */
					async: true, /* 异步请求或者同步请求,默认异步请求 */
					dataType: 'html', /* ajax返回数据类型,默认html */
					cache: false, /* 缓存,默认false*/
					type: 'get', /* 请求类型,默认get */
					data: '' /* 要传送的数据 */
				}
			},
			sendMessages: { mask: null },
			adminAjaxCookie: {},
			listenReceived: { interVal: null },
			listenOneReceived: { intVal: null, timeoutIntVal: null }
		},

		/* 初始化 */
		init: function( opt ) {

			var opts = {}, sns = $.somysns;
			opts = $.extend( opts, this.conf.init, opt || {} );

			this.pintuerInit();

			//this.cookieInit();
			this.navListen();

			this.scrollResize();
			this.scrollInit();


			this.leftAccordion();
			this.leftAccordion( {
				box: '.g_box',
				head: '.group',
				event: 'click',
				downIcon: 'icon-angle-down',
				upIcon: 'icon-angle-left',
				animateClass: '.info_lst_t_ico2'
			} );

			this.switchFriend();
			this.switchCurrentFriend();
			this.listenSend();
			this.listenQSend();
			this.listenGroupPlus();
			this.listenReceived();
			this.listenChatRoom();
			this.listenShowAllFriends();


			this.context.init( { preventDoubleContext: false } );
			this.context.attach( '.f_box .item,.g_box .g_c', [

				{ header: '编辑' },
				{
					text: '备注',
					href: '#',
					action: function( e ) {
						if ( $( $.cookie( 'current_item' ) ).length < 1 ) {
							return false;
						}

						layer.prompt( { title: '输入备注名，并确认' }, function( name, index ) {

							var aid = $( $.cookie( 'current_item' ) ).attr( 'aid' ),
								fid = $( $.cookie( 'current_item' ) ).attr( 'fid' ),
								type = $( $.cookie( 'current_item' ) ).attr( 'type' );

							$.ajax( {
								url: '/message/editMarkName',
								type: 'post',
								cache: false,
								data: 'name=' + name + '&aid=' + aid + '&type=' + type + '&fid=' + fid,
								async: true,
								dataType: 'text',
								crossDomain: false,
								beforeSend: function() {
								},
								success: function( data ) {
									if ( !data ) {
										return;
									}
									if ( data == 'error' ) {
										return;
									}

									$( $.cookie( 'current_item' ) ).find( '.id' ).html( name );

								},
								complete: function() {
									$.cookie( 'current_item', null );
									layer.close( index );
								}
							} );


						} );
						$( '.dropdown-context' ).fadeOut( 10 );
						return false;
					}
				},
				{
					text: '分组',
					href: '#',
					action: function( e ) {

						if ( $( $.cookie( 'current_item' ) ).length < 1 ) {
							return false;
						}

						var uid = $( $.cookie( 'current_item' ) ).attr( 'uid' ),
							aid = $( $.cookie( 'current_item' ) ).attr( 'aid' ),
							fid = $( $.cookie( 'current_item' ) ).attr( 'fid' ),
							type = $( $.cookie( 'current_item' ) ).attr( 'type' ),
							index = null;


						(function( _open ) {

							var _html = '';

							$( '.group' ).each( function() {
								if ( $( this ).attr( 'gid' ) > 0 ) {
									_html = _html + "<input class='grouping' style='display:inline-block;line-height:28px;height:28px;vertical-align:middle;' type='radio' name='grouping' value='" +
										$( this ).attr( 'gid' ) + "'>" + $( this ).attr( 'gname' ) + "<br/>";
								}
							} );

							_html = "<form style='margin:15px 0px 0px 20px;'>"
								+ "<input class='grouping' style='display:inline-block;line-height:28px;height:28px;vertical-align:middle;' type='radio' name='grouping' value='0'><span style='color:#f43838;'>移出分组</span><br/>"
								+ _html
								+ "</form>";

							_open.content = _html;
							index = layer.open( _open );


						})( {
							type: 1,
							title: '选择分组，并确定',
							area: [ '320px', '200px' ],
							shade: 0.4,
							id: 'layero',
							resize: false,
							btn: [ '确定', '拒绝' ],
							content: '',
							btnAlign: 'c',
							yes: function( index, layero ) {
								var gid = $( '.grouping[name="grouping"]:checked' ).val();

								$.ajax( {
									url: '/message/grouping',
									type: 'post',
									cache: false,
									data: 'gid=' + gid + '&name=' + name + '&aid=' + aid + '&type=' + type + '&fid=' + fid,
									async: true,
									dataType: 'text',
									crossDomain: false,
									beforeSend: function() {
									},
									success: function( data ) {
										if ( !data ) {
											return;
										}
										if ( data == 'error' ) {
											return;
										}

										//$( $.cookie( 'current_item' ) ).find( '.id' ).html( name );

									},
									complete: function() {
										$.cookie( 'current_item', null );
										layer.close( index );
										layer.msg( '更改分组成功，稍后重新加载页面！', function() {
											window.location.reload();
										} );

									}
								} );

							}
						} );


						$( '.dropdown-context' ).fadeOut( 10 );
						return false;
					}
				},
				{ divider: true }
			] );

			this.context.attach( '.group', [

				{ header: '操作' },
				{
					text: '群发',
					href: '#',
					action: function( e ) {

						if ( $( '.check-item:checked' ).length < 1 ) {
							layer.msg( '请先选择好友！' );
							$( '.dropdown-context' ).fadeOut( 10 );
							return false;
						}
						sns.conf.sendMessages.mask = layer.open( {
							title: '即时消息群发',
							type: 1,
							area: [ '420px', '200px' ], //宽高
							content: '<div class="q_box">' +
							'<div class="con" style="display: block;">' +
							'<textarea class="qm_content" name="message" placeholder="说点什么呢..."></textarea>' +
							'</div>' +
							'<div class="menu" style="display: block;">' +
							'<div class="q_send button bg-gray">发送</div>' +
							'</div>' +
							'</div>'
						} );

						$( '.dropdown-context' ).fadeOut( 10 );
						return false;
					}
				},
				{
					text: '删除',
					href: '#',
					action: function( e ) {
						if ( $( $.cookie( 'current_item' ) ).length < 1 ) {
							return false;
						}

						var gid = $( $.cookie( 'current_item' ) ).attr( 'gid' ),
							index = null;


						$.ajax( {
							url: '/message/delGroup',
							type: 'post',
							cache: false,
							data: 'gid=' + gid,
							async: true,
							dataType: 'text',
							crossDomain: false,

							success: function( data ) {
								$.cookie( 'current_item', null );
								if ( data == 'error' ) {
									layer.msg( '删除失败！' );
								}

								if ( data == '2' ) {
									layer.msg( '分组下有成员，请先移出成员！' );
								}

								if ( data == 'success' ) {
									layer.close( index );
									layer.msg( '删除分组成功，稍后重新加载页面！', function() {
										window.location.reload();
									} );
								}

							},

						} );


						$( '.dropdown-context' ).fadeOut( 10 );
						return false;
					}
				},
				{ divider: true }
			] );
			this.context.settings( { compress: true } );

			this.checkAll();

		},

		/* 初始化上次点击状态，记录cookie中 */
		cookieInit: function( opt ) {

			var opts = {};
			opts = $.extend( opts, this.conf.cookieInit, opt || {} );

			if ( !opts.lists ) {
				return;
			}

			for ( var key in opts.lists ) {
				if ( opts.lists[ key ] ) {

					if ( $.trim( $.localStorage.get( key ) ) == '' ) {
						var val = '';
						for ( var i = 0; i < opts.step; i++ ) {
							if ( i == (opts.step - 1) ) {
								val = val + opts.lists[ key ];
							} else {
								val = val + opts.lists[ key ] + this.conf.globals.splitString;
							}
						}

						$.localStorage.set( key, val );
					}

				}
			}
		},

		/* 重置左侧滚动区域的大小 */
		scrollResize: function( opt ) {
			var opts = {};
			opts = $.extend( opts, this.conf.scroll, opt || {} );

			for ( var key in opts ) {
				if ( opts[ key ].baseSize.height() > 0 ) {
					$( opts[ key ].className ).height( opts[ key ].baseSize.height() - opts[ key ].offset );
				}
			}
		},

		/* 初始化滚动条 */
		scrollInit: function( opt ) {

			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.scroll, opt || {} );

			for ( var key in opts ) {

				if ( $( opts[ key ].className ).length > 0 ) {

					$( window ).resize( function() {
						sns.scrollResize();
					} );

					$( opts[ key ].className ).niceScroll( {
						cursorcolor: opts[ key ].color,
						cursorborder: '0',
						cursoropacitymax: '.5',
						cursorwidth: '6',
						horizrailenabled: false
					} );
				}

			}

		},

		/* 监听顶部导航事件 */
		navListen: function( opt ) {

			var opts = {},
				splitString = this.conf.globals.splitString,
				nav_class,
				th_a,
				nav_list;

			opts = $.extend( opts, this.conf.navListen, opt || {} );
			splitString = this.conf.globals.splitString;

			nav_list = $( opts.navList[ 0 ] ).children( opts.navList[ 1 ] );

			nav_list.each( function( i ) {
				$( this ).data( opts.data, i + 1 );
			} );

			nav_list.click( function() {
				$.localStorage.set( opts.data, $( this ).data( opts.data ) );
				$( this ).addClass( opts.activeClass ).children( opts.childrenName ).addClass( opts.childrenClass );
				$( this ).siblings( opts.siblingsName ).removeClass( opts.activeClass ).children( opts.childrenName ).removeClass( opts.childrenClass );
			} );

			if ( $.localStorage.get( opts.data ) ) {
				nav_class = $.localStorage.get( opts.data );
				nav_list.eq( nav_class - 1 ).addClass( opts.activeClass ).children( opts.childrenName ).addClass( opts.childrenClass );
				nav_list.eq( nav_class - 1 ).siblings( opts.siblingsName ).removeClass( opts.activeClass ).children( opts.childrenName ).removeClass( opts.childrenClass );

			} else {
				nav_list.eq( 0 ).addClass( opts.activeClass ).children( opts.childrenName ).addClass( opts.childrenClass );
				nav_list.eq( 0 ).siblings( opts.siblingsName ).removeClass( opts.activeClass ).children( opts.childrenName ).removeClass( opts.childrenClass );
			}
		},

		/* 初始化pintuer框架 */
		pintuerInit: function() {
			pintuerInit();
		},

		/* 左侧手风琴效果 */
		leftAccordion: function( opt ) {
			var opts = {};
			opts = $.extend( opts, this.conf.leftAccordion, opt || {} );

			$( opts.box ).on( opts.event, opts.head, function() {
				if ( $( this ).children( '.' + opts.downIcon ).length > 0 ) {
					$( this ).nextUntil( opts.head ).slideUp( 300, "easeInOutCubic" );
					$( this ).children( opts.animateClass ).removeClass( opts.downIcon ).addClass( opts.upIcon );
				} else {
					$( this ).nextUntil( opts.head ).slideDown( 300, "easeInOutCubic" );
					$( this ).children( opts.animateClass ).removeClass( opts.upIcon ).addClass( opts.downIcon );
				}
			} );
		},

		/* 切换聊天室 */
		switchRoom: function( opt ) {
			var opts = {};
			opts = $.extend( opts, this.conf.cookieInit, opt || {} );
		},

		/* 重置pintuer .close的click事件 */
		closeRebindClick: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.closeRebindClick, opt || {} );

			$( '.close' ).unbind( 'click' ).bind( 'click', function() {

				if ( $( '.r_l_box .item' ).length < 3 ) {
					$( '.none' ).show();
				} else {
					$( '.none' ).hide();
				}

				$( this ).closest( '.alert' ).remove();

				if ( $( '.current' ).length < 1 ) {
					$( '.r_l_box .item' ).first().addClass( 'current' );
				}

				$( '.m_box' ).html( '' );

				window.clearTimeout( sns.conf.listenOneReceived.timeoutIntVal );
				window.clearInterval( sns.conf.listenOneReceived.intVal );

				$( '.m_content,.send' ).attr( 'disabled', 'disabled' );
				$( '.s_box .con,.s_box .menu' ).hide();

			} );
		},

		/* 生成左侧当前好友的jquery dom集 */
		getFriendListHtml: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.getFriendListHtml, opt || {} );

			return $( "<div class='alert item " + opts.ts.attr( 'id' ) + " current' cname='" + opts.ts.attr( 'id' ) + "' aid='" + opts.ts.attr( 'aid' ) + "'rid='" + opts.ts.attr( 'rid' ) + "'nickname='" + opts.ts.attr( 'nickname' ) + "' type='" + opts.ts.attr( 'type' ) + "' fid='" + opts.ts.attr( 'fid' ) + "'>" +
				"<div class='title'> " +
				"<span class='" + opts.ts.find( '.icon' ).attr( 'class' ) + "'> </span>" +
				"<span class='t'>" + opts.ts.attr( 'nickname' ) + "</span>" +
				"<span class='type badge-corner'>" +
				"　<span class='badge bg-yellow'></span></span>" +
				"<span class='close rotate-hover'></span>" +
				"</div>" +
				"<div class='name'>" + opts.ts.find( '.id' ).html() + "</div>" +
				"</div>" );

		},


		/* 生成信息列表的jquery dom集 */
		getMessageListHtml: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.getFriendListHtml, opt || {} );
			var oldTime;
			if ( opts.data.text ) {

				if ( opts.data.status == 'read' || opts.data.status == 'unread' ) {

					oldTime = opts.data.timestamp;
					if ( opts.data.timestamp.toString().length < 13 ) {
						opts.data.timestamp = opts.data.timestamp * 1000;
					}

					return $( '<div class="received" time="' + oldTime + '">' +
						'<div class="t">' +
						'<span class="date">' + new Date( opts.data.timestamp ).toLocaleString() + '</span>' +
						'<span class="name">' + opts.ts.attr( 'nickname' ) + '</span>' +
						'</div>' +
						'<div class="c">' +
						'<span>' + opts.data.text + '</span>' +
						'</div>' +
						'</div>' );
				}

				if ( opts.data.status == 'send' || opts.data.status == 'unsend' ) {
					oldTime = opts.data.timestamp;
					if ( opts.data.timestamp.toString().length < 13 ) {
						opts.data.timestamp = opts.data.timestamp * 1000;
					}
					return $( '<div class="send" time="' + oldTime + '">' +
						'<div class="t">' +
						'<span class="name">' + $( '#info_lst_' + opts.ts.attr( 'type' ) + '_' + opts.ts.attr( 'aid' ) ).attr( 'nickname' ) + '</span>' +
						'<span class="date">' + new Date( opts.data.timestamp ).toLocaleString() + '</span>' +
						'</div>' +
						'<div class="c">' +
						'<span>' + opts.data.text + '</span>' +
						'</div>' +
						'</div>' );
				}
			}

			if ( opts.data.attachments ) {
				return $( '<div class="received"><img src="' + opts.data.attachments[ 0 ].url + '"/></div>' );
			}

		},

		/* 生成信息列表的jquery dom集 */
		getOneSendMessageHtml: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.getOneSendMessageHtml, opt || {} );
			var oldTime = new Date().getTime();
			if ( opts.data.type !== 'facebook' ) {
				oldTime = oldTime.toString().substr( 0, 10 );
			}

			if ( opts.type && opts.type == 'text' ) {
				return '<div class="send last_send" time="' + parseInt( oldTime ) + '">' +
					'<div class="t">' +
					'<span class="name">' + $( '#info_lst_' + opts.data.type + '_' + opts.data.aid ).attr( 'nickname' ) + '</span>' +
					'<span class="date">' + new Date().toLocaleString() + '</span>' +
					'</div>' +
					'<div class="c">' +
					'<span>' + opts.data.message + '</span>' +
					'</div>' +
					'</div>';
			}

			if ( opts.type && opts.type == 'attachments' ) {
				return $( '<div class="send"><img src="' + opts.data.attachments[ 0 ].url + '"/></div>' );
			}

		},

		/* 生成信息列表的jquery dom集 */
		getOneReceivedMessageHtml: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.getOneReceivedMessageHtml, opt || {} );
			var oldTime;

			if ( opts.type && opts.type == 'text' ) {
				oldTime = opts.data.timestamp;
				if ( opts.data.timestamp.toString().length < 13 ) {
					opts.data.timestamp = opts.data.timestamp * 1000;
				}
				return '<div class="received last_received" time="' + oldTime + '">' +
					'<div class="t">' +
					'<span class="date">' + new Date( opts.data.timestamp ).toLocaleString() + '</span>' +
					'<span class="name">' + opts.data.nickname + '</span>' +
					'</div>' +
					'<div class="c">' +
					'<span>' + opts.data.message + '</span>' +
					'</div>' +
					'</div>';
			}

			if ( opts.type && opts.type == 'attachments' ) {
				return $( '<div class="send"><img src="' + opts.data.attachments[ 0 ].url + '"/></div>' );
			}

		},

		/* 更新当前好友的未读消息 */
		resetUnreadNum: function( opt ) {

			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.getFriendListHtml, opt || {} );

			var _aid = opts.ts.attr( 'aid' ),
				_type = opts.ts.attr( 'type' ),
				_at = $( '.account_type_' + _type ),
				_ac = $( '.account_' + _aid ),
				_num = opts.ts.find( '.badge' ).html(),
				_at_num = (_at.html() == _num) ? '' : _at.html() - _num,
				_ac_num = (_ac.html() == _num) ? '' : _ac.html() - _num;

			_at.html( _at_num );
			_ac.html( _ac_num );
			opts.ts.find( '.badge' ).html( '' );

			if ( opts.ts.attr( 'class' ).indexOf( 'alert' ) >= 0 ) {
				$( '#' + opts.ts.attr( 'cname' ) ).find( '.badge' ).html( '' );
			}

		},

		/* 获取选中好友的历史消息，ajax请求 */
		getMessageHistory: function( opt ) {
			var opts = {}, sns = this, _mask;
			opts = $.extend( opts, this.conf.getMessageHistory, opt || {} );

			$.ajax( {
				url: '/message/openChatRoom?aid=' + opts.ts.attr( 'aid' ) + '&rid=' + opts.ts.attr( 'rid' ) + '&fid=' + opts.ts.attr( 'fid' ) + '&type=' + opts.ts.attr( 'type' ),
				type: 'get',
				cache: false,
				data: '',
				async: true,
				dataType: 'text',
				crossDomain: false,
				beforeSend: function() {

					_mask = $.i_mask.add( {
						insertBox: 'r_m',
						offset: 0
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
					$( '.m_box' ).html( '' );
					for ( var dk in data ) {

						if ( !data[ dk ] ) {
							continue;
						}
						var _data = $.parseJSON( data[ dk ] ), _context = '';

						_context = sns.getMessageListHtml( { ts: opts.ts, data: _data } );

						$( _context ).appendTo( $( '.m_box' ) );


					}

				},
				complete: function() {
					$( '.s_box .con,.s_box .menu' ).show();
					sns.resetUnreadNum( { ts: opts.ts } );
					$( '.m_content,.send' ).removeAttr( 'disabled' );
					sns.messageBoxAutoScroll();
					if ( _mask ) {
						$.i_mask.remove( _mask );
					}
				}
			} );
		},

		/* 切换当前好友,初始化聊天窗口 */
		switchFriend: function( opt ) {

			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.switchFriend, opt || {} );

			$( opts.eventItem ).live( 'click', function() {

				var ts = $( this );

				if ( $( '.' + ts.attr( 'id' ) ).length > 0 ) {
					return false;
				}

				$( '.current' ).removeClass( 'current' );

				var _context = sns.getFriendListHtml( { ts: ts } );

				_context.prependTo( $( opts.insertBox ) );

				if ( $( '.r_l_box .item' ).length < 2 ) {
					$( '.none' ).show();
				} else {
					$( '.none' ).hide();
				}

				sns.closeRebindClick();

				sns.getMessageHistory( { ts: ts } );

				window.clearInterval( sns.conf.listenOneReceived.intVal );

				sns.listenOneReceived( { ts: ts } );

			} );


		},

		/* 切换正在聊天好友,初始化聊天窗口 */
		switchCurrentFriend: function( opt ) {

			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.switchCurrentFriend, opt || {} );

			$( opts.eventItem ).live( 'click', function() {

				var ts = $( this );

				$( '.current' ).removeClass( 'current' );
				ts.addClass( 'current' );

				if ( $( '.r_l_box .item' ).length < 2 ) {
					$( '.none' ).show();
				} else {
					$( '.none' ).hide();
				}

				sns.closeRebindClick();
				sns.getMessageHistory( { ts: ts } );

				window.clearInterval( sns.conf.listenOneReceived.intVal );

				sns.listenOneReceived( { ts: ts } );

			} );


		},

		/* 插入一条消息 */
		insertOneMessage: function( opt ) {

			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.insertOneMessage, opt || {} );


			if ( opts.type && opts.type == 'text' ) {
				if ( !opts.data ) {
					return;
				}

				$( '.last_send' ).removeClass( 'last_send' );

				var _context = sns.getOneSendMessageHtml( opts );

				$( _context ).appendTo( $( '.m_box' ) );

				sns.messageBoxAutoScroll();

				$( '.m_content' ).val( '' );
			}

		},

		/* 插入一条消息 */
		insertOneReceivedMessage: function( opt ) {

			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.insertOneReceivedMessage, opt || {} );


			if ( opts.type && opts.type == 'text' ) {
				if ( !opts.data ) {
					return;
				}

				$( '.last_received' ).removeClass( 'last_received' );

				var _context = sns.getOneReceivedMessageHtml( opts );

				$( _context ).appendTo( $( '.m_box' ) );

				sns.messageBoxAutoScroll();

				$( '.m_content' ).val( '' );
			}

		},

		/* 切换当前好友,初始化聊天窗口 */
		messageBoxAutoScroll: function( opt ) {

			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.insertOneMessage, opt || {} );

			setTimeout( function() {
				$( '.m_box' ).getNiceScroll( 0 ).doScrollTop( $( '.m_box' )[ 0 ].scrollHeight, 10 );
			}, 500 );

		},

		/* 切换当前好友,初始化聊天窗口 */
		handleSendError: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.handleSendError, opt || {} );

			$( '<a href="#">发送失败，重发？</a>' ).appendTo( $( '.last_send' ) );

		},

		/* 获取选中好友的历史消息，ajax请求 */
		sendMessage: function( opt ) {
			var opts = {}, sns = this, _mask;
			opts = $.extend( opts, this.conf.sendMessage, opt || {} );

			var content = $( '.m_content' ).val(),
				aid = $( '.current' ).attr( 'aid' ),
				rid = $( '.current' ).attr( 'rid' ),
				type = $( '.current' ).attr( 'type' ),
				fid = $( '.current' ).attr( 'fid' );

			$.ajax( {
				url: '/message/send',
				type: 'post',
				cache: false,
				data: 'message=' + content + '&aid=' + aid + '&rid=' + rid + '&type=' + type + '&fid=' + fid,
				async: true,
				dataType: 'text',
				crossDomain: false,
				beforeSend: function() {
					sns.insertOneMessage( { type: 'text', data: { message: content, aid: aid, rid: rid, type: type, fid: fid } } );
				},
				success: function( data ) {
					if ( !data ) {
						return;
					}
					if ( data == 'error' ) {
						sns.handleSendError();
						return;
					}

				},
				complete: function() {

					if ( _mask ) {
						$.i_mask.remove( _mask );
					}
				}
			} );
		},

		/* 获取选中好友的历史消息，ajax请求 */
		sendMessages: function( opt ) {
			var opts = {}, sns = this, _mask;
			opts = $.extend( opts, this.conf.sendMessages, opt || {} );

			var content = $( '.qm_content' ).val(),
				formSerialize = $( '.group_list' ).serialize();

			if ( !content || !formSerialize ) {
				layer.msg( '页面错误或者内容为空！' );
				return false;
			}

			$.ajax( {
				url: '/message/multiSend',
				type: 'post',
				cache: false,
				data: formSerialize + '&message=' + content,
				async: true,
				dataType: 'text',
				crossDomain: false,
				beforeSend: function() {
				},
				success: function( data ) {

					if ( data !== 'success' ) {
						layer.msg( '发送失败，点击发送按钮重发！' );
						return;
					}

					if ( opts.mask ) {
						layer.close( opts.mask );
					}
				},
				complete: function() {

				}
			} );
		},


		/* 获取选中好友的历史消息，ajax请求 */
		listenSend: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.listenSend, opt || {} );

			$( '.send' ).bind( 'click', function() {
				sns.sendMessage();
			} );
		},

		/* 获取选中好友的历史消息，ajax请求 */
		listenQSend: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.listenSend, opt || {} );

			$( '.q_send' ).live( 'click', function() {
				sns.sendMessages();
			} );

		},


		/* 监听新消息 */
		listenReceived: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.listenReceived, opt || {} );

			window.setTimeout( function() {

				sns.conf.listenReceived.interVal = window.setInterval( function() {

					$.ajax( {
						url: '/message/getReceivedGlobal',
						type: 'post',
						cache: false,
						data: '',
						async: true,
						dataType: 'text',
						crossDomain: false,
						beforeSend: function() {
						},
						success: function( data ) {

							if ( !data ) {
								return;
							}

							data = $.parseJSON( data );

							for ( var key in data ) {

								if ( key === 'new_friend' ) {
									$.each( data[ key ], function( t, v ) {

										if ( $( '#item_' + v.type + '_' + v.friend_id ).length < 1 ) {
											$( '<div class="item radius" ' +
												'id="item_' + v.type + '_' + v.friend_id + '" ' +
												'nickname="' + v.friend_nickname + '" ' +
												'uid="' + v.uid + '" ' +
												'aid="' + v.account_id + '" ' +
												'fid="' + v.friend_id + '" ' +
												'type="' + v.type + '">' +
												'<span class="icon icon-' + v.type + '"> </span>' +
												'<span class="name">' +
												'<span class="type badge-corner">' + v.friend_nickname +
												'　<span class="badge bg-yellow">' + v.unread + '</span>' +
												'</span><br>' +
												'<span class="id" ' +
												'uid="' + v.uid + '" ' +
												'aid="' + v.account_id + '" ' +
												'fid="' + v.friend_id + '" ' +
												'type="' + v.type + '">' + (!v.mark ? v.friend_id : v.mark) +
												'</span>' +
												' </span>' +
												'</div>' ).appendTo( $( '.f_box' ) );
										}

									} );
									continue;
								}

								if ( key === '_friend' ) {
									$.each( data[ key ], function( t, v ) {
										var _item = $( '#item_' + v.type + '_' + v.friend_id ),
											_item_val = _item.find( '.badge' ).text(),
											_opne_item = $( '.item_' + v.type + '_' + v.friend_id ),
											_info_lst = $( '#info_lst_' + v.type + '_' + v.account_id ),
											_info_lst_val = _info_lst.find( '.badge' ).text(),
											_account_type = $( '.account_type_' + v.type ),
											_account_type_val = _account_type.text();

										!_item_val ? _item_val = 0 : _item_val = parseInt( _item_val );
										!_info_lst_val ? _info_lst_val = 0 : _info_lst_val = parseInt( _info_lst_val );
										!_account_type_val ? _account_type_val = 0 : _account_type_val = parseInt( _account_type_val );
										!v.unread ? v.unread = 0 : true;

										if ( _item_val != v.unread ) {

											if ( v.unread <= 0 ) {
												_item.find( '.badge' ).html( '' );
												if ( _opne_item.length > 0 && _opne_item.attr( 'class' ).indexOf( 'current' ) < 0 ) {
													_opne_item.find( '.badge' ).html( '' );
												}
											} else {
												_item.find( '.badge' ).html( v.unread );
												if ( _opne_item.length > 0 && _opne_item.attr( 'class' ).indexOf( 'current' ) < 0 ) {
													_opne_item.find( '.badge' ).html( v.unread );
												}
											}

											if ( _info_lst_val + (v.unread - _item_val) <= 0 ) {
												_info_lst.find( '.badge' ).html( '' );
											} else {
												_info_lst.find( '.badge' ).html( _info_lst_val + (v.unread - _item_val) );
											}

											if ( _account_type_val + ( v.unread - _item_val ) <= 0 ) {
												_account_type.html( '' );
											} else {
												_account_type.html( _account_type_val + ( v.unread - _item_val ) );
											}

										}

									} );
									continue;
								}

								if ( key === '_group' ) {

									$.each( data[ key ], function( t, v ) {

										$.each( v, function( tt, vv ) {
											if ( tt == 'count' ) {
												return false;
											}

											var _g_c = $( '#g_c_' + vv.type + '_' + vv.friend_id ),
												_g_c_val = _g_c.find( '.badge' ).text(),
												_open_g_c = $( '.g_c_' + vv.type + '_' + vv.friend_id ),
												_info_lst = $( '#info_lst_' + vv.type + '_' + vv.account_id ),
												_info_lst_val = _info_lst.find( '.badge' ).text(),
												_account_type = $( '.account_type_' + vv.type ),
												_account_type_val = _account_type.text();

											!_g_c_val ? _g_c_val = 0 : _g_c_val = parseInt( _g_c_val );
											!_info_lst_val ? _info_lst_val = 0 : _info_lst_val = parseInt( _info_lst_val );
											!_account_type_val ? _account_type_val = 0 : _account_type_val = parseInt( _account_type_val );
											!vv.unread ? vv.unread = 0 : true;

											if ( _g_c_val != vv.unread ) {

												if ( vv.unread <= 0 ) {
													_g_c.find( '.badge' ).html( '' );
													if ( _open_g_c.length > 0 && _open_g_c.attr( 'class' ).indexOf( 'current' ) < 0 ) {
														_open_g_c.find( '.badge' ).html( '' );
													}
												} else {
													_g_c.find( '.badge' ).html( vv.unread );
													if ( _open_g_c.length > 0 && _open_g_c.attr( 'class' ).indexOf( 'current' ) < 0 ) {
														_open_g_c.find( '.badge' ).html( vv.unread );
													}
												}

												if ( _info_lst_val + (vv.unread - _g_c_val) <= 0 ) {
													_info_lst.find( '.badge' ).html( '' );
												} else {
													_info_lst.find( '.badge' ).html( _info_lst_val + (vv.unread - _g_c_val) );
												}

												if ( _account_type_val + ( vv.unread - _g_c_val ) <= 0 ) {
													_account_type.html( '' );
												} else {
													_account_type.html( _account_type_val + ( vv.unread - _g_c_val ) );
												}

											}

										} );
									} );
								}

							}

						},
						complete: function() {

						}
					} );

				}, 20000 );

			}, 20000 );

		},

		/* 监听新消息 */
		listenOneReceived: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.listenOneReceived, opt || {} );

			sns.conf.listenOneReceived.timeoutIntVal = window.setTimeout( function() {
				window.clearInterval( sns.conf.listenOneReceived.intVal );
				sns.conf.listenOneReceived.intVal = window.setInterval( function() {

					$.ajax( {
						url: '/message/getOneReceived',
						type: 'post',
						cache: false,
						data: 'timestamp=' + $( '.m_box>div:last' ).attr( 'time' ) + '&aid=' + opts.ts.attr( 'aid' ) + '&rid=' + opts.ts.attr( 'rid' ) + '&type=' + opts.ts.attr( 'type' ) + '&fid=' + opts.ts.attr( 'fid' ),
						async: true,
						dataType: 'text',
						crossDomain: false,
						beforeSend: function() {
						},
						success: function( data ) {

							if ( !data ) {
								return;
							}

							data = $.parseJSON( data );

							for ( var key in data ) {

								data = $.parseJSON( data[ key ] );

								if ( !data || !data.text ) {
									return;
								}

								sns.insertOneReceivedMessage( {
									type: 'text',
									data: {
										message: data.text,
										timestamp: data.timestamp,
										aid: data.recipient,
										type: opts.ts.attr( 'type' ),
										fid: data.sender,
										nickname: opts.ts.attr( 'nickname' )
									}
								} );
							}
						},
						complete: function() {

						}
					} );

				}, 7000 );

			}, 7000 );

		},

		/* 监听新增分组 */
		listenGroupPlus: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.listenGroupPlus, opt || {} );

			$( '.group-plus' ).bind( 'click', function() {

				layer.prompt( { title: '输入分组名，并确认' }, function( name, index ) {

					$.ajax( {
						url: '/message/addGroup',
						type: 'post',
						cache: false,
						data: 'name=' + name,
						async: true,
						dataType: 'text',
						crossDomain: false,
						success: function( data ) {

							if ( data == 'error' ) {
								layer.msg( '添加失败！' );
							}

							if ( data == 'success' ) {
								layer.closeAll();
								layer.msg( '添加成功,稍后将刷新页面！', function() {
									window.location.reload();
								} );
							}

						}
					} );


				} );

			} );

		},

		/* 获取选中好友的历史消息，ajax请求 */
		listenChatRoom: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.listenSend, opt || {} );

			$( '.chat_room' ).bind( 'click', function() {
				var _type = $( this ).attr( 'type' ),
					_aid = $( this ).attr( 'aid' );
				$( '.f_box .item,.g_box .g_c,.show_all_friends' ).show();
				$( '.f_box .item[aid!=' + _aid + ']' ).hide();
				$( '.g_box .g_c[aid!=' + _aid + ']' ).hide();
			} );
		},
		/* 获取选中好友的历史消息，ajax请求 */
		listenShowAllFriends: function( opt ) {
			var opts = {}, sns = this;
			opts = $.extend( opts, this.conf.listenSend, opt || {} );

			$( '.show_all_friends' ).bind( 'click', function() {
				$( '.f_box .item,.g_box .g_c' ).show();
				$( this ).hide();
			} );
		},

		/* 全选实现
		 * @head 全选按钮的class名
		 * @group 一个页面有多组checkbox时 check-head的父元素
		 * @item 要选择的所有input的class名
		 * */
		checkAll: function( opt ) {
			var opts = {}, option;
			opts = $.extend( opts, this.conf.checkAll, opt || {} );

			$( opts.head ).bind( 'click', function( event ) {
				event.stopPropagation();

				if ( opts.group ) {
					$( this ).parent( opts.group ).nextUntil( opts.group ).find( opts.item ).prop( "checked", this.checked );
				} else {
					$( opts.item ).prop( "checked", this.checked );
				}

			} );
			$( opts.item ).bind( 'click', function( event ) {
				event.stopPropagation();
				var head, group, items;
				if ( opts.group ) {
					group = $( this ).parent().prevAll( opts.group ).first();
					head = group.children( opts.head );
					items = group.nextUntil( opts.group ).find( opts.item );
				} else {
					head = $( opts.head );
					items = $( opts.item );
				}

				items.each( function( i ) {
					if ( !this.checked ) {
						head.prop( "checked", false );
						return false;
					}
					head.prop( "checked", true );
				} );

			} );
		},

		/* 根据select更新相关input值 */
		selectChange: function( select, input ) {
			if ( select.length < 1 || input.length < 1 ) {
				return;
			}
			if ( input.val() == '' ) {
				input.val( select.find( 'option' ).first().attr( 'title' ) );
			}
			select.on( 'change', function() {
				input.val( $( this ).find( 'option:selected' ).attr( 'title' ) );
			} );
		},

		/* 设置表单的值 */
		setValue: function( name, value ) {
			var first = name.substr( 0, 1 ), input, i = 0, val;
			if ( value === "" ) return;

			if ( "#" === first || "." === first ) {
				input = $( name );
			} else {
				input = $( "[name='" + name + "']" );
			}

			if ( input.eq( 0 ).is( ":radio" ) ) { //单选按钮
				input.filter( "[value='" + value + "']" ).each( function() {
					this.checked = true
				} );
			} else if ( input.eq( 0 ).is( ":checkbox" ) ) { //复选框
				if ( !$.isArray( value ) ) {
					val = new Array();
					val[ 0 ] = value;
				} else {
					val = value;
				}
				for ( i = 0, len = val.length; i < len; i++ ) {
					input.filter( "[value='" + val[ i ] + "']" ).each( function() {
						this.checked = true
					} );
				}
			} else {  //其他表单选项直接设置值
				input.val( value );
			}
		},

		adminAjaxAsk: function( opt ) {

			var opts = {}, sns = this, _mask = '';

			opts = $.extend( opts, this.conf.adminAjaxAsk, opt || {} );

			opts.btnPosition = this.checkBtn( opts.a );

			//opts = this.adminAjaxCookie(opts);

			if ( !opt || !opt.form ) {

			} else {
				opts.ajax.data = $( '.' + opts.form ).serialize();
			}

			$.ajax( {
				url: opts.a,
				type: opts.ajax.type,
				cache: opts.ajax.cache,
				data: opts.ajax.data,
				async: opts.ajax.async,
				dataType: opts.ajax.dataType,
				crossDomain: opts.ajax.crossDomain,
				beforeSend: function() {

					if ( 99 == opts.ask ) {
						_mask = layer.msg( '加载执行，请稍候！', {
							icon: 6,
							shade: [ 0.5, '#000' ]
						} );
					} else {
						if ( opts.layer.btn ) {

							var _layerOpts = $.extend( {
								type: 0,
								title: '信息提示',
								content: '执行操作',
								btn: '',
								yes: function( index, layero ) {
									layer.closeAll();
									sns.adminAjaxAsk( $.extend( opts, { a: opts.a, ask: 99 } ) );
								},
								cancel: function( index ) {
								}
							}, opts.layer );

							layer.open( _layerOpts );

							return false;
						}
					}
				},
				success: function( data ) {

					if ( opts.custom ) {
						opts.custom( data );
						return;
					}

					try {
						data = $.parseJSON( data );
						opts.ask = data.ask;
					} catch ( e ) {
						opts.ask = 99;
					}

					/* $.parseJSON 异常时做下面的处理 */
					if ( $.type( data ) === 'object' ) {
						opts.ask = data.ask;
					} else {
						opts.ask = 99;
					}

					if ( 99 == opts.ask ) {

						if ( data && data.indexOf( 'admin-login-login-admin' ) != -1 ) {
							window.location.reload();
							return false;
						}

						$( '.' + opts.replaceBox ).html( data );

					} else {

						var _layerOpts = $.extend( {
							title: false,
							time: 2000,
							icon: 6,
							shade: [ 0.5, '#000' ],
							content: '操作成功！'
						}, data );

						_layerOpts.ask == 98 ?
							layer.msg( _layerOpts.content, _layerOpts, function() {
								if ( _layerOpts.reload ) {
									sns.adminAjaxAsk( { a: opts.a, reload: true } );
								} else if ( _layerOpts.refresh ) {
									//sns.adminAjaxAsk({a: opts.a,ask:98,ajax:{type:'post'}});
									window.location.reload();
								} else {
									sns.adminAjaxAsk( { a: opts.a } );
								}
							} ) :
							_layerOpts.ask == 97 ?
								layer.msg( _layerOpts.content, _layerOpts, function() {
									if ( _layerOpts.data ) {
										$( _layerOpts.sortBox ).html( _layerOpts.data );
									}
								} ) : layer.open( _layerOpts );
					}
				},
				complete: function() {
					if ( _mask ) {
						layer.close( _mask );
					}

					if ( opts.callback ) {
						opts.callback;
						return;
					}

				}

			} );
		},

		/* 后台Ajax提交时记录信息到cookie中 */
		adminAjaxCookie: function( opt ) {

			var opts = {},
				noCookie,
				_history,
				_history_r_top,
				_history_l_con,
				_history_r_con,
				splitString = this.conf.globals.splitString;

			opts = $.extend( opts, this.conf.adminAjaxCookie, opt || {} );
			noCookie = this.checkNoCookie( opts );

			/* 重置历史记录的记步指针 */
			if ( !opts.history ) {
				this.conf.cookieInit.current = this.conf.cookieInit.step;
				this.conf.adminAjaxAsk.current = false;
			}

			/* cookie字符分割成数组 */
			_history = $.localStorage.get( 'history' ).split( splitString );
			_history_r_top = $.localStorage.get( 'history_r_top' ).split( splitString );
			_history_l_con = $.localStorage.get( 'history_l_con' ).split( splitString );
			_history_r_con = $.localStorage.get( 'history_r_con' ).split( splitString );

			/* 默认调用右侧内容，为了方便调用左侧内容做下列处理 ：：点击上方按钮 */
			if ( opts.btnPosition == 'r_top' && !noCookie ) {
				opts.replaceBox = 'left_menu_c';

				_history_r_top = _history_r_top.slice( -(_history_r_top.length - 1) );
				_history_r_top.push( opts.a );
				$.localStorage.set( 'history_r_top', _history_r_top.join( splitString ) );

				_history = _history.slice( -(_history.length - 1) );
				_history.push( 1 );
				$.localStorage.set( 'history', _history.join( splitString ) );

			}

			/* 点击左侧按钮 */
			if ( opts.btnPosition == 'l_con' && !noCookie ) {
				_history_l_con = _history_l_con.slice( -(_history_l_con.length - 1) );
				_history_l_con.push( opts.a );
				$.localStorage.set( 'history_l_con', _history_l_con.join( splitString ) );

				_history = _history.slice( -(_history.length - 1) );
				_history.push( 2 );
				$.localStorage.set( 'history', _history.join( splitString ) );
			}

			/* 点击右侧按钮 */
			if ( opts.btnPosition == 'r_con' && !noCookie ) {
				_history_r_con = _history_r_con.slice( -(_history_r_con.length - 1) );
				_history_r_con.push( opts.a );
				$.localStorage.set( 'history_r_con', _history_r_con.join( splitString ) );

				_history = _history.slice( -(_history.length - 1) );
				_history.push( 3 );
				$.localStorage.set( 'history', _history.join( splitString ) );
			}

			if ( opts.history ) {

				this.conf.cookieInit.current--;
				this.conf.adminAjaxAsk.current = true;

				switch ( _history[ this.conf.cookieInit.current ] ) {
					case '1':
						opts.a = _history_r_top[ this.conf.cookieInit.current ];
						break;
					case '2':
						opts.a = _history_l_con[ this.conf.cookieInit.current ];
						break;
					case '3':
						opts.a = _history_r_con[ this.conf.cookieInit.current ];
						break;
					default :
						break;
				}


			} else if ( opts.reload ) {

				if ( opts.btnPosition == 'r_con' ) {
					opts.a = _history_r_con[ 1 ];
				}

			}

			return opts;
		},

		/* 检测是否记录cookie */

		checkNoCookie: function( opts ) {

			if ( !opts.noCookie && !opts.history ) {
				return false;
			} else {
				return true;
			}

		},

		/* 检测点击按钮的位置 */

		checkBtn: function( th_a ) {

			if ( $.inArray( $( th_a ).attr( 'data-group' ), [ 3, 4, 5 ] ) != -1 || $( th_a ).parents( '.r_con' ).length > 0 ) {
				return 'r_con';
			}

			if ( $( th_a ).attr( 'data-group' ) == 1 || $( th_a ).parents( '.r_top' ).length > 0 ) {
				return 'r_top';
			}

			if ( $( th_a ).attr( 'data-group' ) == 2 || $( th_a ).parents( '.l_con' ).length > 0 ) {
				return 'l_con';
			}

		},

		/* 特殊按钮的检测 */
		specialButton: function( th_a ) {
			if ( !th_a ) {
				return;
			}

			if ( $( th_a ).attr( 'data-id' ) != 'logout' ) {
				return true;
			}

		},

		/* 检测cookie中的链接请求的是哪个区域 ：：暂时没用*/

		matchSider: function( _history ) {

			if ( !_history[ 0 ].match( 'getSider' ) ) {
				return 0;
			}

			if ( !_history[ 2 ].match( 'getSider' ) ) {
				return 2;
			}

			if ( !_history[ 4 ].match( 'getSider' ) ) {
				return 4;
			}

			return -1;

		},

		/* 检测cookie中记录的链接是否有相同的，也就是判断是否多次点击同一个按钮 ：：暂时没用 */
		checkUrl: function( th_a, _history ) {

			th_a = th_a.toString();

			if ( th_a == _history[ 2 ] || th_a == _history[ 4 ] || _history[ 0 ] == _history[ 2 ] ) {
				return true;
			}

		},

		/* 后退并刷新 */

		goBack: function( opt, refresh ) {
			if ( !refresh ) {
				history.go( opt );
			} else {
				history.back( opt );
			}
		},
		/* json对象转换成字符串：：用于测试 */
		obj2string: function( o ) {
			var r = [];
			if ( typeof o == "string" ) {
				return "\"" + o.replace( /([\'\"\\])/g, "\\$1" ).replace( /(\n)/g, "\\n" ).replace( /(\r)/g, "\\r" ).replace( /(\t)/g, "\\t" ) + "\"";
			}
			if ( typeof o == "object" ) {
				if ( !o.sort ) {
					for ( var i in o ) {
						r.push( i + ":" + obj2string( o[ i ] ) );
					}
					if ( !!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test( o.toString ) ) {
						r.push( "toString:" + o.toString.toString() );
					}
					r = "{" + r.join() + "}";
				} else {
					for ( var i = 0; i < o.length; i++ ) {
						r.push( obj2string( o[ i ] ) )
					}
					r = "[" + r.join() + "]";
				}
				return r;
			}
			return o.toString();
		},


		/* 更新字段 ：：暂时不可用 */

		fieldUpdate: function( id, th ) {

			var url = "/common/Admin/fieldUpdate/";
			//var url = "/" + $("#module").val() + "/" + $("#controller").val() + "/fieldUpdate/id/" + id + ".html";

			$.ajax( {
				type: 'post',
				url: url,
				data: $( th ).parents( 'form' ).serialize(),
				success: function( data ) {
					$( th ).siblings( ".edit_msg" ).html( "编辑成功！" ).fadeOut( 3000 );
				},
				error: function() {
					$( th ).siblings( ".edit_msg" ).html( "编辑失败！" ).fadeOut( 3000 );
				}
			} );

		},

		getFnName: function( callee ) {
			var _callee = callee.toString().replace( /[\s\?]*/g, "" ),
				comb = _callee.length >= 50 ? 50 : _callee.length;
			_callee = _callee.substring( 0, comb );
			var name = _callee.match( /^function([^\(]+?)\(/ );
			if ( name && name[ 1 ] ) {
				return name[ 1 ];
			}
			var caller = callee.caller,
				_caller = caller.toString().replace( /[\s\?]*/g, "" );
			var last = _caller.indexOf( _callee ),
				str = _caller.substring( last - 30, last );
			name = str.match( /var([^\=]+?)\=/ );
			if ( name && name[ 1 ] ) {
				return name[ 1 ];
			}
			return "anonymous"
		},

		context: (function() {

			var options = {
				fadeSpeed: 100,
				filter: function( $obj ) {
					// Modify $obj, Do not return
				},
				above: 'auto',
				preventDoubleContext: true,
				compress: false
			};

			function initialize( opts ) {

				options = $.extend( {}, options, opts );

				$( document ).on( 'click', 'html', function() {
					$( '.dropdown-context' ).fadeOut( options.fadeSpeed, function() {
						$( '.dropdown-context' ).css( { display: '' } ).find( '.drop-left' ).removeClass( 'drop-left' );
					} );
				} );
				if ( options.preventDoubleContext ) {
					$( document ).on( 'contextmenu', '.dropdown-context', function( e ) {
						e.preventDefault();
					} );
				}
				$( document ).on( 'mouseenter', '.dropdown-submenu', function() {
					var $sub = $( this ).find( '.dropdown-context-sub:first' ),
						subWidth = $sub.width(),
						subLeft = $sub.offset().left,
						collision = (subWidth + subLeft) > window.innerWidth;
					if ( collision ) {
						$sub.addClass( 'drop-left' );
					}
				} );

			}

			function updateOptions( opts ) {
				options = $.extend( {}, options, opts );
			}

			function buildMenu( data, id, subMenu ) {
				var subClass = (subMenu) ? ' dropdown-context-sub' : '',
					compressed = options.compress ? ' compressed-context' : '',
					$menu = $( '<ul class="dropdown-menu dropdown-context' + subClass + compressed + '" id="dropdown-' + id + '"></ul>' );
				var i = 0, linkTarget = '';
				for ( i; i < data.length; i++ ) {
					if ( typeof data[ i ].divider !== 'undefined' ) {
						$menu.append( '<li class="divider"></li>' );
					} else if ( typeof data[ i ].header !== 'undefined' ) {
						$menu.append( '<li class="nav-header">' + data[ i ].header + '</li>' );
					} else {
						if ( typeof data[ i ].href == 'undefined' ) {
							data[ i ].href = '#';
						}
						if ( typeof data[ i ].target !== 'undefined' ) {
							linkTarget = ' target="' + data[ i ].target + '"';
						}
						if ( typeof data[ i ].subMenu !== 'undefined' ) {
							$sub = ('<li class="dropdown-submenu"><a tabindex="-1" href="' + data[ i ].href + '">' + data[ i ].text + '</a></li>');
						} else {
							$sub = $( '<li><a tabindex="-1" href="' + data[ i ].href + '"' + linkTarget + '>' + data[ i ].text + '</a></li>' );
						}
						if ( typeof data[ i ].action !== 'undefined' ) {
							var actiond = new Date(),
								actionID = 'event-' + actiond.getTime() * Math.floor( Math.random() * 100000 ),
								eventAction = data[ i ].action;
							$sub.find( 'a' ).attr( 'id', actionID );
							$( '#' + actionID ).addClass( 'context-event' );
							$( document ).on( 'click', '#' + actionID, eventAction );
						}
						$menu.append( $sub );
						if ( typeof data[ i ].subMenu != 'undefined' ) {
							var subMenuData = buildMenu( data[ i ].subMenu, id, true );
							$menu.find( 'li:last' ).append( subMenuData );
						}
					}
					if ( typeof options.filter == 'function' ) {
						options.filter( $menu.find( 'li:last' ) );
					}
				}
				return $menu;
			}

			function addContext( selector, data ) {

				var d = new Date(),
					id = d.getTime(),
					$menu = buildMenu( data, id );

				$( 'body' ).append( $menu );


				$( document ).on( 'contextmenu', selector, function( e ) {
					e.preventDefault();
					e.stopPropagation();
					$.cookie( 'current_item', '#' + $( this ).attr( 'id' ) );
					$( '.dropdown-context:not(.dropdown-context-sub)' ).hide();

					$dd = $( '#dropdown-' + id );
					if ( typeof options.above == 'boolean' && options.above ) {
						$dd.addClass( 'dropdown-context-up' ).css( {
							top: e.pageY - 20 - $( '#dropdown-' + id ).height(),
							left: e.pageX - 13
						} ).fadeIn( options.fadeSpeed );
					} else if ( typeof options.above == 'string' && options.above == 'auto' ) {
						$dd.removeClass( 'dropdown-context-up' );
						var autoH = $dd.height() + 12;
						if ( (e.pageY + autoH) > $( 'html' ).height() ) {
							$dd.addClass( 'dropdown-context-up' ).css( {
								top: e.pageY - 20 - autoH,
								left: e.pageX - 13
							} ).fadeIn( options.fadeSpeed );
						} else {
							$dd.css( {
								top: e.pageY + 10,
								left: e.pageX - 13
							} ).fadeIn( options.fadeSpeed );
						}
					}
				} );
			}

			function destroyContext( selector ) {
				$( document ).off( 'contextmenu', selector ).off( 'click', '.context-event' );
			}

			return {
				init: initialize,
				settings: updateOptions,
				attach: addContext,
				destroy: destroyContext
			};
		})()


	};


})( jQuery );


/* 封装的遮罩层：：暂时没用,使用layer替代 */
(function( $ ) {
	$.i_mask = {
		add: function( opt ) {

			var opts = $.extend( {
				insertBox: 'r_con',
				offset: 62,
				box: "zzbg_box",
				mask: 'zzbg',
				icon: 't_load',
				iconSrc: '/static/admin/default/images/load_98.gif'
			}, opt || {} );

			var _insertBox = $( '.' + opts.insertBox );

			_insertBox.append( '<div class="' + opts.box + '"><div class="' + opts.mask + '"></div><img class="' + opts.icon + '" src="' + opts.iconSrc + '" /></div>' );

			var _box = $( '.' + opts.box ),
				_mask = $( '.' + opts.mask ),
				_icon = $( '.' + opts.icon );

			_box.width( _insertBox.width() ).height( _insertBox.height() );
			_mask.width( _insertBox.width() ).height( _insertBox.height() );

			_icon.css( {
				'top': (_box.height() - _icon.height()) / 2,
				'left': (_box.width() - _icon.width()) / 2
			} );

			return _box;
		},
		remove: function( opt ) {
			opt.remove();
		}
	};

})( jQuery );

/* jquery.nicescroll.plus
 -- the addon for nicescroll
 -- version 1.0.0 BETA
 -- copyright 13 InuYaksa*2013
 -- licensed under the MIT
 --
 -- http://areaaperta.com/nicescroll
 -- https://github.com/inuyaksa/jquery.nicescroll
 --
 */
(function( jQuery ) {

	var $ = jQuery;  // sandbox

	if ( !$ || !("nicescroll" in $) ) return;

	$.extend( $.nicescroll.options, {

		styler: false

	} );

	var _super = {
		"niceScroll": $.fn.niceScroll,
		"getNiceScroll": $.fn.getNiceScroll
	};

	$.fn.niceScroll = function( wrapper, opt ) {

		if ( !(typeof wrapper == "undefined") ) {
			if ( typeof wrapper == "object" ) {
				opt = wrapper;
				wrapper = false;
			}
		}

		var styler = (opt && opt.styler) || $.nicescroll.options.styler || false;

		if ( styler ) {
			nw = preStyler( styler );
			$.extend( nw, opt );
			opt = nw;
		}

		var ret = _super.niceScroll.call( this, wrapper, opt );

		if ( styler ) {
			doStyler( styler, ret );
		}

		ret.scrollTo = function( el ) {
			var off = this.win.position();
			var pos = this.win.find( el ).position();
			if ( pos ) {
				var top = Math.floor( pos.top - off.top + this.scrollTop() );
				this.doScrollTop( top );
			}
		};

		return ret;
	};

	$.fn.getNiceScroll = function( index ) {
		var ret = _super.getNiceScroll.call( this, index );
		ret.scrollTo = function( el ) {
			this.each( function() {
				this.scrollTo.call( this, el );
			} );
		};
		return ret;
	};

	function preStyler( styler ) {
		var opt = {};
		switch ( styler ) {
			case "fb":
				opt.autohidemode = false;
				opt.cursorcolor = "#7B7C7E";
				opt.railcolor = "";
				opt.cursoropacitymax = 0.8;
				opt.cursorwidth = 10;
				opt.cursorborder = "1px solid #868688";
				opt.cursorborderradius = "10px";
				break;
		}
		return opt;
	}

	function doStyler( styler, nc ) {
		if ( !nc.rail ) return;

		switch ( styler ) {
			case "fb":

				nc.rail.css( {
					"-webkit-border-radius": "10px",
					"-moz-border-radius": "10px",
					"border-radius": "10px"
				} );

				nc.cursor.css( { width: 3 } );

				var obj = (nc.ispage) ? nc.rail : nc.win;

			function endHover() {
				nc._stylerfbstate = false;
				nc.rail.css( {
					"backgroundColor": ""
				} );
				nc.cursor.stop().animate( { width: 3 }, 200 );
			}

				obj.hover( function() {
						nc._stylerfbstate = true;
						nc.rail.css( {
							"backgroundColor": "#CED0D3"
						} );
						nc.cursor.stop().css( { width: 10 } );
					},
					function() {
						if ( nc.rail.drag ) return;
						endHover();
					} );

				$( document ).mouseup( function() {
					if ( nc._stylerfbstate ) endHover();
				} );

				break;
		}

	}

})( jQuery );

/**
 * jQuery JSON plugin v2.6.0
 * https://github.com/Krinkle/jquery-json
 *
 * @author Brantley Harris, 2009-2011
 * @author Timo Tijhof, 2011-2016
 * @source This plugin is heavily influenced by MochiKit's serializeJSON, which is
 *         copyrighted 2005 by Bob Ippolito.
 * @source Brantley Harris wrote this plugin. It is based somewhat on the JSON.org
 *         website's http://www.json.org/json2.js, which proclaims:
 *         "NO WARRANTY EXPRESSED OR IMPLIED. USE AT YOUR OWN RISK.", a sentiment that
 *         I uphold.
 * @license MIT License <https://opensource.org/licenses/MIT>
 */
(function( factory ) {
	if ( typeof define === 'function' && define.amd ) {
		// AMD
		define( [ 'jquery' ], factory );
	} else if ( typeof exports === 'object' ) {
		// CommonJS
		factory( require( 'jquery' ) );
	} else {
		// Browser globals
		factory( jQuery );
	}
}( function( $ ) {
	'use strict';

	var escape = /["\\\x00-\x1f\x7f-\x9f]/g,
		meta = {
			'\b': '\\b',
			'\t': '\\t',
			'\n': '\\n',
			'\f': '\\f',
			'\r': '\\r',
			'"': '\\"',
			'\\': '\\\\'
		},
		hasOwn = Object.prototype.hasOwnProperty;

	/**
	 * jQuery.toJSON
	 * Converts the given argument into a JSON representation.
	 *
	 * @param o {Mixed} The json-serializable *thing* to be converted
	 *
	 * If an object has a toJSON prototype, that will be used to get the representation.
	 * Non-integer/string keys are skipped in the object, as are keys that point to a
	 * function.
	 *
	 */
	$.toJSON = typeof JSON === 'object' && JSON.stringify ? JSON.stringify : function( o ) {
		if ( o === null ) {
			return 'null';
		}

		var pairs, k, name, val,
			type = $.type( o );

		if ( type === 'undefined' ) {
			return undefined;
		}

		// Also covers instantiated Number and Boolean objects,
		// which are typeof 'object' but thanks to $.type, we
		// catch them here. I don't know whether it is right
		// or wrong that instantiated primitives are not
		// exported to JSON as an {"object":..}.
		// We choose this path because that's what the browsers did.
		if ( type === 'number' || type === 'boolean' ) {
			return String( o );
		}
		if ( type === 'string' ) {
			return $.quoteString( o );
		}
		if ( typeof o.toJSON === 'function' ) {
			return $.toJSON( o.toJSON() );
		}
		if ( type === 'date' ) {
			var month = o.getUTCMonth() + 1,
				day = o.getUTCDate(),
				year = o.getUTCFullYear(),
				hours = o.getUTCHours(),
				minutes = o.getUTCMinutes(),
				seconds = o.getUTCSeconds(),
				milli = o.getUTCMilliseconds();

			if ( month < 10 ) {
				month = '0' + month;
			}
			if ( day < 10 ) {
				day = '0' + day;
			}
			if ( hours < 10 ) {
				hours = '0' + hours;
			}
			if ( minutes < 10 ) {
				minutes = '0' + minutes;
			}
			if ( seconds < 10 ) {
				seconds = '0' + seconds;
			}
			if ( milli < 100 ) {
				milli = '0' + milli;
			}
			if ( milli < 10 ) {
				milli = '0' + milli;
			}
			return '"' + year + '-' + month + '-' + day + 'T' +
				hours + ':' + minutes + ':' + seconds +
				'.' + milli + 'Z"';
		}

		pairs = [];

		if ( $.isArray( o ) ) {
			for ( k = 0; k < o.length; k++ ) {
				pairs.push( $.toJSON( o[ k ] ) || 'null' );
			}
			return '[' + pairs.join( ',' ) + ']';
		}

		// Any other object (plain object, RegExp, ..)
		// Need to do typeof instead of $.type, because we also
		// want to catch non-plain objects.
		if ( typeof o === 'object' ) {
			for ( k in o ) {
				// Only include own properties,
				// Filter out inherited prototypes
				if ( hasOwn.call( o, k ) ) {
					// Keys must be numerical or string. Skip others
					type = typeof k;
					if ( type === 'number' ) {
						name = '"' + k + '"';
					} else if ( type === 'string' ) {
						name = $.quoteString( k );
					} else {
						continue;
					}
					type = typeof o[ k ];

					// Invalid values like these return undefined
					// from toJSON, however those object members
					// shouldn't be included in the JSON string at all.
					if ( type !== 'function' && type !== 'undefined' ) {
						val = $.toJSON( o[ k ] );
						pairs.push( name + ':' + val );
					}
				}
			}
			return '{' + pairs.join( ',' ) + '}';
		}
	};

	/**
	 * jQuery.evalJSON
	 * Evaluates a given json string.
	 *
	 * @param str {String}
	 */
	$.evalJSON = typeof JSON === 'object' && JSON.parse ? JSON.parse : function( str ) {
		/*jshint evil: true */
		return eval( '(' + str + ')' );
	};

	/**
	 * jQuery.secureEvalJSON
	 * Evals JSON in a way that is *more* secure.
	 *
	 * @param str {String}
	 */
	$.secureEvalJSON = typeof JSON === 'object' && JSON.parse ? JSON.parse : function( str ) {
		var filtered =
			str
				.replace( /\\["\\\/bfnrtu]/g, '@' )
				.replace( /"[^"\\\n\r]*"|true|false|null|-?\d+(?:\.\d*)?(?:[eE][+\-]?\d+)?/g, ']' )
				.replace( /(?:^|:|,)(?:\s*\[)+/g, '' );

		if ( /^[\],:{}\s]*$/.test( filtered ) ) {
			/*jshint evil: true */
			return eval( '(' + str + ')' );
		}
		throw new SyntaxError( 'Error parsing JSON, source is not valid.' );
	};

	/**
	 * jQuery.quoteString
	 * Returns a string-repr of a string, escaping quotes intelligently.
	 * Mostly a support function for toJSON.
	 * Examples:
	 * >>> jQuery.quoteString('apple')
	 * "apple"
	 *
	 * >>> jQuery.quoteString('"Where are we going?", she asked.')
	 * "\"Where are we going?\", she asked."
	 */
	$.quoteString = function( str ) {
		if ( str.match( escape ) ) {
			return '"' + str.replace( escape, function( a ) {
					var c = meta[ a ];
					if ( typeof c === 'string' ) {
						return c;
					}
					c = a.charCodeAt();
					return '\\u00' + Math.floor( c / 16 ).toString( 16 ) + (c % 16).toString( 16 );
				} ) + '"';
		}
		return '"' + str + '"';
	};

} ));

