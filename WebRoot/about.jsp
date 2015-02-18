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
        <p><em>The LIRE (Lucene Image REtrieval) library a simple way to create a Lucene index of image features for content based image retrieval (CBIR). The used features are taken from the MPEG-7 Standard: ScalableColor, ColorLayout and EdgeHistogram. Furthermore methods for searching the index are provided. </em></p>
        <p> The implemented features are </p>
        <ul>
          <li>
            <div> ScalableColor, ColorLayout and EdgeHistogram (<a title="http://mpeg.chiariglione.org/standards/mpeg-7/mpeg-7.htm" href="http://mpeg.chiariglione.org/standards/mpeg-7/mpeg-7.htm" rel="nofollow">MPEG-7</a>)</div>
          </li>
          <li>
            <div> CEDD and FCTH (contributed by <a title="http://savvash.blogspot.com/" href="http://savvash.blogspot.com/" rel="nofollow">Savvas Chatzichristofis</a>)</div>
          </li>
          <li>
            <div> Color histograms (HSV and RGB), Tamura &amp; Gabor, auto color correlogram, <acronym title="Joint Photographics Experts Group">JPEG</acronym> coefficient histogram (common global descriptors)</div>
          </li>
          <li>
            <div> Visual words based on <a title="http://en.wikipedia.org/wiki/Scale-invariant_feature_transform" href="http://en.wikipedia.org/wiki/Scale-invariant_feature_transform" rel="nofollow">SIFT</a> and <a title="http://en.wikipedia.org/wiki/SURF" href="http://en.wikipedia.org/wiki/SURF" rel="nofollow">SURF</a></div>
          </li>
        </ul>
        <p>Furthermore methods for searching the index based on <a title="http://lucene.apache.org" href="http://lucene.apache.org" rel="nofollow">Lucene</a> are provided.</p>
        <p>The LIRE library started out as part of the Caliph &amp; Emir project and aimed to provide the CBIR features of Caliph &amp; Emir to other Java projects in an easy and light weight way. In the meantime it has turned out as big and interesting projekt itself.</p>
        <p>With Lire you can easily <a title="lire:createindex" href="/wiki/doku.php?id=lire:createindex"> create an index</a> and <a title="lire:searchindex" href="/wiki/doku.php?id=lire:searchindex">search through the index</a>.</p>
<div class="cleaner h30"></div>
        <div class="about_box">
            <img src="images/user.jpg" alt="User 01" />
            <h4>雷霄骅</h4>
            <p class="position">中国传媒大学/数字电视技术</p>
            <p></p>
            <div class="cleaner"></div>
        </div>
        <div class="about_box">
			<img src="images/teclogo/ffmpeg-logo.png" alt="User 01" />
			<img src="images/teclogo/lucene_logo.png" alt="User 01" />
			<img src="images/teclogo/spring-logo.png" alt="User 01" />
			<img src="images/teclogo/struts-logo.gif" alt="User 01" />
			<img src="images/teclogo/hibernate-logo.png" alt="User 01" />
            <div class="cleaner"></div>
        </div>
    </div>
    
    <div id="sidebar">

        <h2>Testimonials</h2>
        <div class="testimonial">
            <p>Nunc vitae purus non augue scelerisque ultricies vitae et velit quis nulla id orci malesua tempus erat.</p>
            <cite>Steven <a href="#"><span>- Web Designer</span></a></cite>
		</div>
    	<div class="testimonial">
            <p>Curabitur sed felis urna, quis eleifend magna. Nunc quam mollis sem nunc mauris iaculis sed.</p>
    		<cite>Thomas <a href="#"><span>- Senior Webmaster</span></a></cite>
		</div>
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