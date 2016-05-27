# SQLAPP
### inspired by Oracle Application Express (Apex)

SQL to web application with inputs/ouputs.Easy to build ,integrate,customize your web application, just via SQL

# 企业APP开发者平台,仅用SQL语句即可发布数据操作WEB应用
## 主要技术栈

1. .net WebForms/MVC/WEBAPI hybrids
2. 数据库智能:引用对应数据库的动态SQL分析包.
ORACLE为 DBMS_SQL包
MSSQL则用到了EXECUTE 和 SP_EXECUTESQL
3. 主要算法:
参数依赖联动使用DAG  “无回路有向图算法”.
4. 前端组件:
   angularjs + ui-state + restangular

# 应用适宜范围
  小型WEB应用:数据查阅,数据操控类应用,企业生产维护外挂等.<br>
  An inner website as http://10.36.111.213/easypump
<DIV class=gut style="LETTER-SPACING: 1pt; LINE-HEIGHT: 2"><H2>[原创]极速开发!! 企业APP开发者平台,只用会写SQL语句可以发布数据操作类WEB应用,开发就这么简单! !</H2>
<DIV style="LETTER-SPACING: 1pt; LINE-HEIGHT: 2">
<H2>
    <SPAN style="FONT-SIZE: 12px; FONT-FAMILY: microsoft &#10;yahei; COLOR: #337fe5">&nbsp;</SPAN><SPAN style="FONT-SIZE: 12px; FONT-FAMILY: microsoft yahei; COLOR: #337fe5">只要你会SQL语句,你就可以生成规范大方,功</SPAN><SPAN style="FONT-SIZE: 12px; FONT-FAMILY: microsoft &#10;yahei; COLOR: #337fe5">能强大的web页面!!</SPAN> </H2>
