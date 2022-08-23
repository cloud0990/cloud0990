<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	response.setHeader("Cache-Control", "no-cache");
	response.setHeader("Pragma", "no-cache");
	response.setDateHeader("Expires", 0);
%>
<c:set var="sessionVo" value="${sessionScope.S_USER}"></c:set>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login History</title>
<script type="text/javascript">
$(function(){
	$("#mainGrid").jqGrid({
		url:"/main/selectLoginHist",
	    //caption:'로그인기록',
	    loadtext:"로딩 중..",
		datatype:"json", //데이터 타입
		mtype:"POST", //데이터 전송방식
		height:200,
		//width:700,
		autowidth: true,
		shrinkToFit: true,
		rownumbers: true,
		colNames:['아이디', 'IP', '접속일자'],
		colModel: [
					{name:'uId',    index:'uId',    align:"left"},
					{name:'ip',     index:'ip',     align:"left"},
					{name:'logDate',index:'logDate',align:"left"},
	              ],
	    rowNum: 5,            //한 화면에 보여줄 행 수
	    //rowList: [5, 10, 15], //5개보기, 10개보기, 15개보기 선택해서 보기 가능
		pager: "#page_login_hist",
		viewrecords: true,
		pgbuttons: true,
		gridComplete: function(){
			//$("#mainGrid").css("vertical-align", "middle");
			//랜더링 시간 구하기
			//var time = $("#mainGrid").jqGrid('getGridParam', 'totaltime');
			//$("#load_time").html("Render time : " + time + "초");
		},
		loadComplete: function() {
			//initPage("tableWrap", "page_login_hist", true, "TOT");
			//$(".tableWrap").removeClass('ui-state-default jqgrid-rownum');
			$(".ui-state-default.jqgrid-rownum").removeClass('ui-state-default jqgrid-rownum');
		}
	});
});
</script>
</head>
<body>

<div id="content">
	<div role="content">
		<div class="widget-body" style="padding:50px;">
			<fieldset>
				<div class="form-group" style="flex:center;">
					<label><span class="widget-icon"><i class="fa fa-list-ul"></i>&nbsp;&nbsp;&nbsp;LOGIN HISTORY</span></label>
					<!-- <label class="control-labelcol-md-1" id="load_time"></label> -->
				</div>
			</fieldset>
			<hr style="margin-top:0px;">
			<fieldset>		
				<div class="row" id="tableWrap">
					<table id="mainGrid"></table>
					<div id="page_login_hist"></div>
				</div>
			</fieldset>	
		</div>
	</div>
</div>

</body>
</html>