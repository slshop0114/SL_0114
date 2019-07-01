


//注意：导航 依赖 element 模块，否则无法进行功能性操作
layui.use('element', function(){
    var $ = layui.jquery
        ,element = layui.element;

    element.on('nav(demo)', function(elem){
        //console.log(elem.getAttribute("meun_id")); //得到当前点击的DOM对象
        var id=$(this).attr("meun_id");
        if(typeof(id)!="undefined"){
            console.log('进入方法');
            element.tabAdd('demo1', {
                title: '新选项'+ (Math.random()*1000|0) //用于演示
                ,content: '<iframe src="test.html" style="width:100%;height:491px;" scrolling="auto" frameborder="0"></iframe>'
                ,id: id//实际使用一般是规定好的id，这里以时间戳模拟下z
            })
            element.tabChange('demo1', id);
        }
    });
    //获取所有的菜单



            var ttt= $.parseJSON(tt);
            //先添加所有的主材单
            $.each(ttt,function(i,obj){
                var content='<li class="layui-nav-item">';
                content+='<a href="javascript:;">'+obj.mainFunction.functionName+'</a>';
                //这里是添加所有的子菜单
                content+=loadchild(obj);
                content+='</li>';
                $(".layui-nav-tree").append(content);
            });
            element.init();




    //组装子菜单的方法
    function loadchild(obj){
        if(obj==null){
            return;
        }

        var content='';
        if(obj.subsFunction!=null && obj.subsFunction.length>0){
            content+='<dl class="layui-nav-child">';
        }else{
            content+='<dl>';
        }

        if(obj.subsFunction!=null && obj.subsFunction.length>0){
            $.each(obj.subsFunction,function(i,note){
                content+='<dd>';
                content+="<a href=\""+note.funcUrl+"\">"+note.functionName+"</a>";
                if(note.subsFunction==null){
                    return;
                }
                content+=loadchild(note);
                content+='</dd>';
            });

            content+='</dl>';
        }
        return content;
    }
});





// 弹出表单
layui.use('layer', function(){ //独立版的layer无需执行这一句
    var $ = layui.jquery, layer = layui.layer; //独立版的layer无需执行这一句

    //触发事件
    var active = {

        notice: function(){
            //示范一个公告层
            layer.open({
                type: 1
                ,title: false //不显示标题栏
                ,closeBtn: false
                ,area: '300px;'
                ,shade: 0.8
                ,id: 'LAY_layuipro' //设定一个id，防止重复弹出
                ,btn: ['提交', '取消']
                ,btnAlign: 'c'
                ,moveType: 1 //拖拽模式，0或者1
                ,content: '<form>\n' +
                    '            请输入原密码<input id="oldpassword" type="password"><br>\n' +
                    '            请输出新密码<input id="newpassword" type="password"><br>\n' +
                    '            再次输入密码<input id="aginpassword" type="password"><br>\n' +
                    '        </form>'
                ,success: function(layero){
                    var btn = layero.find('.layui-layer-btn');
                    btn.find('.layui-layer-btn0').attr({
                        href: 'http://www.layui.com/'
                        ,target: '_blank'
                    });
                }
            });
        }

    };

    $('#layerDemo .layui-btn').on('click', function(){
        var othis = $(this), method = othis.data('method');
        active[method] ? active[method].call(this, othis) : '';
    });

});

