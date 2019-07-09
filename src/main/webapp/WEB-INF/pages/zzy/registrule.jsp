<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>

    <link href="/statics/css/zzy/registrule.css" rel="stylesheet">
    <link rel="stylesheet" href="/statics/layui/css/layui.css"  media="all">
    <script src="/statics/localjs/zzy/jquery.js" type="text/javascript"></script>
    <script src="/statics/localjs/zzy/jQuery3.4.1.js" type="text/javascript"></script>
    <script type="text/javascript" src="/statics/localjs/zzy/registrule.js"></script>
    <script src="/statics/localjs/zzy/jquery.cookie.js" type="text/javascript"></script>

<%@include file="/WEB-INF/pages/common/head.jsp"%>

<div class="bodyall">
<div class="row-fluid" style="width: 900px">
    <div class="box span12">
        <div class="box-header well">
            <h2><i class="icon-info-sign"></i>会员注册条款</h2>
        </div>
        <div class="box-content">
            <p class="p1">说明 <small></small></p>
            <p>
                · 会员资料必须认真填写如果出现错误将影响到奖金以及发货.<br/><br/>

                · 新会员的资料註册后的初始密码是证件的后6位，注册后请立即修改.<br/><br/>

                · 新会员註册后只是註册会员如果要成为正式会员必须： 购买产品.<br/><br/>

                · 购买产品等工作由正式会员代理完成.<br/><br/>

                · 註册会员可以修改其所有资料，当成为正式会员后将不能更改“会员用户名”、“推荐人用户名”.<br/><br/>

                · 会员资料修改：修改未购货激活的注册会员资料.<br/><br/>

                · 删除资料修改：删除未购货激活的注册会员资料. <br/><br/>

            </p>

            <p class="p1">注册条款 <small></small></p>
            <hr style="width: 80%;color: #9F9F9F">
            <p>
                1、 我已达法定年龄。我了解并同意作为一位会员，应遵行”SL会员商城”的政策和守则，对自己决定的时间和一切产品及健康宣导及行销活动负责。<br/>

                <br/>

                2、我十分了解向潜在的会员展示奖金和预测高额的收入是被禁止的行为，“”可以据此终止我的会员资格。<br/>

                <br/>

                3、作为会员，我将维护并提升“SL会员商城”的产品和声誉；不进行有损“SL会员商城”之声誉、产品或公共利益的行为，否则将被终止会员资格，SL会员商城还将保留其他法律措施。<br/>
                <br/>


                4、任何参与之个人或法人团体可以各自拥有一个会员资格。一旦正式成为会员就不能变动。<br/>

                <br/>

                5、我了解我将负责零售及批发的记录，这些记录将作为公司要求的评价和核实材料。在向潜在的会员或顾客展示“SL会员商城”的事业机会或产品时，我同意必须如实的介绍公司、产品、事业机会，不得夸大或做失实的介绍，否则我可能被终止会员资格 。<br/>

                <br/>

                6、公司将根据市场的变化保持可行的市场行销计画，将不定期的对会员增列有关的条款和条件，公司政策、程式、市场计划的修改和所有的变更，将视为在“SL会员商城”正式网站上所发布的协议部份之一。<br/>

                <br/>

                7、我了解并同意我有责任随时保持知悉“SL会员商城”所有当前最新的资讯，如果我没有这样做，“SL会员商城”对我忽略正确资讯的后果不负任何责任。<br/>


                <br/>
                8、我了解并确认公司没有做出任何有关收入之保证，利润保证或向我展示任何成功的事例。除了此处的声明外，公司没有对我做出任何口头或书面的担保或保证。“SL会员商城”并不建议任何可能的会员离开当前的职业，或在他们产品销售的零售交易带来稳定、可观的收入之前，即购买大量的产品。<br/>

                <br/>

                9、不可为的事项 ◆不得以训练、讲习、联谊、开会或其他类似之名义，要求参加人缴纳或承担与成本显不相当之费用。 包括保证金、违约金或其他明目的费用。 ◆不得自己或唆使他人抢线、转线、跳线等违规行为。一经发现公司将对违规者进行严肃处理。 ◆严禁在开展业务过程中涉及传销、宗教信仰、迷信、不道德或其他非商业性话题。 ◆未获公司许可及授权，不得直接或间接通过其他单位制作、出版、发行任何与“SL会员商城”有关的印刷品及视听资料。 ◆不得散佈任何未经“SL会员商城”公司认可的业务、政策、营运等资讯，或对公司公佈的资讯作夸大或失实的传播。由此而产生的一切不良后果由当事人承担，并且公司也将对其进行相应的处罚。 ◆未经公司批准，会员不得就与“SL会员商城”产品或业务有关的话题擅自接受新闻媒介的採访。<br/>
                <br/><br/> </p>
            <p class="p1"><b>特 别 声 明</b></p>
            <p>
                <br/>
                1、公司产品是经过有关国家和地区的有关专项检测报告，各种报告对产品的认证描述是对产品本身的安全和效力的认定，但不包括在使用过程中的一切失当的行为所造成的问题，包括由于错误的使用而造成的在关于其安全和效果在防止怀孕和或性传播感染的造成的问题。<br/>
                <br/>
                2、并在任何情况下，公司仅对权威检测部门的报告所描述的部分承认其效果，并只对产品说明书的内容负责。<br/>
                <br/>
                3、该产品已获得或将获得监管部门的批准，在任何一个国家的使用用于预防怀孕或性传播疾病，需要依照该国家法律和规章。<br/>
                <br/>
                4、不适当的储存，装卸和运输的产品可能会影响其品质，疗效和安全性。导致任何伤害，损失，损害等可能出现的结果，SL会员商城公司不承担任何责任。<br/> </p>
            <br/>
           <div class="right">
            <p >
                <input type="checkbox" class="agreerule" id="readme"/>同意上述条款
       
                <button class="layui-btn nextbtn"  onclick="nextbtn()" id="next" disabled="disabled"><i class="icon-chevron-left icon-white"></i>下一步</button>
            </p>
           </div>
            <p class="center">
                <button class="layui-btn closebtn"><i class="icon-chevron-left icon-white"></i>关闭本页</button>
            </p>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
</div>



