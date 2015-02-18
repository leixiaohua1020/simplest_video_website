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

import java.io.BufferedInputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.InputStreamReader;
import java.io.Serializable;
import java.net.URI;
import java.net.URL;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.struts2.ServletActionContext;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import bean.Configure;
import bean.Video;
import bean.Videostate;


import service.BaseService;


/**
 * @author 雷霄骅
 * 转码
 */
public class VideoTranscoderThread extends Thread {
private ServletContext servletContext;
	
	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	//构造函数
	public VideoTranscoderThread(ServletContext servletContext) {
		super();
		this.servletContext = servletContext;
	}
	public void run() {
		try {
		int order=3;
		WebApplicationContext ctx = WebApplicationContextUtils.getWebApplicationContext(servletContext);
		BaseService baseService = (BaseService)ctx.getBean("BaseService"); 
		//Load Configure
		Configure transcoder_vcodec_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_vcodec");
		Configure transcoder_bv_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_bv");
		Configure transcoder_framerate_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_framerate");
		Configure transcoder_acodec_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_acodec");
		Configure transcoder_ar_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_ar");
		Configure transcoder_ba_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_ba");
		Configure transcoder_scale_w_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_scale_w");
		Configure transcoder_scale_h_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_scale_h");
		Configure transcoder_watermarkuse_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_watermarkuse");
		Configure transcoder_watermark_url_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_watermark_url");
		Configure transcoder_watermark_x_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_watermark_x");
		Configure transcoder_watermark_y_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_watermark_y");
		Configure transcoder_keepaspectratio_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_keepaspectratio");
		Configure transcoder_outfmt_cfg=(Configure) baseService.ReadSingle("Configure", "name", "transcoder_outfmt");
		Configure folder_video_cfg=(Configure) baseService.ReadSingle("Configure", "name", "folder_video");
		//Folder of Watermark
		String[] watermarkstrlist=transcoder_watermark_url_cfg.getVal().split("/");
		String watermarkDir="";
		String watermarkFile=watermarkstrlist[watermarkstrlist.length-1];
		for(int i=0;i<watermarkstrlist.length-1;i++){
			watermarkDir+=watermarkstrlist[i]+"/";
		}
		String realwatermarkDir=servletContext.getRealPath("/").replace('\\', '/')+watermarkDir;
		File realwatermarkDirFile= new File(realwatermarkDir);
		//Check
		if(!realwatermarkDirFile.exists()  && !realwatermarkDirFile.isDirectory()){
			System.out.println("Directory not exist. Create it.");  
			System.out.println(realwatermarkDirFile);  
			realwatermarkDirFile.mkdir();
		}
		
		
		
		String realfileDir=servletContext.getRealPath("/").replace('\\', '/')+folder_video_cfg.getVal();
		//Check
		File realfileDirFile =new File(realfileDir);
		if(!realfileDirFile.exists()  && !realfileDirFile.isDirectory()){
			System.out.println("Directory not exist. Create it."); 
			System.out.println(realfileDirFile);  
			realfileDirFile.mkdir();
		}

		do{

			
			List<Video> resultvideo=baseService.ReadByProperty("Video","videostate.order", order);
			Videostate nextvideostate=(Videostate) baseService.ReadSingle("Videostate","order", order+1);
				if(resultvideo!=null){
					for(Video video:resultvideo){
						//Transcode
						String filePath=folder_video_cfg.getVal()+"/"+video.getId()+"."+transcoder_outfmt_cfg.getVal();
						//System.out.println(filePath);
						video.setUrl(filePath);
						String realfilePath=servletContext.getRealPath("/").replace('\\', '/')+video.getUrl();
						
						String realfileoriginalPath=servletContext.getRealPath("/").replace('\\', '/')+video.getOriurl();
						//转码命令如下所示
						//ffmpeg -i xxx.mkv -ar 22050 -b 600k -vcodec libx264 
						//-vf scale=w=640:h=360:force_original_aspect_ratio=decrease,pad=w=640:h=360:x=(ow-iw)/2:y=(oh-ih)/2[aa];
						//movie=watermark.png[bb];[aa][bb]overlay=5:5 yyy.flv
						//AVFilter参数作用如下所示
						//scale:视频拉伸滤镜。force_original_aspect_ratio用于强制保持宽高比
						//pad:用于加黑边，四个参数含义分别为：处理后宽，处理后高，输入图像左上角x坐标，输入视频左上角Y坐标。
						//其中ow,oh为输出（填充后）视频的宽高；iw,ih为输入（填充前）视频的宽高。
						//movie：用于指定需要叠加的水印Logo（PNG文件）。
						//overlay:用于叠加水印Logo和视频文件
						//命令行不同的执行方式
						//cmd /c xxx 是执行完xxx命令后关闭命令窗口。
						//cmd /k xxx 是执行完xxx命令后不关闭命令窗口。
						//cmd /c start xxx 会打开一个新窗口后执行xxx指令，原窗口会关闭。
						String videotranscodecommand="cmd ";
						videotranscodecommand+="/c start ";
						//videotranscodecommand+="/c ";
						videotranscodecommand+="ffmpeg -y ";
						videotranscodecommand+="-i ";
						videotranscodecommand+="\""+realfileoriginalPath+"\" ";
						videotranscodecommand+="-vcodec "+transcoder_vcodec_cfg.getVal()+" ";
						videotranscodecommand+="-b:v "+transcoder_bv_cfg.getVal()+" ";
						videotranscodecommand+="-r "+transcoder_framerate_cfg.getVal()+" ";
						videotranscodecommand+="-acodec "+transcoder_acodec_cfg.getVal()+" ";
						videotranscodecommand+="-b:a "+transcoder_ba_cfg.getVal()+" ";
						videotranscodecommand+="-ar "+transcoder_ar_cfg.getVal()+" ";
						videotranscodecommand+="-vf ";
						videotranscodecommand+="scale=w="+transcoder_scale_w_cfg.getVal()+":h="+transcoder_scale_h_cfg.getVal();
						if(transcoder_keepaspectratio_cfg.getVal().equals("true")){
							videotranscodecommand+=":"+"force_original_aspect_ratio=decrease,pad=w="+
						transcoder_scale_w_cfg.getVal()+":h="+transcoder_scale_h_cfg.getVal()+":x=(ow-iw)/2:y=(oh-ih)/2";
						}
						videotranscodecommand+="[aa]";
						if(transcoder_watermarkuse_cfg.getVal().equals("true")){
							videotranscodecommand+=";movie=";
							videotranscodecommand+=watermarkFile;
							videotranscodecommand+="[bb];";
							videotranscodecommand+="[aa][bb]";
							videotranscodecommand+="overlay=x="+transcoder_watermark_x_cfg.getVal()+":y="+transcoder_watermark_y_cfg.getVal()+" ";
						}else{
							videotranscodecommand+=" ";
						}
						videotranscodecommand+="\"";
						videotranscodecommand+=realfilePath;
						videotranscodecommand+="\"";
						
						
						System.out.println(videotranscodecommand);
						Process process=Runtime.getRuntime().exec(videotranscodecommand,null,realwatermarkDirFile);
						//------------------------
						BufferedInputStream in = new BufferedInputStream(process.getInputStream()); 
						BufferedInputStream err = new BufferedInputStream(process.getErrorStream()); 
						BufferedReader inBr = new BufferedReader(new InputStreamReader(in));
						BufferedReader errBr = new BufferedReader(new InputStreamReader(err));
						String lineStr;
						while ((lineStr = inBr.readLine()) != null) { 
							System.out.println(lineStr);
						}
						while ((lineStr = errBr.readLine()) != null) { 
							System.out.println(lineStr);
						}
						
						if (process.waitFor() != 0) {  
							if (process.exitValue() == 1)//p.exitValue()==0表示正常结束，1：非正常结束  
								System.err.println("Failed!");  
						}  
						inBr.close();  
						in.close();  

						video.setVideostate(nextvideostate);
						baseService.update(video);
						//Rest--------------------------
						sleep(10 * 1000);
					}
				}
			sleep(10 * 1000);
		}while(true);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	
	}

}
