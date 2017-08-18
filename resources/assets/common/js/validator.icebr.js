/**
 * Created by PhpStorm.
 * User: icebr:ice_br2046@163.com
 * Date: 17-7-24
 * Time: 下午4:31
 */

/* ice validator 对象 */
(function( $ ) {

	$.iceValidator = {

		/* 配置信息 */
		conf: {
			globals: {
				splitString: 'q_Y_p' /* 分割字符串 */
			},
			cookieInit: {
				step: 20, /*历史记录总步数*/
				current: 20 /*历史记录记步指针*/
			}
		},

		checkField: function( opt ) {

			var opts = {};
			opts = $.extend( opts, this.conf.cookieInit, opt || {} );

			try {

				if ( typeof opts.field != 'object' ) {
					return false;
				}

				for ( var fk in opts.field ) {
					var _val = opts.field[ fk ].value;
					var _rule = this.parseRule( opts.field[ fk ].rule );

					for ( var rk in _rule ) {
						var _fun = 'is' + this.titleCase( _rule[ rk ][ 0 ] );

						if ( !$.iceValidator[ _fun ] ) {
							$( '.error_tip' ).text( "验证错误！" );
							return false;
						}

						var err = this[ _fun ]( _val );

						if ( !err ) {
							$( '.error_tip' ).text( (!_rule[ rk ][ 1 ] ? fk + '不能为空！' : _rule[ rk ][ 1 ]) );
							return false;
						}

					}

				}

			} catch ( e ) {
				return false;
			}

		},
		isRequire: function( s ) {
			if ( $.trim( s ) == '' ) {
				return false;
			}
			return true;
		},
		isMobile: function( s ) {
			var patrn = /^1[0-9]{10}$/;
			if ( !patrn.exec( s ) ) {
				return false;
			}
			return true
		},
		isEmail: function( s ) {
			var patrn = /^\w+[@]\w+[.][\w.]+$/;
			if ( !patrn.exec( s ) ) {
				return false;
			}
			return true
		},
		isDisclaimer: function( s ) {
			if ( !s ) {
				return false;
			}
			return true
		},
		titleCase: function( str ) {
			return str.toLowerCase().split( ' ' ).map( function( word ) {
				return (word.charAt( 0 ).toUpperCase() + word.slice( 1 ));
			} ).join( ' ' );
		},

		parseRule: function( rule ) {
			var _rule = rule.split( '|' );
			for ( var i = 0; i < _rule.length; i++ ) {
				_rule[ i ] = _rule[ i ].split( '#' );
			}
			return _rule;
		}
	};

})( jQuery );

