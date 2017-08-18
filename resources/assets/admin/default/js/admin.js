$(document).ready(function () {

    splitString = '=_=_=';

    /* 初始化上次点击状态，记录cookie中 */
    if ($.trim($.cookie('history')) == '') {
        $.cookie('history', location.href + splitString + location.href + splitString + location.href + splitString + '0');
    }
    if ($.trim($.cookie('history_r_top')) == '') {
        $.cookie('history_r_top', location.href + splitString + location.href + splitString + location.href + splitString + '0');
    }

    if ($.trim($.cookie('history_r_top_btn')) == '') {
        $.cookie('history_r_top_btn', '0' + splitString + '0' + splitString + '0' + splitString + '0');
    }

    if ($.trim($.cookie('history_l_con')) == '') {
        $.cookie('history_l_con', location.href + splitString + location.href + splitString + location.href + splitString + '0');
    }

    if ($.trim($.cookie('history_l_con_btn')) == '') {
        $.cookie('history_l_con_btn', '0' + splitString + '0' + splitString + '0' + splitString + '0');
    }

    if ($.trim($.cookie('history_r_con')) == '') {
        $.cookie('history_r_con', location.href + splitString + location.href + splitString + location.href + splitString + '0');
    }

    if ($.trim($.cookie('history_r_con_btn')) == '') {
        $.cookie('history_r_con_btn', '0' + splitString + '0' + splitString + '0' + splitString + '0');
    }

    if ($('.l_con').length > 0) {

        $('.l_con').height($(window).height() - 60);
        $('.r_con').height($(window).height() - 106);

        $('.l_con').niceScroll({
            cursorcolor: "#00AA88",
            cursorborder: '0',
            cursoropacitymax: '.5',
            cursorwidth: '6'
        });


        $(window).resize(function () {
            $('.l_con').height($(window).height() - 60);
            $('.r_con').height($(window).height() - 106);
        });

        var nav_list = $(".adi_h_nav").children("div");

        nav_list.each(function (i, val) {
            $(this).data("nav_class", i + 1);
        });

        nav_list.click(function () {
            $.cookie("nav_class", $(this).data("nav_class"));
            $(this).addClass('item_active').children('.a').addClass('a_active');
            $(this).siblings(".item").removeClass('item_active').children('.a').removeClass('a_active');
        });

        if ($.cookie("nav_class")) {
            var nav_class = $.cookie("nav_class");
            nav_list.eq(nav_class - 1).addClass('item_active').children('.a').addClass('a_active');
            nav_list.eq(nav_class - 1).siblings(".item").removeClass('item_active').children('.a').removeClass('a_active');

            if ($.cookie('history_l_con').split(splitString)[2] == location.href) {
                var th_a = $("<a href='admin/index/info.html' data-id=" + $.cookie('history_l_con_btn').split(splitString)[2] + " data-group='2'></a>")[0];
                adminAjaxAsk(nav_list.eq(nav_class - 1).children('a')[0], {callback: adminAjaxAsk(th_a)});
            } else {
                var th_a = $("<a href=" + $.cookie('history_l_con').split(splitString)[2] + " data-id=" + $.cookie('history_l_con_btn').split(splitString)[2] + " data-group='2'></a>")[0];
                adminAjaxAsk(nav_list.eq(nav_class - 1).children('a')[0], {callback: adminAjaxAsk(th_a)});
            }

        } else {
             nav_list.eq(0).addClass('item_active').children('.a').addClass('a_active');
             nav_list.eq(0).siblings(".item").removeClass('item_active').children('.a').removeClass('a_active');
            if ($.cookie('history_l_con').split(splitString)[2] == location.href) {
                var th_a = $("<a href='admin/index/info.html' data-id=" + $.cookie('history_l_con_btn').split(splitString)[2] + " data-group='2'></a>")[0];
                adminAjaxAsk(nav_list.eq(0).children('a')[0], {callback: adminAjaxAsk(th_a)});
            }
        }

        $(".left_menu").on('click', '.info_lst_t', function () {
            if ($(this).children('.icon-angle-down').length > 0) {
                $(this).nextUntil(".info_lst_t").slideUp(300, "easeInOutCubic");
                $(this).children(".info_lst_t_ico2").removeClass('icon-angle-down').addClass('icon-angle-left');
            } else {
                $(this).nextUntil(".info_lst_t").slideDown(300, "easeInOutCubic");
                $(this).children(".info_lst_t_ico2").removeClass('icon-angle-left').addClass('icon-angle-down');
            }
        });
    }

});


