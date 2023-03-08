<%@ page import="com.chilun.petStore.dao.specialDAO.PetDAO" %>
<%@ page import="com.chilun.petStore.dao.SelectInfo" %>
<%@ page import="com.chilun.petStore.pojo.Pet" %>
<%@ page import="com.chilun.petStore.service.PetService" %>
<%@ page import="org.junit.Test" %><%--
  Created by IntelliJ IDEA.
  User: pi
  Date: 2022/11/4
  Time: 0:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java"
         pageEncoding="UTF-8" isELIgnored="false" %>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<style>
    /* 按钮 购买 */
    .fileinput-button {
        position: relative;
        display: inline-block;
        background: rgba(105, 105, 105, 0.7); /* 背景色、透明度 */
        border: 1px solid rgba(23, 23, 23, 0.4); /* 鼠标悬浮时，边框样式 */
        border-radius: 20px; /* 圆角半径 */
        padding: 1px 30px; /* 边距：高度、宽度 */
        overflow: hidden;
        color: white;
        text-decoration: none;
        text-indent: 0;
        line-height: 20px;
        font-size: 20px;
    }

    .picture {
        width: auto;
        height: auto;
        max-width: 100%;
        max-height: 100%;
        border-radius: 20px;
        border-style: solid;
        border-width: 5px;
        border-color: #5d5d69;
    }

     .head {
        width: 120px;
        background-color: #ee9900;
        height: 20px;
        line-height: 20px;
        font-size: 16px;
        font-weight: bold;
        color: white;
        margin-right: 40px;
        display: inline-block;
    }
     .location{
         font-size: 35px;
         margin-left:100px;
         font-family: 隶书;
         color: red;
         position:absolute;
         left:0px;
         text-align: left;
         writing-mode: vertical-lr;
     }

</style>
<script type="text/javascript">
    function showInform(categoryId) {
        $.ajax({
            type: "get",
            url: "/mouseoverServlet",
            data: {categoryId: categoryId},
            dataType:"text",
            success: function (data) {
                console.log(data)
                var inform = document.getElementById("inform");
                inform.innerText = data;
                inform.style.display = "block";
            },
        })
    }

    //隐藏悬浮层
    function hiddenInform(event){
        var informDiv = document.getElementById('inform');
        var x=event.clientX;
        var y=event.clientY;
        var divx1 = informDiv.offsetLeft;
        var divy1 = informDiv.offsetTop;
        var divx2 = informDiv.offsetLeft + informDiv.offsetWidth;
        var divy2 = informDiv.offsetTop + informDiv.offsetHeight;
        if( x < divx1 || x > divx2 || y < divy1 || y > divy2){
            document.getElementById('inform').style.display='none';
        }
    }

</script>
<body>

<div align="center">
    <!-- 【导航栏】 -->
    <div  style="margin-top: 20px;" >
        <span class="head" style="text-align: left">
            <span style="margin-left: 10px" class="glyphicon glyphicon-th-list"></span>
            <span style="margin-left: 10px">宠物分类</span>
        </span>

        <span align="center" style="margin-right: 20px;font-size: 15px" >
            <a href="select?species=0">小猫</a>
        </span>
        <span align="center" style="margin-right: 20px;font-size: 15px">
            <a href="select?species=1">小狗</a>
        </span>
        <span align="center" style="margin-right: 20px;font-size: 15px">
            <a href="select?species=3">小鸟</a>
        </span>
        <span align="center" style="margin-right: 20px;font-size: 15px">
            <a href="select?species=2">小兔</a>
        </span>
        <span align="center" style="margin-right: 20px;font-size: 15px">
            <a href="select?species=4">乌龟</a>
        </span>
        <span align="center" style="margin-right: 20px;font-size: 15px">
            <a href="select?species=5">小鱼</a>
        </span>
        <span align="center" style="margin-right: 20px;font-size: 15px">
            <a href="select?species=6">蟋蟀</a>
        </span>
        <span align="center" style="margin-right: 20px;font-size: 15px">
            <a href="select?species=7">小仓鼠</a>
        </span>

    </div>
</div>

    <div class="location">热销榜</div>


    <%
        PetService petService=new PetService();
        //将各个物种保存在petList0、1、2、3...
        for(int i=0;i<5;i++){
            List<Pet> petList=petService.getAllPet(i);
            request.setAttribute("petList"+i,petList);
        }

    %>
<div align="center">
    <div id="inform" style="display: none;position: absolute;background: #3c3c3c;color: white;margin-left: 45%;height: 150px;width: 200px"></div>
    <!-- 【自定义  列表】 -->
    <div>

        <!-- 第1行  -->
        <div style="display: table; border-spacing: 30px;">


            <!-- pet1-1 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;"  onmouseover="showInform(1);" onmousemove="hiddenInform(event);">
                <!-- 图片 -->
                <a href="pet?petID=${petList0[0].petID}&from=main">

                        <c:if test="${petList0[0].amount ne 0}">
                            <img  style="width: 200px; height: 200px"
                                  src="${petList0[0].picture}"
                                  title="pet1-1" alt="图片缺失" class="picture" />
                        </c:if>

                        <c:if test="${petList0[0].amount eq 0}">
                            <img  style="width: 200px; height: 200px"
                                  src=“/”
                                  title="pet1-1" alt="宠物暂时空缺" class="picture"/>
                        </c:if>


                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList0[0].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList0[0].prices}元</label>
                    </div>
                    <!-- 购买 -->
