/**
 * 最简单的视频网站
 * Simplest Video Website
 *
 * 雷霄骅 Lei Xiaohua
 * 
 * leixiaohua1020@126.com
 * 中国传媒大学/数字电视技术
 * Communication University of China / Digital TV Technology
 * http://blog.csdn.net/leixiaohua1020
 *
 * 本程序是一个最简单的视频网站视频。它支持
 * 1.直播
 * 2.点播
 * This software is the simplest video website.
 * It support: 
 * 1. live broadcast 
 * 2. VOD 
 */
package util;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Properties;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
/**
 * @author 雷霄骅
 * 服务器开始运行后，初始化以下几个线程
 */
public class LoadOnStartServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public LoadOnStartServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}
	//Test
	public void GetFFmpegInfo(){
		
		 try {
			String realdir=this.getServletContext().getRealPath("/").replace('\\', '/')+"test/";
			File realdirFile= new File(realdir);
			System.out.println(realdirFile);
			Process p ;
			p= Runtime.getRuntime().exec("cmd /c ffmpeg -version >"+realdir+"ffmpeg_version.txt",null,realdirFile);
			p= Runtime.getRuntime().exec("cmd /c ffmpeg -formats >"+realdir+"support_formats.txt",null,realdirFile);
			p= Runtime.getRuntime().exec("cmd /c ffmpeg -decoders >"+realdir+"support_decoders.txt",null,realdirFile);
			p= Runtime.getRuntime().exec("cmd /c ffmpeg -encoders >"+realdir+"support_encoders.txt",null,realdirFile);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {

		ServletContext sc = this.getServletContext();  
		
		//GetFFmpegInfo();
		//初始化的时候运行以下几个线程
		//截图
		VideoThumbnailThread videoThumbnailThread=new VideoThumbnailThread(sc);
		videoThumbnailThread.start();
		//转码线程
		VideoTranscoderThread videoConvertThread=new VideoTranscoderThread(sc);
		videoConvertThread.start();
	}

}
