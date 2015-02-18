<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="Video, FFmpeg, JavaEE" />
<meta name="author" content="Lei Xiaohua" />
<meta name="description" content="The simplest video website based on JavaEE and FFmpeg" />

<title>Simplest Video Website</title>

<link href="css/svw_style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="js/jquery-1.8.3.min.js"></script> 
<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/showhide.js"></script> 
<script type="text/JavaScript" src="js/jquery.mousewheel.js"></script> 

<!-- Load the CloudCarousel JavaScript file -->
<script type="text/JavaScript" src="js/cloud-carousel.1.0.5.js"></script>
 
<script type="text/javascript">
$(document).ready(function(){
						   
	// This initialises carousels on the container elements specified, in this case, carousel1.
	$("#carousel1").CloudCarousel(		
		{			
			reflHeight: 40,
			reflGap:2,
			titleBox: $('#da-vinci-title'),
			altBox: $('#da-vinci-alt'),
			buttonLeft: $('#slider-left-but'),
			buttonRight: $('#slider-right-but'),
			yRadius:30,
			xPos: 480,
			yPos: 32,
			speed:0.15,
		}
	);
});
 
</script>

</head>

<body id="home">

<div id="svw_header_wrapper">
	<%@ include file="/cheader.jsp"%>
</div>	<!-- END of svw_header_wrapper -->
<div id="svw_slider">
	<!-- This is the container for the carousel. -->
    <div id = "carousel1" style="width:960px; height:280px;background:none;overflow:scroll; margin-top: 20px">            
        <c:forEach items="${resultvideo}" var="video">
        <a href="VideoReadByID.action?videoid=${video.id}" rel="lightbox">
        	<img class="cloudcarousel" src="${video.thumbnailurl}" alt="${video.name}" title="${video.name}" />
        </a>
        </c:forEach>
    </div>
    
    <!-- Define left and right buttons. -->
    <center>
    <input id="slider-left-but" type="button" value="" />
    <input id="slider-right-but" type="button" value="" />
    </center>
</div>
<div id="svw_main"> 
    
    <h2><a href="VideoReadAll.action?islive=0"><s:property value="%{getText('video.vod')}"/></a></h2>
    <c:if test="${empty resultvideovod}">
    <div style="height:100px;"><p><s:property value="%{getText('video.listempty')}"/></p></div>
    </c:if>
    <c:forEach items="${resultvideovod}" var="video">
	<div class="col one_fourth gallery_box" style="background:#FFFFFF">
        <a href="VideoReadByID.action?videoid=${video.id}"><img src="${video.thumbnailurl}" alt="thumbnail" class="image_frame"/></a>
        <h5><a href="VideoReadByID.action?videoid=${video.id}">${video.name}</a></h5>
	</div>
    </c:forEach>
    
    <div class="cleaner h20"></div>
    
    <h2><a href="VideoReadAll.action?islive=1"><s:property value="%{getText('video.live')}"/></a></h2>
    <c:if test="${empty resultvideolive}">
     <div style="height:100px;"><p><s:property value="%{getText('video.listempty')}"/></p></div>
    </c:if>
    <c:forEach items="${resultvideolive}" var="video">
	<div class="col one_fourth gallery_box" style="background:#FFFFFF">
        <a href="VideoReadByID.action?videoid=${video.id}"><img src="${video.thumbnailurl}" alt="thumbnail" class="image_frame"/></a>
        <h5><a href="VideoReadByID.action?videoid=${video.id}">${video.name}</a></h5>
	</div>
    </c:forEach>
    <div class="cleaner"></div>
</div> <!-- END of svw_main -->
<div id="svw_footer_wrapper">
<%@ include file="/cfooter.jsp"%>
</div> <!-- END of svw_footer -->

</body>
</html>