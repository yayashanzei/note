<!doctype html>
<html lang="{{ config('app.locale') }}">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>{{ $title }}</title>
    <link type="image/x-icon" href="/favicon.ico" rel="shortcut icon"/>
    <link href="/favicon.ico" rel="bookmark icon"/>
    @if ( !empty($baseStatic) )
    {!! $baseStatic !!}
    @endif
    <!--[if lt IE 10]>
    <script src="{{ $path['common'] }}/js/PIE.js"></script>
    <![endif]-->
    <link rel="stylesheet" type="text/css" href="{{ $path['css'] }}/login.css" />
    <script src="{{ $path['common'] }}/js/validator.icebr.js"></script>
</head>

<body>

<div class="login_bg"><img src="{{$path['image']}}/login.jpg"/></div>
<div class="box">
    <div class="login">
        <div class="login_logo">
            {{--<div class="win10-login-box-square">
                <img src="{{$path['image']}}/avatar.gif" class="content">
            </div>--}}
        </div>
        <div class="login-group">
            <div class="login_left">
                <div class="win10-login-box-square">
                    <img src="{{$path['image']}}/avatar.gif" class="content">
                </div>
            </div>
            <div class="login_right">
                <div class="login-title">BLOG 登 录</div>
                <div class="error_tip"></div>
                <form method="post" class="form-x form-block form-big">
                    <div class="form-group">
                        <div class="field">
                            <span class="fa fa-user"></span>
                            <input type="text" class="layui-input padding" id="name" name="name" size="20" placeholder="请输入邮箱/昵称"
                                   tabindex="1"/>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="field">
                            <span class="fa fa-unlock-alt"></span>
                            <input type="password" class="layui-input padding" id="password" name="password" size="20" placeholder="请输入密码"
                                   tabindex="2"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="field">
                            <span class="fa fa-keyboard-o"></span>
                            <input type="text" class="layui-input padding" id="verify" name="verify" placeholder="请填入验证码" tabindex="3"/>
                            <img class="verifyimg reloadverify" src="/captcha/entry" alt="切换验证码" title="切换验证码"/>
                        </div>
                    </div>
                    <div class="form-group" style="padding:0;">
                        <a class="layui-btn layui-btn-normal login_button" href="/user/login" tabindex="4" onclick="return false;">登　录</a>
                        {{--<a class="margin-top a"  href="/user/trialApply" style="float: left;">申请试用</a>--}}
                        {{--<a class="margin-top a" href="/user/findpwd" style="float: right;">忘记密码</a>--}}
                    </div>
                </form>

            </div>
        </div>
    </div>
</div>


<script type="text/javascript">

	$( function() {

		$( "body" ).keydown( function( event ) {
			if ( event.keyCode == "13" ) {
				$( '.login_button' ).click();
			}
		} );

		var verifyimg = $( ".verifyimg" ).attr( "src" );

		$( ".reloadverify" ).click( function() {
			if ( verifyimg.indexOf( '?' ) > 0 ) {
				$( ".verifyimg" ).attr( "src", verifyimg + '&random=' + Math.random() );
			} else {
				$( ".verifyimg" ).attr( "src", verifyimg.replace( /\?.*$/, '' ) + '?' + Math.random() );
			}
		} );

		$( ".login_button" ).live( 'click', function() {
			var login = $( this )[ 0 ],
				name = $.trim( $( '#name' ).val() ),
				password = $.trim( $( '#password' ).val() ),
				verify = $.trim( $( '#verify' ).val() );

			$.ajax( {
				type: 'post',
				cache: false,
				url: login,
				data: $( '.form-block' ).serialize(),
				async: true,
				headers: {
					'X-XSRF-TOKEN': $.cookie( 'XSRF-TOKEN' )
				},
				dataType: 'json',
				beforeSend: function() {
					$( '.error_tip' ).text( '' );
					return $.iceValidator.checkField( {
						'field': {
							'用户名': {
								'value': name,
								'rule': 'require'
							},
							'密码': {
								'value': password,
								'rule': 'require'
							},
							'验证码': {
								'value': verify,
								'rule': 'require#验证码不能为空'
							}
						}
					} );
				},
				success: function( data ) {
					if ( $.type( data ) === 'object' ) {
						if ( data.status ) {
							window.location.href = data.goto;
						} else {
							if ( verifyimg.indexOf( '?' ) > 0 ) {
								$( ".verifyimg" ).attr( "src", verifyimg + '&random=' + Math.random() );
							} else {
								$( ".verifyimg" ).attr( "src", verifyimg.replace( /\?.*$/, '' ) + '?' + Math.random() );
							}
							$( '.error_tip' ).text( data[ 0 ] );
						}
					}
				}
			} );

		} );

	} );
</script>

</body>
</html>



