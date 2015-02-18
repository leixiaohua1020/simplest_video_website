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
<!-- <script src="js/jquery.validationEngine-zh_CN.js" type="text/javascript" charset="utf-8"></script> -->
<script src="js/jquery.validationEngine-en.js" type="text/javascript" charset="utf-8"></script>
<script src="js/jquery.validationEngine.js" type="text/javascript" charset="utf-8"></script>


<script type="text/javascript">
$(document).ready(function(){
	$("#configform").validationEngine();
	
	$("#transcoder_keepaspectratio").val('${transcoder_keepaspectratio}');
	$("#transcoder_watermarkuse").val('${transcoder_watermarkuse}');
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
            	
            
            <div id="contact_form">
            <form id="configform" method="post" name="update" action="ConfigureUpdateUpdate.action" enctype ="multipart/form-data">
            			<h2><s:property value="%{getText('configure.configure')}"/></h2>
            				<label for="transcoder_vcodec"><s:property value="%{getText('configure.transcoder_vcodec')}"/>:</label> <input type="text" id="transcoder_vcodec" name="transcoder_vcodec" value="${transcoder_vcodec}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_bv"><s:property value="%{getText('configure.transcoder_bv')}"/>:</label> <input type="text" id="transcoder_bv" name="transcoder_bv" value="${transcoder_bv}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_framerate"><s:property value="%{getText('configure.transcoder_framerate')}"/>:</label>  <input type="text" id="transcoder_framerate" name="transcoder_framerate" value="${transcoder_framerate}" class="validate[required,custom[integer]] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_acodec"><s:property value="%{getText('configure.transcoder_acodec')}"/>:</label> <input type="text" id="transcoder_acodec" name="transcoder_acodec" value="${transcoder_acodec}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_ar"><s:property value="%{getText('configure.transcoder_ar')}"/>:</label> <input type="text" id="transcoder_ar" name="transcoder_ar" value="${transcoder_ar}" class="validate[required,custom[integer]] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_ba"><s:property value="%{getText('configure.transcoder_ba')}"/>:</label>  <input type="text" id="transcoder_ba" name="transcoder_ba" value="${transcoder_ba}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_scale_w"><s:property value="%{getText('configure.transcoder_scale_w')}"/>:</label>  <input type="text" id="transcoder_scale_w" name="transcoder_scale_w" value="${transcoder_scale_w}" class="validate[required,custom[integer]] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_scale_h"><s:property value="%{getText('configure.transcoder_scale_h')}"/>:</label>  <input type="text" id="transcoder_scale_h" name="transcoder_scale_h" value="${transcoder_scale_h}" class="validate[required,custom[integer]] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_watermarkuse"><s:property value="%{getText('configure.transcoder_watermarkuse')}"/>:</label>  
	                            <select id="transcoder_watermarkuse" name="transcoder_watermarkuse" class="required input_field">
								  <option value ="true"><s:property value="%{getText('configure.true')}"/></option>
								  <option value ="false"><s:property value="%{getText('configure.false')}"/></option>
								</select>
							<div class="cleaner h10"></div>
                            <label for="transcoder_watermark_url"><s:property value="%{getText('configure.transcoder_watermark_url')}"/>:</label>  <input type="text" id="transcoder_watermark_url" name="transcoder_watermark_url" value="${transcoder_watermark_url}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_watermark_x"><s:property value="%{getText('configure.transcoder_watermark_x')}"/>:</label>  <input type="text" id="transcoder_watermark_x" name="transcoder_watermark_x" value="${transcoder_watermark_x}" class="validate[required,custom[integer]] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_watermark_y"><s:property value="%{getText('configure.transcoder_watermark_y')}"/>:</label>  <input type="text" id="transcoder_watermark_y" name="transcoder_watermark_y" value="${transcoder_watermark_y}" class="validate[required,custom[integer]] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="transcoder_keepaspectratio"><s:property value="%{getText('configure.transcoder_keepaspectratio')}"/>:</label>  
	                            <select id="transcoder_keepaspectratio" name="transcoder_keepaspectratio" class="required input_field">
								  <option value ="true"><s:property value="%{getText('configure.true')}"/></option>
								  <option value ="false"><s:property value="%{getText('configure.false')}"/></option>
								</select>
                            <div class="cleaner h10"></div>
                            <label for="transcoder_outfmt"><s:property value="%{getText('configure.transcoder_outfmt')}"/>:</label>  <input type="text" id="transcoder_outfmt" name="transcoder_outfmt" value="${transcoder_outfmt}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="thumbnail_ss"><s:property value="%{getText('configure.thumbnail_ss')}"/>:</label>  <input type="text" id="thumbnail_ss" name="thumbnail_ss" value="${thumbnail_ss}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="folder_videoori"><s:property value="%{getText('configure.folder_videoori')}"/>:</label>  <input type="text" id="folder_videoori" name="folder_videoori" value="${folder_videoori}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="folder_video"><s:property value="%{getText('configure.folder_video')}"/>:</label>  <input type="text" id="folder_video" name="folder_video" value="${folder_video}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <label for="folder_thumbnail"><s:property value="%{getText('configure.folder_thumbnail')}"/>:</label>  <input type="text" id="folder_thumbnail" name="folder_thumbnail" value="${folder_thumbnail}" class="validate[required] required input_field" />
                            <div class="cleaner h10"></div>
                            <input type="submit" value="<s:property value="%{getText('global.submit')}"/>" id="submit" name="submit" class="submit_btn float_l" />
                            <input type="reset" value="<s:property value="%{getText('global.reset')}"/>" id="reset" name="reset" class="submit_btn float_r" />

                    </form>
            </div>
        </div>
        <div class="cleaner"></div>
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