function adminAjaxAsk(th_a, option) {
    var opts = $.extend({
        _mask: '', /* 临时变量，不需要赋值 */
        btnPosition: checkBtn(th_a), /* 点击按钮的位置 */
        data: '', /* 要传送的数据 */
        insertBox: 'r_con', /* 遮罩的父级元素的 className */
        replaceBox: 'r_con', /* 请求成功后的返回值 将替换哪个元素的html 此项就是那个元素的className */
        type: 'get', /* 请求类型 */
        history: false, /* 返回 */
        reload: false, /* 重复当前动作 */
        refresh: false, /* 刷新当前页 */
        custom: false,
        callback: false,
        form: '', /* 表单class名 */
        async: true, /* 异步请求或者同步请求，默认异步请求 */
        crossDomain:true,
        dataType: 'html', /* ajax返回数据类型 默认html */
        ask: 99, /* 默认99-请求页面，0-（信息框）1-（页面层）2-（iframe层）3-（加载层）4-（tips层）  */
        layer: {}, /* layer 插件的参数 */
        checkHead: 'check-head',
        checkItem: 'check-item',
        _url: ''
    }, option || {});

    opts = adminAjaxCookie(th_a, opts);

    if (!option || !option.form) {

    } else {
        opts.data = $('.' + opts.form).serialize();
    }

    $.ajax({
        type: opts.type,
        cache: false,
        url: opts._url,
        data: opts.data,
        async: opts.async,
        dataType: opts.dataType,
        crossDomain:opts.crossDomain,
        beforeSend: function () {

            if (99 == opts.ask) {
                opts._mask = layer.msg('加载执行，请稍候！', {
                    icon: 16,
                    shade: [0.5, '#000']
                });
            } else {
                if (opts.layer.btn) {

                    var _layerOpts = $.extend({
                        type: 0,
                        title: '信息提示',
                        content: '执行操作',
                        btn: '',
                        yes: function (index, layero) {
                            layer.closeAll();
                            adminAjaxAsk(opts._url, $.extend(opts, {ask: 99}));
                        },
                        cancel: function (index) {
                        }
                    }, opts.layer);

                    layer.open(_layerOpts);

                    return false;
                }
            }
        },
        success: function (data) {

            if (opts.custom) {
                opts.custom(data);
                return;
            }

            try {
                var data = $.parseJSON(data);
                opts.ask = data.ask;
            } catch (e) {
                opts.ask = 99;
            }

            if (99 == opts.ask) {

                if (data && data.indexOf('admin-login-login-admin') != -1) {
                    window.location.reload();
                    return false;
                }

                $('.' + opts.replaceBox).html(data);
                pintuerInit();
                checkAll(opts.checkHead, opts.checkItem);

            } else {

                var _layerOpts = $.extend({
                    title: false,
                    time: 2000,
                    icon: 6,
                    shade: [0.5, '#000'],
                    content: '操作成功！'
                }, data);

                _layerOpts.ask == 98 ?
                    layer.msg(_layerOpts.content, _layerOpts, function () {
                        if (_layerOpts.reload) {
                            adminAjaxAsk(opts._url, {reload: true});
                        } else if (_layerOpts.refresh) {
                            window.location.reload();
                        } else {
                            adminAjaxAsk(opts._url, {history: true});
                        }
                    }) :
                    _layerOpts.ask == 97 ? layer.msg(_layerOpts.content, _layerOpts, function () {
                        if (_layerOpts.data) {
                            $(_layerOpts.sortBox).html(_layerOpts.data);
                        }
                    }) : layer.open(_layerOpts);
            }
        },
        complete: function () {
            if (opts._mask) {
                layer.close(opts._mask);
            }

            if (opts.callback) {
                opts.callback;
                return;
            }

        }

    });

}