<H2>你可以: </H2>
<DIV>
<DIV>&nbsp; 1.能开发应用广泛的企业数据库"外挂"</DIV>
<DIV>&nbsp; 2.多种复杂度的外挂,比如向导型wizard,引导用户输入..... </DIV>
<DIV>&nbsp; 3.已有外挂的任意复杂度的集成,外挂嵌套外挂,模拟弹窗操作... </DIV>
<DIV>&nbsp; 4.管理自己的日常工作,把常见的操作做成web页面 </DIV>
<DIV>&nbsp; 5.发布数据查询? 有人要数据清单?太简单了,发布一个SQL语句,自定义一些参数...简单! </DIV>
<DIV>&nbsp; 6.还是数据变更?提供工具,自定义参数,限定参数格式,得心应手! </DIV>
<DIV>&nbsp; 7.可拖曳的菜单,目录管理,轻松管理! </DIV>
<DIV>&nbsp; 8.丰富的扩展功能 </DIV>
<DIV>.....更多的由你自由发挥... </DIV></DIV>&nbsp; 
<DIV>
<DIV>&nbsp;先来几个简单的例子: </DIV>
<DIV>---------------------- </DIV>
<DIV>例子1. </DIV>
```sql
select * from table1  where rownum <= :xh 
```
<DIV>默认生成 </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebv0nzj8fdj20da04ot8v.jpg" width=478 align=absMiddle height=168> </DIV>
<DIV>例子2. </DIV>
```sql
update table2 set attr  = :val  where  key=:key; 
```
<DIV>对上面的语句中参数<SPAN style="COLOR: #e53333">val</SPAN>设置数据源为 </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww4.sinaimg.cn/mw690/56f33ec4gw1ebv0w045w3j2077028748.jpg" width=259 align=absMiddle height=80> </DIV>
<DIV>或者 </DIV>
<DIV><IMG alt="" src="http://ww3.sinaimg.cn/mw690/56f33ec4gw1ebvq6pac60j20eg088wew.jpg" width=520 align=absMiddle height=296>&nbsp; </DIV>
<DIV>那么执行时,自动生成参数如下: </DIV>
<DIV>&nbsp; </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebv0tiywepj20dx03bdfx.jpg" width=501 align=absMiddle height=119> </DIV>
<DIV>3.例子3. </DIV>
```sql
declare 
  date1 date;
  date2 date;
begin
  date1:= to_date(:dt1,'yyyy-mm-dd hh24:mi:ss');
  date2:= to_date(:dt2,'yyyy-mm-dd hh24:mi:ss');
  DBMS_OUTPUT.PUT_LINE('相差结果='|| wxhf_time_eclipse(date2,date1)); 
end; 
```
<DIV>自动生成的参数界面图 </DIV>
<DIV><IMG alt="" src="http://ww3.sinaimg.cn/mw690/56f33ec4gw1ebv14nx02gj208b09ewf1.jpg" width=299 align=absMiddle height=338> </DIV>
<DIV>执行结果 </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww3.sinaimg.cn/mw690/56f33ec4gw1ebv1a0b4yqj208w06o74k.jpg" width=320 align=absMiddle height=240> </DIV></DIV>
<DIV><B></B>&nbsp; &nbsp; </DIV>
<DIV>&nbsp; </DIV>
<DIV>&nbsp; </DIV>
<DIV><SPAN style="FONT-SIZE: 16px; COLOR: #003399">下面就是码字...传说中的项目</SPAN><SPAN style="FONT-SIZE: 16px; COLOR: #003399">说明书啊 ,码字码的</SPAN><SPAN style="FONT-SIZE: 16px; COLOR: #003399">手酸背痛...</SPAN> </DIV>
<DIV><B>1.</B><B>介绍</B><B></B> </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 背景. </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 实际生产上,总会遇到很多问题,因为时间紧迫或者成本考虑,需要在原有系统功能之外解决,比如数据查询,数据操控等. </DIV>
<DIV>这就是外部辅助程序,就是传说中的外挂. </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 外挂系统是系统的补充,所以必须建立在对原有系统的模型的理解基础之上,外挂存在的意义这里不做累述,只对其如何敏捷开发提出新的想法. </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;开发外挂,有很多种方式,开发C/S,B/S各种程序,但是最终是一个程序解决一个功能单元,在实际生产中,大多数外挂类应用均基于数据库.可以这么说,程序的最终目的,是根据预期的参数,对目标数据进行增删查改,通过简单SQL语句,或者嵌套的存储过程. </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 有没有可能开发一个外挂平台,可以跨平台,跨数据库,基于SQL语义,进行敏捷开发呢? </DIV>
<DIV></DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 下面将介绍由楼主开发的”敏捷外挂开发平台”,支持开发人员对目标程序的输入参数进行风格自定义,参数之间的联动关系即可自定义设置;这些设置无须编程,只需遵循向导, </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 而对输出参数,也可以表格型输出,或者文本格式的输出(捕获数据库控制台输出),在高级应用中,表格型输出,亦可对特定的字段绑定自定义连接. </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 说这么多,把大家绕晕了,来个感性认识,主界面之一 </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebuvd5fd9xj20lw0dswhk.jpg" width=690 align=absMiddle height=434> </DIV>&nbsp; 
<DIV>&nbsp; &nbsp;Figure 1 </DIV>
<DIV>&nbsp;&nbsp;&nbsp; 首先有一个支持拖曳,类似于微软的文件管理器那样的目录管理,用于管理多个应用,相对应的还有权限管理,但这些不是重点,不做累述.重点是如何把SQL语句变成web页面!!,以下就是过程..通过2个普通例子,一个高级设计的例子. </DIV>
<DIV>&nbsp;&nbsp;&nbsp; &nbsp; 
<DIV><B>2.</B><B>设计和发布</B><B></B> </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 现在说一个典型的开发过程. </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 先新增一个外挂应用,此处称为处理器(下同.), </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 以两个实例来讲解,示例二为DML类,示例二为Select类. </DIV>
<DIV>&nbsp;&nbsp;&nbsp; 为了方便起见, SQL层业务逻辑使用ORACLE的PL/SQL.另外MSSQL仅支持 Transact-SQL 2008+版本.其他数据库暂不支持. </DIV>
<DIV><B>&nbsp; 2.1</B><B>示例一</B><B>:DML </B><B>类型处理器</B><B></B> </DIV>
<DIV><B>&nbsp;&nbsp;&nbsp; </B><B>2.1.1 </B><B>新建DML处理器</B> </DIV>
<DIV>SQL块可以是DML,也可以是匿名块,甚至是DDL(权限控制) 如图 figure2.1.1 -1 </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww3.sinaimg.cn/mw690/56f33ec4gw1ebvqmk1l1qj20g008j3ze.jpg" width=576 align=absMiddle height=307> </DIV>&nbsp; 
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;Figure 2.1.1 - 1 </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 当保存处理器的时候,自动生成参数设计界面,如图2.1.1 -2 </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; <IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebuvcz136bj20kx0c2jt2.jpg" width=690 align=absMiddle height=397> </DIV>
<DIV>&nbsp; 
<DIV>&nbsp;Figure 2.1.1 - 2 </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 先预览以下执行时效果: </DIV>
<DIV>&nbsp;&nbsp;&nbsp; <IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebvqri5jiej209s06xglx.jpg" width=352 align=absMiddle height=249> </DIV>
<DIV>&nbsp; </DIV>
<DIV><B>&nbsp;&nbsp;&nbsp;&nbsp; 2.1.2 </B><B>参数定制</B> </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 假如你已经设置好主SQL语句,及参数.在生成的参数界面设计页面中,你可以对参数进行重定制,见图Figure 2.1.2 - 1 </DIV>
<DIV><B>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </B>点 <B></B><SPAN></SPAN><B></B><SPAN></SPAN><B></B><SPAN></SPAN><B></B><SPAN></SPAN><B></B><SPAN></SPAN><B>编辑</B>定制<SPAN style="COLOR: #e53333">参数1.</SPAN> </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebvr1homkrj20a30ah0tc.jpg" width=363 align=absMiddle height=377> </DIV>
<DIV>&nbsp; 
<DIV>&nbsp; &nbsp;Figure 2.1.2 -1 </DIV>
<DIV>参数类型可以是 </DIV>
<DIV><IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebuvnhie2rj202d023q2r.jpg" width=85 align=absMiddle height=75>&nbsp; 这五种能处理所有标量型参数值类型. 
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp; 您还可以在<SPAN style="COLOR: #337fe5">高级设置 </SPAN>中设置当前参数是否<SPAN style="COLOR: #337fe5">联动触发</SPAN>其他参数 ,点击<SPAN style="COLOR: #337fe5">高级设置,载入当前控件默认的事件</SPAN>,如图, </DIV>
<DIV>&nbsp; &nbsp;<IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebvr1hzvnqj20a501cdfs.jpg" width=365 align=absMiddle height=48>&nbsp; 
<DIV>&nbsp;&amp;a mp;a mp;n bsp; &nbsp; Figure 2.1.2 - 2 </DIV></DIV>
<DIV>&nbsp;&nbsp;&nbsp; 设置参数关联触发事件,根据其控件类型,选择触发事件.就文本控件来说:有以下事件 "onchange","onkeyup" </DIV>
<DIV>&nbsp;&nbsp;&nbsp; 注意:<SPAN style="COLOR: #337fe5">联动设计,<SPAN style="COLOR: #000000">当一个参数设</SPAN></SPAN>置为<SPAN style="COLOR: #337fe5">触发源 </SPAN>时,其他参数就可以引用它,下面的例子会讲到. </DIV></DIV>
<DIV>&nbsp; 
<DIV></DIV>
<DIV>&nbsp;&nbsp;&nbsp; 针对单选项或多选项类型参数<B>,</B>可以设置三类数据源 </DIV>
<DIV>1. 格式化键值对,如下图 </DIV></DIV></DIV></DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebuvd0heruj20in0e2dh1.jpg" width=671 align=absMiddle height=506> </DIV>&nbsp; 
<DIV>&nbsp; &nbsp; Figure 2.1.2 -3 </DIV>
<DIV>2. SQL语句,如下图 </DIV>
<DIV><IMG alt="" src="http://ww4.sinaimg.cn/mw690/56f33ec4gw1ebuvd0x333j20eh07y3yy.jpg" width=521 align=absMiddle height=286> </DIV>
<DIV>&nbsp; 
<DIV>&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Figure 2.1.2 -4 </DIV>
<DIV></DIV>联动SQL语句.SQL里面可以嵌套其他参数,即当一个参数值变化时,能触发构造其他参数控件,如下例, </DIV>
<DIV>&nbsp;<IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebuvd19w57j20ej0csmya.jpg" width=523 align=absMiddle height=460> </DIV>
<DIV>&nbsp; 
<DIV>&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;Figure 2.1.2 -5 </DIV>
<DIV>&nbsp;&nbsp;&nbsp;&nbsp;<SPAN style="COLOR: #337fe5"> (图中step_id参数引用prod_id参数和co_nbr参数,.当被引用参数均获值的时候,触发 step_id绑定的数据源异步执行查询获得选项.注意参数联动必须是有向图,而且无回路)</SPAN> </DIV></DIV>
<DIV><SPAN style="COLOR: #337fe5">&nbsp;&nbsp;&nbsp; &nbsp; 
<DIV><B><SPAN style="COLOR: #000000">2.2</SPAN></B><B><SPAN style="COLOR: #000000">示例二</SPAN></B><SPAN style="COLOR: #000000">:</SPAN> 查询类处理器 </DIV>
<DIV><B><SPAN style="COLOR: #000000">&nbsp; 2.2.1</SPAN></B><B><SPAN style="COLOR: #000000">新建查询类处理器</SPAN></B><B></B> </DIV>
<DIV><SPAN style="COLOR: #000000">&nbsp;&nbsp;&nbsp; 查询类:新建查询处理器,如下图 </SPAN></DIV>
<DIV><SPAN style="COLOR: #000000">&nbsp;&nbsp;&nbsp; <IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebuvd1ng6xj20fd0cfwf7.jpg" width=553 align=absMiddle height=447></SPAN> </DIV>&nbsp; 
<DIV>&nbsp;&amp;n bsp;&amp;nbs p; figure 2.2.1 </DIV>
<DIV><SPAN style="COLOR: #000000">&nbsp;&nbsp; 保存后生成</SPAN> </DIV>
<DIV><SPAN style="COLOR: #000000"></SPAN><SPAN style="COLOR: #000000"><IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebuvd22u6pj20f809cjs9.jpg" width=548 align=absMiddle height=336>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</SPAN>&nbsp; ;&nbsp; </DIV>
<DIV>&nbsp; figure 2.2.2 </DIV>
<DIV>&nbsp; 再设置参数 </DIV>
<DIV>&nbsp; 
<DIV>再设置参数 </DIV><BR>
<DIV align=left></DIV>
<DIV>2.2.2 自定义参数 </DIV>
<DIV>&nbsp;&nbsp; 此处同示例1的2.1.2节,请参照.&nbsp; </DIV>
<DIV>&nbsp; </DIV>
<DIV><B>3.</B><B>高级设计</B><B></B> </DIV>
<DIV>当您完成多个处理器设计之后,您还可以利用已有的处理器进行集成操作,类似于CS的弹窗设计, </DIV>
<DIV align=left><B>3.1 </B><B>自定义输出字段绑定的连接</B> </DIV>
<DIV>&nbsp;&nbsp; 先给一个整体图,下图是一个已有的处理器.&nbsp; 
<DIV><S pan=""><IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebuvd2gki4j20rr0fidi7.jpg" width=690 align=absMiddle height=385></S> </DIV>
<DIV>Figure 3.1.1 </DIV>
<DIV>其输出语句为 </DIV>
<DIV>&nbsp; 
<DIV><IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebuvd32sroj20ds0andhn.jpg" width=496 align=absMiddle height=383>Figure 3.1.2 </DIV>
<DIV>点击设置连接其他处理器的列时,效果如下 </DIV>
<DIV>&nbsp; 
<DIV><IMG alt="" src="http://ww1.sinaimg.cn/mw690/56f33ec4gw1ebuvd3hu7hj20i70b3wfk.jpg" width=655 align=absMiddle height=399>&nbsp;Figure 3.1.3 </DIV>
<DIV>那如何做到这一点,分三步 </DIV>
<DIV>注意:集成管理这块也是通过敏捷外挂自身完成的. </DIV>
<DIV>&nbsp; 
<DIV>1)注册源处理器 </DIV>
<DIV><IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebuvd3x9i8j20lp0eadig.jpg" width=690 align=absMiddle height=454> </DIV>&nbsp; 
<DIV>2)输出字段绑定. </DIV>
<DIV>在FTTH助手这个例子中,在 输出字段 '订单号','申请单','点击','外部申请单','号码','动作','受理地址信息 ','受理地址ID','最新地址信息','最新地址ID','点击2','点击3','点击4','点击5'中绑定连接处理器 </DIV>
<DIV>&nbsp; 
<DIV>如图,绑定”订单号”字段,由哪个处理器引用作为参数,执行 </DIV>
<DIV><IMG alt="" src="http://ww4.sinaimg.cn/mw690/56f33ec4gw1ebuvd4hs9tj20r90gnq9u.jpg" width=690 align=absMiddle height=421> </DIV>
<DIV>&nbsp; 
<DIV>3)源处理器”字段”外观效果及事件绑定 </DIV>
<DIV><IMG alt="" src="http://ww2.sinaimg.cn/mw690/56f33ec4gw1ebuvd4z4vvj20pr0fwteu.jpg" width=690 align=absMiddle height=425> </DIV>
#  主要技术栈
1. .net WebForms/MVC/WEBAPI hybrids
2. 数据库智能:引用对应数据库的动态SQL分析包.
ORACLE为 DBMS_SQL包
MSSQL则用到了EXECUTE 和 SP_EXECUTESQL
3. 主要算法:
参数异步联动用到 “无回路有向图算法”.
4. 前端组件:
   angularjs + ui-state + restangular


