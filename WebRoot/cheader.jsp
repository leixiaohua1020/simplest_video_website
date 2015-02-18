<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>

<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "svw_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
});

</script> 

	<div id="site_title"><h1><a href="Index.action">Simplest Video Website</a></h1></div>
     <div id="svw_menu" class="ddsmoothmenu">
        <ul>
            <li><a href="Index.action" class="selected"><s:property value="%{getText('index.index')}"/></a></li>
            <li><a href="VideoReadAll.action?islive=0"><s:property value="%{getText('video.vod')}"/></a></li>
            <li><a href="VideoReadAll.action?islive=1"><s:property value="%{getText('video.live')}"/></a></li>
            <!-- 
            	<ul>
                    <li><span class="top"></span><span class="bottom"></span></li>
                    <li><a href="...">Sub menu 1</a></li>
                    <li><a href="...">Sub menu 2</a></li>
              	</ul>
             -->
            <li><a href="About.action"><s:property value="%{getText('about.about')}"/></a></li>
            <li><a href="ConfigureUpdateRead.action"><s:property value="%{getText('configure.configure')}"/></a></li>
            <li><a href="#"><s:property value="%{getText('configure.language')}"/></a>
            	<ul>
                    <li><a href="Index.action?request_locale=en_US">English</a></li>
                    <li><a href="Index.action?request_locale=zh_CN">简体中文</a></li>
              	</ul>
            </li>
        </ul>
        <br style="clear: left" />
    </div>
    <div class="cleaner"></div>