function adminAjaxCookie(th_a, opts) {

    /* cookie字符分割成数组 */
    var _history = $.cookie('history').split(splitString);
    var _history_r_top = $.cookie('history_r_top').split(splitString);
    var _history_r_top_btn = $.cookie('history_r_top_btn').split(splitString);
    var _history_l_con = $.cookie('history_l_con').split(splitString);
    var _history_l_con_btn = $.cookie('history_l_con_btn').split(splitString);
    var _history_r_con = $.cookie('history_r_con').split(splitString);
    var _history_r_con_btn = $.cookie('history_r_con_btn').split(splitString);

    /* 默认调用右侧内容，为了方便调用左侧内容做下列处理 ：：点击上方按钮 */
    if (opts.btnPosition == 'r_top') {
        opts.insertBox = 'left_menu';
        opts.replaceBox = 'left_menu_c';

        var _history_r_top3 = parseInt(_history_r_top[3]);
        var _history_r_top_btn3 = parseInt(_history_r_top_btn[3]);
        $.cookie('history_r_top', _history_r_top[1] + splitString + _history_r_top[2] + splitString + th_a + splitString + (_history_r_top3 + 1));
        $.cookie('history_r_top_btn', _history_r_top_btn[1] + splitString + _history_r_top_btn[2] + splitString + $(th_a).attr('data-id') + splitString + (_history_r_top_btn3 + 1));
    }

    /* 点击左侧按钮 */
    if (opts.btnPosition == 'l_con') {
        if (specialButton(th_a)) {
            var _history_l_con3 = parseInt(_history_l_con[3]);
            var _history_l_con_btn3 = parseInt(_history_l_con_btn[3]);
            $.cookie('history_l_con', _history_l_con[1] + splitString + _history_l_con[2] + splitString + th_a + splitString + (_history_l_con3 + 1));
            $.cookie('history_l_con_btn', _history_l_con_btn[1] + splitString + _history_l_con_btn[2] + splitString + $(th_a).attr('data-id') + splitString + (_history_l_con_btn3 + 1));
        }
    }

    /* 点击右侧按钮 */
    if (opts.btnPosition == 'r_con') {
        var _history_r_con3 = parseInt(_history_r_con[3]);
        var _history_r_con_btn3 = parseInt(_history_r_con_btn[3]);
        $.cookie('history_r_con', _history_r_con[1] + splitString + _history_r_con[2] + splitString + th_a + splitString + (_history_r_con3 + 1));
        $.cookie('history_r_con_btn', _history_r_con_btn[1] + splitString + _history_r_con_btn[2] + splitString + $(th_a).attr('data-id') + splitString + (_history_r_con_btn3 + 1));
    }

    if (opts.history) {
        if (opts.btnPosition == 'r_con') {
            opts._url = _history_l_con[2];
            $.cookie('buttonId', _history_l_con_btn[2]);
        }
    } else if (opts.reload) {
        if (opts.btnPosition == 'r_con') {
            opts._url = _history_r_con[1];
            $.cookie('buttonId', _history_r_con_btn[1]);
        }
    } else {
        opts._url = th_a;

        $.cookie('buttonId', $(th_a).attr('data-id'));

    }

    return opts;
}