<%--                    <div style="margin-top: 1px">--%>
<%--                        <input type="button" value="+" class="fileinput-button">--%>
<%--                    </div>--%>

                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList0[0].amount} </span>件
                        </span>
                    </div>

                </div>

            </div>

            <!-- pet1-2 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;" onmouseover="showInform(2);" onmousemove="hiddenInform(event);">
                <!-- 图片 -->
                <a href="pet?petID=${petList1[0].petID}&from=main">
                    <c:if test="${petList1[0].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList1[0].picture}"
                              title="pet1-2" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList1[0].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet1-2" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList1[0].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList1[0].prices}元</label>
                    </div>

                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList1[0].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>


            <!-- pet1-3 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;" onmouseover="showInform(3);" onmousemove="hiddenInform(event);">
                <!-- 图片 -->
                <a href="pet?petID=${petList2[0].petID}&from=main">
                    <c:if test="${petList2[0].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList2[0].picture}"
                              title="pet1-3" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList2[0].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet1-3" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList2[0].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList2[0].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList2[0].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>


            <!-- pet1-4 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;" onmouseover="showInform(4);" onmousemove="hiddenInform(event);">
                <!-- 图片 -->
                <a href="pet?petID=${petList3[0].petID}&from=main">
                    <c:if test="${petList3[0].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList3[0].picture}"
                              title="pet1-4" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList3[0].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet1-4" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList3[0].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList3[0].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList3[0].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>

            <!-- pet1-5 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;" onmouseover="showInform(5);" onmousemove="hiddenInform(event);">
                <!-- 图片 -->
                <a href="pet?petID=${petList4[0].petID}&from=main">
                    <c:if test="${petList4[0].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList4[0].picture}"
                              title="pet1-5" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList4[0].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet1-5" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList4[0].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList4[0].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList4[0].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>

        </div>

        <!-- 第2行  -->
        <div style="display: table; border-spacing: 30px;" onmouseover="showInform(6);" onmousemove="hiddenInform(event);">

            <!-- pet2-1 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;">
                <!-- 图片 -->
                <a href="pet?petID=${petList0[1].petID}&from=main">
                    <c:if test="${petList0[1].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList0[1].picture}"
                              title="pet2-1" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList0[1].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet2-1" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList0[1].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList0[1].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList0[1].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>

            <!-- pet2-2 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;">
                <!-- 图片 -->
                <a href="pet?petID=${petList1[1].petID}&from=main">
                    <c:if test="${petList1[1].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList1[1].picture}"
                              title="pet2-2" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList1[0].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet2-2" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList1[1].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList1[1].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList1[1].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>


            <!-- pet2-3 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;">
                <!-- 图片 -->
                <a href="pet?petID=${petList2[1].petID}&from=main">
                    <c:if test="${petList2[1].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList2[1].picture}"
                              title="pet2-3" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList2[1].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet2-3" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList2[1].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList2[1].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList2[1].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>


            <!-- pet2-4 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;">
                <!-- 图片 -->
                <a href="pet?petID=${petList3[1].petID}&from=main">
                    <c:if test="${petList3[1].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList3[1].picture}"
                              title="pet2-4" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList3[1].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet2-4" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList3[1].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList3[1].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList3[1].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>

            <!-- pet2-5 -->
            <div style="width: 200px; height: 300px; background-color: #DCDCDC; display: table-cell;">
                <!-- 图片 -->
                <a href="pet?petID=${petList4[1].petID}&from=main">
                    <c:if test="${petList4[1].amount ne 0}">
                        <img  style="width: 200px; height: 200px"
                              src="${petList4[1].picture}"
                              title="pet2-5" alt="图片缺失" class="picture"/>
                    </c:if>

                    <c:if test="${petList4[1].amount eq 0}">
                        <img  style="width: 200px; height: 200px"
                              src=“/”
                              title="pet2-5" alt="宠物暂时空缺" class="picture"/>
                    </c:if>

                </a>
                <div
                        style="width: 100%; height: 100px; background-color: #F6F6F6; text-align: center;">
                    <!-- pet名称 -->
                    <div style="height: 5px;"></div>
                    <div>
                        <label style="font-size: 20px">${petList4[1].name}</label>
                    </div>
                    <!-- 价格 -->
                    <div style="margin-top: 1px">
                        <label style="color: #696969">${petList4[1].prices}元</label>
                    </div>
                    <div style="margin-top: 1px">
                        <span class="fileinput-button" style="font-size: small;font-family: 宋体">
                            库存仅剩余:<span style="font-style: italic;color: aqua">${petList4[1].amount} </span>件
                        </span>
                    </div>
                </div>
            </div>

        </div>


    </div>

<%--    <!-- 选好了 -->--%>
<%--    <div style="margin-top: 30px; margin-bottom: 100px;">--%>
<%--        <input type="submit" class="btn fileinput-button" value="选好了"--%>
<%--               onclick="ok();" style="width: 200px; height: 70px">--%>
<%--    </div>--%>

    <a href="select" style="color: #FF003A;font-size: small">查看全部商品</a>



</div>

<script>
    function ok() {
        alert("选好了");
    }
</script>