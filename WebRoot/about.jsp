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
<!--script type="text/javascript" src="/jqueryui/js/jquery-ui-1.7.2.custom.min.js"></script--> 
<script type="text/javascript" src="js/jquery-ui.min.js"></script> 
<script type="text/javascript" src="js/showhide.js"></script> 
<script type="text/JavaScript" src="js/jquery.mousewheel.js"></script> 

</head>

<body id="subpage">

<div id="svw_header_wrapper">
	<%@ include file="/cheader.jsp"%>
</div>	<!-- END of svw_header_wrapper -->

<div id="svw_main">
	
    <div id="content">
    	<h2><s:property value="%{getText('about.about')}"/></h2>
    	<p>Simplest Video Website is the simplest demo about video website. it is based on JavaEE and FFmpeg.</p>
        <p>The site use following projects:</p>
        <ul>
          <li>
           jQuery
          </li>
          <li>
           Struts2
          </li>
          <li>
           Spring
          </li>
          <li>
           Hibernate
          </li>
          <li>
            MySQL
          </li>
          <li>
            FFmpeg
          </li>
          <li>
            MediaInfo
          </li>
        </ul>
        <p>The structure of site is shown in the following Picture:</p>
        <img src="images/structure.jpg" alt="User 01" style="margin:20px;"/>
        <p>From this website the beginner can learn technics about JavaEE and FFmpeg.</p>
<div class="cleaner h30"></div>
<h2><s:property value="%{getText('about.aboutme')}"/></h2>
        <div class="about_box">
        	<a href="http://blog.csdn.net/leixiaohua1020">
            <img src="images/author.jpg" alt="User 01" style="margin:20px;"/>
          	</a>
            <h4>雷霄骅  Lei Xiaohua</h4>
            <p><br/>
				<a href="mailto:leixiaohua1020@126.com">leixiaohua1020@126.com</a><br/>
            	中国传媒大学/数字电视技术<br/>
 				Communication University of China / Digital TV Technology<br/>
            	<a href="http://blog.csdn.net/leixiaohua1020">http://blog.csdn.net/leixiaohua1020</a></p>
            <div class="cleaner"></div>
            <p>我是中国传媒大学的一个博士生，一直从事与广播电视有关的视音频技术的研究。希望通过分享这个简单的示例网站帮助新手学习视频技术。</p>
            <p>I'm a PHD student in Communication University of China. I have focused on video/audio technics for several years.
            I shared this simple demo site to help beginnner to learn Video technics.</p>
        </div>
        <div class="about_box">
			
            <div class="cleaner"></div>
        </div>
    </div>
    
    <div id="sidebar">

		<s:action name="SidebarRecent" executeResult="true">
           	<s:param name="num">5</s:param>
        </s:action>
    </div> <!-- end of sidebar -->
    
    <div class="cleaner"></div>
</div> <!-- END of svw_main -->

 <!-- END of svw_bottom_wrapper -->

<div id="svw_footer_wrapper">
    <%@ include file="/cfooter.jsp"%>
</div> <!-- END of svw_footer -->

</body>
</html>