/* 检测点击按钮的位置 */
function checkBtn(th_a) {

    if ($.inArray($(th_a).attr('group'), [3, 4, 5]) != -1 || $(th_a).parents('.r_con').length > 0) {
        return 'r_con';
    }

    if ($(th_a).attr('group') == 1 || $(th_a).parents('.r_top').length > 0) {
        return 'r_top';
    }

    if ($(th_a).attr('group') == 2 || $(th_a).parents('.l_con').length > 0) {
        return 'l_con';
    }

}

function specialButton(th_a) {
    if (!th_a) {
        return;
    }

    if ($(th_a).attr('data-id') != 'logout') {
        return true;
    }

}

/* 检测cookie中的链接请求的是哪个区域 ：：暂时没用*/

function matchSider(_history) {

    if (!_history[0].match('getSider')) {
        return 0;
    }

    if (!_history[2].match('getSider')) {
        return 2;
    }

    if (!_history[4].match('getSider')) {
        return 4;
    }

    return -1;

}

/* 根据select更新相关input值 */
function selectChange(select, input) {

    if (select.length < 1 || input.length < 1) {
        return;
    }

    if (input.val() == '') {
        input.val(select.find('option').first().attr('title'));
    }
    select.on('change', function () {
        input.val($(this).find('option:selected').attr('title'));
    });
}

/* 设置表单的值 */
function setValue(name, value) {
    var first = name.substr(0, 1), input, i = 0, val;
    if (value === "") return;

    if ("#" === first || "." === first) {
        input = $(name);
    } else {
        input = $("[name='" + name + "']");
    }

    if (input.eq(0).is(":radio")) { //单选按钮
        input.filter("[value='" + value + "']").each(function () {
            this.checked = true
        });
    } else if (input.eq(0).is(":checkbox")) { //复选框
        if (!$.isArray(value)) {
            val = new Array();
            val[0] = value;
        } else {
            val = value;
        }
        for (i = 0, len = val.length; i < len; i++) {
            input.filter("[value='" + val[i] + "']").each(function () {
                this.checked = true
            });
        }
    } else {  //其他表单选项直接设置值
        input.val(value);
    }
}

/* 全选实现
 * @head 全选按钮的class名
 * @item 要选择的所有input的class名
 * */
function checkAll(head, item) {
    $('.' + head).click(function () {
        $('.' + item).prop("checked", this.checked);
    });
    $('.' + item).click(function () {
        var option = $('.' + item);
        option.each(function (i) {
            if (!this.checked) {
                $('.' + head).prop("checked", false);
                return false;
            } else {
                $('.' + head).prop("checked", true);
            }
        });
    });
}


/* 检测cookie中记录的链接是否有相同的，也就是判断是否多次点击同一个按钮 ：：暂时没用 */
function checkUrl(th_a, _history) {

    th_a = th_a.toString();

    if (th_a == _history[2] || th_a == _history[4] || _history[0] == _history[2]) {
        return true;
    }

}

