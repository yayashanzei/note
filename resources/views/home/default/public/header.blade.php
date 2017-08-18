<!-- 顶部 -->
<div class="header">
    <div class="logo">
        <a href="/">
            <img src="{{$path['image']}}/logo.png"/>
            <span>NOTE BLOG</span>
        </a>
    </div>

    <div class="nav">

        <ul class="layui-nav menu_ul">
            <li class="layui-nav-item showNotice" id="showNotice" pc>
                <a href="javascript:;"><i class="iconfont icon-gonggao"></i><cite>系统公告</cite></a>
            </li>
            <li class="layui-nav-item" mobile>
                <a href="javascript:;" class="mobileAddTab" data-url="page/user/changePwd.html">
                    <i class="iconfont icon-shezhi1" data-icon="icon-shezhi1"></i><cite>设置</cite>
                </a>
            </li>
            <li class="layui-nav-item lockcms" pc>
                <a href="javascript:;"><i class="iconfont icon-lock1"></i><cite>锁屏</cite></a>
            </li>

        </ul>
    </div>

    <div class="user">

        <ul class="layui-nav menu_user">
            <li class="layui-nav-item" pc>
                <a href="javascript:;">
                    <img src="{{$path['image']}}/avatar.gif" class="layui-circle" width="35" height="35">
                    <cite>{{$userInfo['name']}}</cite>
                </a>
                <dl class="layui-nav-child">
                    <dd><a href="javascript:;" data-url="page/user/userInfo.html"><i class="iconfont icon-zhanghu"
                                                                                     data-icon="icon-zhanghu"></i><cite>个人资料</cite></a>
                    </dd>
                    <dd><a href="javascript:;" data-url="page/user/changePwd.html"><i class="iconfont icon-shezhi1"
                                                                                      data-icon="icon-shezhi1"></i><cite>修改密码</cite></a>
                    </dd>
                    <dd><a href="javascript:;" class="changeSkin noAddTab"><i class="iconfont icon-huanfu"></i><cite>更换皮肤</cite></a>
                    </dd>
                    <dd><a href="/user/logout" class="noAddTab"><i class="iconfont icon-loginout"></i><cite>退出</cite></a></dd>
                </dl>
            </li>
        </ul>
    </div>
</div>