<DIV><B>1.</B><B>处理器模型AP_HANDLERS</B> </DIV>
<TABLE cellSpacing=0 cellPadding=0 width=472 border=0>
<TBODY>
<TR>
<TD width=143>
<DIV align=center><B>Name</B> </DIV></TD>
<TD width=125>
<DIV align=center><B>Type</B> </DIV></TD>
<TD width=116>
<DIV align=center><B>Default/Expr.</B> </DIV></TD>
<TD width=87>
<DIV align=center><B>Comments</B> </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>HANDLER_ID </DIV></TD>
<TD width=125>
<DIV align=left>INTEGER </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>　主键 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>HANDLER_NAME </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(128) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>　名称 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>CATEGORY_ID </DIV></TD>
<TD width=125>
<DIV align=left>INTEGER </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>　目录ID </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>DB_TYPE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(12) </DIV></TD>
<TD width=116>
<DIV align=left>'Oracle' </DIV></TD>
<TD width=87>
<DIV align=left>数据库类型 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>DB_CONNECTION </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(128) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>连接配置 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>SQL_BLOCK </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(4000) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>SQL语言 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>HANDLER_DESC </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>　描述 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>CREATE_TIME </DIV></TD>
<TD width=125>
<DIV align=left>DATE </DIV></TD>
<TD width=116>
<DIV align=left>sysdate </DIV></TD>
<TD width=87>
<DIV align=left>　创建时间 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>SQL_CMD_TYPE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(24) </DIV></TD>
<TD width=116>
<DIV align=left>'BLOCK' </DIV></TD>
<TD width=87>
<DIV align=left>语句类型,DML/DDL或者SQL </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>AUTHORIZED_USERS </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>'rptadmin' </DIV></TD>
<TD width=87>
<DIV align=left>授权用户 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>CREATEOR </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(24) </DIV></TD>
<TD width=116>
<DIV align=left>'rptadmin' </DIV></TD>
<TD width=87>
<DIV align=left>创建用户 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>STS </DIV></TD>
<TD width=125>
<DIV align=left>CHAR(1) </DIV></TD>
<TD width=116>
<DIV align=left>'A' </DIV></TD>
<TD width=87>
<DIV align=left>　状态 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>ABBR </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(400) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>汉语拼音声母缩写 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>ABBRFULL </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>汉语拼音全拼 </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>PREPARING_BLOCK </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(4000) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>　额外执行语句(仅当有分步操作可用) </DIV></TD></TR>
<TR>
<TD width=143>
<DIV align=left>EXTENDS01 </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(4000) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=87>
<DIV align=left>　扩展字段 </DIV></TD></TR></TBODY></TABLE>
<DIV align=left><B></B></DIV><B><BR></B>
<DIV align=left><B></B></DIV>
<DIV align=left><B>2.</B><B>处理器参数模型</B><B> AP_HANDLERS_PARAMS</B> </DIV>
<TABLE cellSpacing=0 cellPadding=0 width=563 border=0>
<TBODY>
<TR>
<TD width=213>
<DIV align=left>Name </DIV></TD>
<TD width=125>
<DIV align=left>Type </DIV></TD>
<TD width=116>
<DIV align=left>Default/Expr. </DIV></TD>
<TD width=108>
<DIV align=left>Comments </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>HANDLER_PARAM_ID </DIV></TD>
<TD width=125>
<DIV align=left>INTEGER </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>主键 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>HANDLER_ID </DIV></TD>
<TD width=125>
<DIV align=left>INTEGER </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>处理器ID </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>PARAM_NAME </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(200) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>参数名 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>PARAM_DTYPE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(12) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>参数类型 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>PARAM_NAME_C </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(400) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>参数显示名 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>CONTROL_TYPE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(400) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>获值控件类型 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>CONTROL_DATASOURCE_TYPE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(400) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>参数获值控件数据源类型(有格式化键值对,SQL语句等) </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>CONTROL_DATASOURCE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>数据源 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>CONTROL_DATASOURCE_KEY </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(400) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>数据源显示列 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>CONTROL_DATASOURCE_VALUE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>数据源值列 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>INVISIBLE_ROLES </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>不可见角色---弃用 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>IS_VISIBLE </DIV></TD>
<TD width=125>
<DIV align=left>CHAR(1) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>参数是否可见 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>IS_REQUIRED </DIV></TD>
<TD width=125>
<DIV align=left>CHAR(1) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>是否必填 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>VALID_REGULAR </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>验证正则表达式 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>FORMAT_DESC </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(1024) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>格式描述 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>PARA_DATA_SIZE </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(10) </DIV></TD>
<TD width=116>
<DIV align=left>'20,1' </DIV></TD>
<TD width=108>
<DIV align=left>文本类控件的WIDTH,HEIGHT </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>ORDER_ID </DIV></TD>
<TD width=125>
<DIV align=left>INTEGER </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>排序ID </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>IS_INTERLINK </DIV></TD>
<TD width=125>
<DIV align=left>CHAR(1) </DIV></TD>
<TD width=116>
<DIV align=left>'N' </DIV></TD>
<TD width=108>
<DIV align=left>是否联动其他参数 </DIV></TD></TR>
<TR>
<TD width=213>
<DIV align=left>INTERLINK_EVENT </DIV></TD>
<TD width=125>
<DIV align=left>VARCHAR2(20) </DIV></TD>
<TD width=116>
<DIV align=left>　 </DIV></TD>
<TD width=108>
<DIV align=left>联动其他参数事件 </DIV></TD></TR></TBODY></TABLE></DIV></DIV></DIV></DIV></DIV></DIV></DIV>
<DIV>&nbsp;&nbsp;<S style="COLOR: #000000" pan=""></SPAN> </DIV></DIV></S></SPAN></DIV></DIV></DIV><!--附件--><BR>附件：<B><A href="/fuj/dx_xinxl_fj15.nsf/($ALL)/A53317FF278D1C5348257C4B00313F95/$File/文件1.docx" target=_blank>敏捷外挂发布平台</A></B> <!--显示图片--><BR><BR><!--投票--></DIV>
