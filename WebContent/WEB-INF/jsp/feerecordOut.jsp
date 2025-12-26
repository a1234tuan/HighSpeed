<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% String path = request.getContextPath(); String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/"; %>
<!DOCTYPE html>
<html>
<head>
    <base href="<%=basePath%>">
    <link rel="stylesheet" href="js/bootstrap/css/bootstrap.css">
    <link rel="stylesheet" href="css/style.css">
    <script src="js/jquery.js"></script> <!-- 必须引入jQuery -->
    <title>车辆出站结算</title>
</head>
<body>
<div class="container">
    <div class="panel panel-success" style="margin-top: 20px;">
        <div class="panel-heading">车辆出站结算</div>
        <div class="panel-body">
            
            <!-- 错误信息提示 -->
            <c:if test="${not empty msg}">
                <div class="alert alert-danger">${msg}</div>
            </c:if>

            <form action="feerecord/out.action" method="post" class="form-horizontal" onsubmit="return checkBalance()">
                
                <!-- 隐藏域：记录ID -->
                <input type="hidden" name="fid" value="${record.fid}">
                <!-- 隐藏域：驾驶证号 (用于扣款) -->
                <input type="hidden" name="dno" value="${record.dno}">
                <!-- 隐藏域：当前余额 (用于后台校验) -->
                <input type="hidden" name="currentMoney" value="${driverMoney}">
                
                <!-- 1. 显示基本信息 -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">车牌号：</label>
                    <div class="col-sm-4 form-control-static">${record.cno}</div>
                    
                    <label class="col-sm-2 control-label">驾驶员：</label>
                    <div class="col-sm-4 form-control-static">
                        ${record.driverName} (余额：<span id="yue" style="color:red;font-weight:bold">${driverMoney}</span> 元)
                        
                        <c:if test="${driverMoney < 10}">
                             <span class="label label-danger">余额不足，请先去驾驶员管理充值</span>
                        </c:if>
                    </div>
                </div>

                <div class="form-group">
                    <label class="col-sm-2 control-label">进站口：</label>
                    <div class="col-sm-4 form-control-static">
                        ${record.beginStation}
                        <!-- 隐藏进站ID用于JS计算 -->
                        <input type="hidden" id="beginid" value="${record.beginid}">
                    </div>
                </div>

                <!-- 2. 选择出站口 -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">出站口：</label>
                    <div class="col-sm-6">
                        <select name="endid" id="endid" class="form-control" required>
                            <option value="">-- 请选择出站口 --</option>
                            <c:forEach items="${stationList}" var="s">
                                <!-- 排除掉和进站口一样的站点 -->
                                <c:if test="${s.sid != record.beginid}">
                                    <option value="${s.sid}">${s.name}</option>
                                </c:if>
                            </c:forEach>
                        </select>
                    </div>
                </div>

                <!-- 3. 显示费用 (自动计算) -->
                <div class="form-group">
                    <label class="col-sm-2 control-label">本次通行费：</label>
                    <div class="col-sm-6">
                        <div class="input-group">
                            <input type="text" name="price" id="price" class="form-control" readonly value="0">
                            <div class="input-group-addon">元</div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-success" id="btnSubmit" disabled>确认缴费出站</button>
                        <a href="feerecord/list.action" class="btn btn-default">返回列表</a>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript">
    $(function(){
        // 监听出站口下拉框变化
        $("#endid").change(function(){
            var exitId = $(this).val();
            var entryId = $("#beginid").val();
            
            if(exitId == "") {
                $("#price").val(0);
                $("#btnSubmit").prop("disabled", true);
                return;
            }

            // 发起AJAX请求计算费用
            $.ajax({
                url: "feerecord/calcPrice.action",
                type: "POST",
                data: {"beginid": entryId, "endid": exitId},
                success: function(data){
                    // data 就是后台算出来的钱 (int)
                    $("#price").val(data);
                    
                    // 校验余额是否足够
                    var driverMoney = parseFloat($("#yue").text());
                    if(driverMoney < data) {
                        alert("余额不足，无法出站！需 " + data + " 元，当前 " + driverMoney + " 元。");
                        $("#btnSubmit").prop("disabled", true);
                    } else {
                        $("#btnSubmit").prop("disabled", false);
                    }
                }
            });
        });
    });

    function checkBalance() {
        var price = parseFloat($("#price").val());
        if(price <= 0) {
            alert("请选择站点并计算费用");
            return false;
        }
        return confirm("确定要扣除 " + price + " 元并出站吗？");
    }
</script>
</body>
</html>
