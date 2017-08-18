<!doctype html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $blog }}</title>

    <!-- 基础样式及js 包括jquery，layui，layer等-->
    {!! $baseStatic !!}

    <!-- 滚动条美化 -->
    <script type="text/javascript" src="{{ $path['common'] }}/nicescroll/jquery.nicescroll.min.js"></script>

    <!-- ztree树形菜单 -->
    <link rel="stylesheet" href="{{ $path['common'] }}/ztree3.5.29/css/iceAwesomeStyle/awesome.css" type="text/css">
    <script type="text/javascript" src="{{ $path['common'] }}/ztree3.5.29/js/jquery.ztree.all.js"></script>

    <!-- ueditor主体js -->
    <script type="text/javascript" src="{{ $path['common'] }}/ueditor1.4.3.3/ice.ueditor.config.js"></script>
    <script type="text/javascript" src="{{ $path['common'] }}/ueditor1.4.3.3/ice.ueditor.all.min.js"></script>

    <!-- 代码高亮 -->
    <script src="{{ $path['common'] }}/ueditor1.4.3.3/ueditor.parse.min.js"></script>
    <link rel="stylesheet" type="text/css" href="{{ $path['common'] }}/ueditor1.4.3.3/third-party/SyntaxHighlighter/shCoreDefault.css">
    <script type="text/javascript" src="{{ $path['common'] }}/ueditor1.4.3.3/third-party/SyntaxHighlighter/shCore.js"></script>


    <SCRIPT type="text/javascript">
		<!--
		layui.config( {
			base: '{{ $path['js'] }}/' //你的模块目录
		} ).use( 'home' ); //加载入口

		var setting = {
			view: {
				dblClickExpand: true,
				autoCancelSelected: true
			},
			check: {
				enable: false
			},
			callback: {
				onRightClick: OnRightClick,
				beforeDrop: beforeDrop,
				onDrop: onDrop,
				onClick: zTreeOnClick

			},
			data: {
				simpleData: {
					enable: true
				}
			},
			edit: {
				editNameSelectAll: false,
				enable: true,
				removeTitle: "remove",
				renameTitle: "rename",
				showRemoveBtn: false,
				showRenameBtn: false,
				drag: {
					autoExpandTrigger: true,
					isCopy: true,
					isMove: true,
					prev: true,
					inner: true,
					next: true,
					borderMax: 10,
					borderMin: -5,
					minMoveSize: 5,
					maxShowNodeNum: 5,
					autoOpenTime: 500
				}
			}
		};


		var zNodes = {!! $tree !!} ;

		// console.log(zNodes);
		$( document ).ready( function() {
			$.fn.zTree.init( $( "#treeDemo" ), setting, zNodes );
			zTree = $.fn.zTree.getZTreeObj( "treeDemo" );
			rMenu = $( "#leftRightMenu" );
		} );


		function onMouseUp( event, treeId, treeNode ) {
			console.log( event );
		};

		function zTreeOnClick( event, treeId, treeNode ) {
			$.ajax( {
				url: '/getnotelist?id=' + treeNode.id,
				type: 'get',
				cache: false,
				data: '',
				async: true,
				dataType: 'text',
				crossDomain: false,
				beforeSend: function() {

					_mask = $.i_mask.add( {
						insertBox: 'main_middle',
						boxOffsetY: 60,
						boxOffsetX: 211,
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

					var _context = '', data = $.parseJSON( data );

					$( '.middle_content' ).html( '' );

					if ( !data || !data[ 0 ] ) {
						_context = '<span class="no_note">该分类下无笔记</span>';
					}

					for ( var dk in data ) {

						if ( !data[ dk ] ) {
							continue;
						}

						var _data = data[ dk ];

						_context += '<div class="item" data-id="' + _data.id + '">' +
							'<div class="title">' + _data.title + '</div>' +
							'<div class="info">' +
							'<span class="date">' + moment.unix(_data.create_time ).format( 'YYYY/MM/DD HH:mm:ss') + ' </span>' +
							'<span class="dir">' + _data.category_id + '</span>' +
							'</div>' +
							'</div>';
					}

					$( _context ).appendTo( $( '.middle_content' ) );

				},
				complete: function() {

					if ( _mask ) {
						$.i_mask.remove( _mask );
					}

				}
			} );
		}

		function beforeDrag( treeId, treeNodes ) {
			for ( var i = 0, l = treeNodes.length; i < l; i++ ) {
				if ( treeNodes[ i ].drag === false ) {
					return false;
				}
			}
			return true;
		}

		function beforeDrop( treeId, treeNodes, targetNode, moveType ) {
			return targetNode ? targetNode.drop !== false : true;
		}

		function onDrop( event, treeId, treeNodes, targetNode, moveType ) {
			console.log( treeNodes.length + "," + (targetNode ? (targetNode.tId + ", " + targetNode.name) : "isRoot" ) );
		};

		function OnRightClick( event, treeId, treeNode ) {
			if ( !treeNode && event.target.tagName.toLowerCase() != "button" && $( event.target ).parents( "a" ).length == 0 ) {
				zTree.cancelSelectedNode();
				showRMenu( "root", event.clientX, event.clientY );
			} else if ( treeNode && !treeNode.noR ) {
				zTree.selectNode( treeNode );
				showRMenu( "node", event.clientX, event.clientY );
			}
		}

		function showRMenu( type, x, y ) {
			$( "#leftRightMenu ul" ).show();
			if ( type == "root" ) {
				$( "#m_del" ).hide();
				$( "#m_check" ).hide();
				$( "#m_unCheck" ).hide();
			} else {
				$( "#m_del" ).show();
				$( "#m_check" ).show();
				$( "#m_unCheck" ).show();
			}
			rMenu.css( { "top": (y - 50) + "px", "left": x + "px", "display": "block" } );

			$( "body" ).bind( "mousedown", onBodyMouseDown );
		}

		function hideRMenu() {
			if ( rMenu ) {
				rMenu.css( { "display": "none" } );
			}
			$( "body" ).unbind( "mousedown", onBodyMouseDown );
		}

		function onBodyMouseDown( event ) {
			if ( !(event.target.id == "rMenu" || $( event.target ).parents( "#leftRightMenu" ).length > 0) ) {
				rMenu.css( { "display": "none" } );
			}
		}

		function addCategory() {
			hideRMenu();
			var newNode = { name: "增加" + (addCount++) };
			if ( zTree.getSelectedNodes()[ 0 ] ) {
				newNode.checked = zTree.getSelectedNodes()[ 0 ].checked;
				zTree.addNodes( zTree.getSelectedNodes()[ 0 ], newNode );
			} else {
				zTree.addNodes( null, newNode );
			}
		}

		function categoryDelete() {
			hideRMenu();
			var nodes = zTree.getSelectedNodes();
			if ( nodes && nodes.length > 0 ) {
				if ( nodes[ 0 ].children && nodes[ 0 ].children.length > 0 ) {
					var msg = "要删除的节点是父节点，如果删除将连同子节点一起删掉。\n\n请确认！";
					if ( confirm( msg ) == true ) {
						zTree.removeNode( nodes[ 0 ] );
					}
				} else {
					zTree.removeNode( nodes[ 0 ] );
				}
			}
			scrollResize();
		}


		function checkTreeNode( checked ) {
			var nodes = zTree.getSelectedNodes();
			if ( nodes && nodes.length > 0 ) {
				zTree.checkNode( nodes[ 0 ], checked, true );
			}
			hideRMenu();
		}

		function resetTree() {
			hideRMenu();
			$.fn.zTree.init( $( "#treeDemo" ), setting, zNodes );
		}

        /* 封装的遮罩层：：暂时没用,使用layer替代 */
		(function( $ ) {
			$.i_mask = {
				add: function( opt ) {

					var opts = $.extend( {
						insertBox: 'r_con',
						boxOffsetX: 0,
						boxOffsetY: 0,
						offsetX: 0,
						offsetY: 0,
						box: "zzbg_box",
						mask: 'zzbg',
						icon: 't_load',
						iconSrc: '{{$path['image']}}/load_98.gif'
					}, opt || {} );

					var _insertBox = $( '.' + opts.insertBox );

					_insertBox.append( '<div class="' + opts.box + '"><div class="' + opts.mask + '"></div><img class="' + opts.icon + '" src="' + opts.iconSrc + '" /></div>' );

					var _box = $( '.' + opts.box ),
						_mask = $( '.' + opts.mask ),
						_icon = $( '.' + opts.icon );

					_box.width( _insertBox.width() ).height( _insertBox.height() );
					_mask.width( _insertBox.width() ).height( _insertBox.height() );

					_box.css( {
						'top': opts.boxOffsetY,
						'left': opts.boxOffsetX
					} );

					_icon.css( {
						'top': (_box.height() - _icon.height()) / 2 + opts.offsetY,
						'left': (_box.width() - _icon.width()) / 2 + opts.offsetX
					} );

					return _box;
				},
				remove: function( opt ) {
					opt.remove();
				}
			};

		})( jQuery );

		//-->
    </SCRIPT>

</head>
<body>

@include($skin.'public.header')

<div class="main">

    @include($skin.'public.left')

    <div class="mainright">

        <div class="note">
            <div class="note_bar">
                <div class="t">
                    <input class="note_title" readonly="readonly"></input>
                    <span class="btn_edit layui-btn layui-btn-small layui-btn-radius layui-btn-primary">
                        <span class="fa fa-lock"></span>
                        <span class="font"> 编 辑</span>
                    </span>
                </div>
                <div class="b">
                    <span class="note_date">创建时间：2016/04/12</span>
                    <span class="note_update">更新时间：2016/06/12</span>
                </div>
            </div>
            <div class="note_content">

                <div class="note_content_html"></div>

                <div class="note_content_edit" data-id="">
                    <script id="container" name="content" type="text/plain"></script>
                </div>

            </div>
        </div>

    </div>


</div>

@include($skin.'public.footer')

</body>
</html>

