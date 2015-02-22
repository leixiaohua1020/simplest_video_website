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

<!-- validationEngine -->
<link rel="stylesheet" href="css/validationEngine.jquery.css" type="text/css"/>
<script src="js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript">
$(document).ready(function(){
	$("#videoform1").validationEngine();
});
</script> 

</head>

<body id="subpage">

<div id="svw_header_wrapper">
	<%@ include file="/cheader.jsp"%>
</div>	<!-- END of svw_header_wrapper -->

<div id="svw_main">
	<div id="content">
    	<div class="post">
    		<c:choose>
    			<c:when test="${empty video}">
    			<c:set value='<%=request.getParameter("islive")%>' var="islive" scope="page" />
    				<h2><s:property value="%{getText('video.add')}"/>
    				<c:choose>
	    			<c:when test="${islive==1}"><s:property value="%{getText('video.live')}"/></c:when>
	    			<c:otherwise><s:property value="%{getText('video.vod')}"/></c:otherwise>
	    			</c:choose>
    				</h2>
    			</c:when>
    			<c:otherwise>
    			<c:set value="${video.islive}" var="islive" scope="page" />
    				<h2><s:property value="%{getText('video.edit')}"/>
    				<c:choose>
	    			<c:when test="${islive==1}"><s:property value="%{getText('video.live')}"/></c:when>
	    			<c:otherwise><s:property value="%{getText('video.vod')}"/></c:otherwise>
	    			</c:choose>
	    			- ${video.name}
    				</h2>
    			</c:otherwise>
    		</c:choose>
            <div class="float_l">
                <div id="contact_form">
                <form id="videoform1" method="post" 
	                <c:choose>
	    			<c:when test="${!empty video}">
	    				name="update" action="VideoUpdateUpdate.action"
	    			</c:when>
	    			<c:otherwise>
	    				name="add" action="VideoAdd.action"
	    			</c:otherwise>
	    			</c:choose>
    			 enctype ="multipart/form-data">
                            <label for="name"><s:property value="%{getText('video.name')}"/>:</label> <input type="text" id="name" name="name" value="${video.name}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            
							<input type="hidden" name="islive" value="${islive}" />
    						<c:choose>
			    			<c:when test="${islive==1}">
			    				<label for="url"><s:property value="%{getText('video.url')}"/>:</label> <input id="url" name="url" value="${video.url}" class="validate[required] required input_field" />
                           		<div class="cleaner h10"></div>
			    			</c:when>
			    			<c:otherwise>
			    				<c:if test="${empty video}">
		    						<label for="videofile"><s:property value="%{getText('video.file')}"/>:</label> <input type="file" id="videofile" name="videofile" class="validate[required] required input_field" />
		                            <div class="cleaner h10"></div>
		    					</c:if>
			    			</c:otherwise>
			    			</c:choose>
			    			
                            <label for="intro"><s:property value="%{getText('video.intro')}"/>:</label> <textarea id="intro" name="intro" rows="100" cols="0" class="required">${video.intro}</textarea>
                            <div class="cleaner h10"></div>
                            
                            <input type="submit" value="<s:property value="%{getText('global.submit')}"/>" id="submit" name="submit" class="submit_btn float_l" />
                            <input type="reset" value="<s:property value="%{getText('global.reset')}"/>" id="reset" name="reset" class="submit_btn float_r" />
                            
                    </form>
                </div>
            </div>
        </div>
        
        
            <div class="cleaner"></div>
    </div>
    
    <div id="sidebar">
        <ul class="svw_list">
        	<li><a href="VideoReadAll.action?islive=${islive}"><s:property value="%{getText('video.return')}"/></a></li>
        	<c:if test="${!empty video}">
        	<li><a href="VideoReadByID.action?videoid=${video.id}"><s:property value="%{getText('video.content')}"/></a></li>
        	<li><a href="VideoUpdateRead.action?videoid=${video.id}"><s:property value="%{getText('video.edit')}"/></a></li>
            <li><a href="javascript:if(confirm('Are you sure to Delete?'))location='VideoDelete.action?videoid=${video.id}'"><s:property value="%{getText('video.delete')}"/></a></li>
			</c:if>
        </ul>
        
        <div class="cleaner h30"></div>

        <s:action name="SidebarRecent" executeResult="true">
           	<s:param name="num">5</s:param>
        </s:action>
    </div> <!-- end of sidebar -->
    <div class="cleaner"></div>
</div> <!-- END of svw_main --> <!-- END of tempatemo_bottom_wrapper -->

<div id="svw_footer_wrapper">
    <%@ include file="/cfooter.jsp"%>
</div> <!-- END of svw_footer -->

</body>
</html>