/* json对象转换成字符串：：用于测试 */
function obj2string(o) {
    var r = [];
    if (typeof o == "string") {
        return "\"" + o.replace(/([\'\"\\])/g, "\\$1").replace(/(\n)/g, "\\n").replace(/(\r)/g, "\\r").replace(/(\t)/g, "\\t") + "\"";
    }
    if (typeof o == "object") {
        if (!o.sort) {
            for (var i in o) {
                r.push(i + ":" + obj2string(o[i]));
            }
            if (!!document.all && !/^\n?function\s*toString\(\)\s*\{\n?\s*\[native code\]\n?\s*\}\n?\s*$/.test(o.toString)) {
                r.push("toString:" + o.toString.toString());
            }
            r = "{" + r.join() + "}";
        } else {
            for (var i = 0; i < o.length; i++) {
                r.push(obj2string(o[i]))
            }
            r = "[" + r.join() + "]";
        }
        return r;
    }
    return o.toString();
}


/* 更新字段 ：：暂时不可用 */

function fieldUpdate(id, th) {

    var url = "/common/Admin/fieldUpdate/";
    //var url = "/" + $("#module").val() + "/" + $("#controller").val() + "/fieldUpdate/id/" + id + ".html";

    $.ajax({
        type: 'post',
        url: url,
        data: $(th).parents('form').serialize(),
        success: function (data) {
            $(th).siblings(".edit_msg").html("编辑成功！").fadeOut(3000);
        },
        error: function () {
            $(th).siblings(".edit_msg").html("编辑失败！").fadeOut(3000);
        }
    });

}


/* 封装的遮罩层：：暂时没用,使用layer替代 */
(function ($) {
    $.i_mask = {
        add: function (opt) {

            var opts = $.extend({
                insertBox: 'r_con',
                offset: 62,
                box: "zzbg_box",
                mask: 'zzbg',
                icon: 't_load',
                iconSrc: '/static/admin/default/images/load_98.gif'
            }, opt || {});

            var _insertBox = $('.' + opts.insertBox);

            _insertBox.append('<div class="' + opts.box + '"><div class="' + opts.mask + '"></div><img class="' + opts.icon + '" src="' + opts.iconSrc + '" /></div>');

            var _box = $('.' + opts.box),
                _mask = $('.' + opts.mask),
                _icon = $('.' + opts.icon);

            _box.height($(window).height());
            _mask.height($(window).height());

            _icon.css({
                'top': (_box.height() - _icon.height()) / 2,
                'left': (_box.width() - _icon.width()) / 2
            });

            return _box;
        },
        remove: function (opt) {
            opt.remove();
        }
    };

})(jQuery);

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
(function (jQuery) {

    var $ = jQuery;  // sandbox

    if (!$ || !("nicescroll" in $)) return;

    $.extend($.nicescroll.options, {

        styler: false

    });

    var _super = {
        "niceScroll": $.fn.niceScroll,
        "getNiceScroll": $.fn.getNiceScroll
    }

    $.fn.niceScroll = function (wrapper, opt) {

        if (!(typeof wrapper == "undefined")) {
            if (typeof wrapper == "object") {
                opt = wrapper;
                wrapper = false;
            }
        }

        var styler = (opt && opt.styler) || $.nicescroll.options.styler || false;

        if (styler) {
            nw = preStyler(styler);
            $.extend(nw, opt);
            opt = nw;
        }

        var ret = _super.niceScroll.call(this, wrapper, opt);

        if (styler) doStyler(styler, ret);

        ret.scrollTo = function (el) {
            var off = this.win.position();
            var pos = this.win.find(el).position();
            if (pos) {
                var top = Math.floor(pos.top - off.top + this.scrollTop());
                this.doScrollTop(top);
            }
        }

        return ret;
    }

    $.fn.getNiceScroll = function (index) {
        var ret = _super.getNiceScroll.call(this, index);
        ret.scrollTo = function (el) {
            this.each(function () {
                this.scrollTo.call(this, el);
            });
        }
        return ret;
    }

    function preStyler(styler) {
        var opt = {};
        switch (styler) {
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

    function doStyler(styler, nc) {
        if (!nc.rail) return;

        switch (styler) {
            case "fb":

                nc.rail.css({
                    "-webkit-border-radius": "10px",
                    "-moz-border-radius": "10px",
                    "border-radius": "10px"
                });

                nc.cursor.css({width: 3});

                var obj = (nc.ispage) ? nc.rail : nc.win;

            function endHover() {
                nc._stylerfbstate = false;
                nc.rail.css({
                    "backgroundColor": ""
                });
                nc.cursor.stop().animate({width: 3}, 200);
            }

                obj.hover(function () {
                        nc._stylerfbstate = true;
                        nc.rail.css({
                            "backgroundColor": "#CED0D3"
                        });
                        nc.cursor.stop().css({width: 10});
                    },
                    function () {
                        if (nc.rail.drag) return;
                        endHover();
                    });

                $(document).mouseup(function () {
                    if (nc._stylerfbstate) endHover();
                });

                break;
        }

    }

})(jQuery);