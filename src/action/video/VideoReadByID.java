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
package action.video;


import service.BaseService;
//import util.MediaInfo;

import bean.Video;
import com.opensymphony.xwork2.ActionSupport;
/**
 * @author 雷霄骅
 * 根据ID读取视频信息的Action
 */
public class VideoReadByID extends ActionSupport {
	private int videoid;
	private BaseService baseService;
	private String original_videoinfo;
	private String convert_videoinfo;
	private Video video;
	public int getVideoid() {
		return videoid;
	}
	public void setVideoid(int videoid) {
		this.videoid = videoid;
	}
	public BaseService getBaseService() {
		return baseService;
	}
	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}
	
	public Video getVideo() {
		return video;
	}
	public void setVideo(Video video) {
		this.video = video;
	}

	public String getOriginal_videoinfo() {
		return original_videoinfo;
	}
	public void setOriginal_videoinfo(String original_videoinfo) {
		this.original_videoinfo = original_videoinfo;
	}
	public String getConvert_videoinfo() {
		return convert_videoinfo;
	}
	public void setConvert_videoinfo(String convert_videoinfo) {
		this.convert_videoinfo = convert_videoinfo;
	}
	public String execute(){
		try{
			video=(Video) baseService.ReadByID("Video", videoid);
			
			//MediaInfo-------------------
			/*
			ServletContext servletContext = ServletActionContext.getServletContext();
			String realfilePath=servletContext.getRealPath("/").replace('\\', '/')+video.getUrl();
			String realfileoriginalPath=servletContext.getRealPath("/").replace('\\', '/')+video.getOriurl();

			MediaInfo MI = new MediaInfo();
			MI.Option("Output", "HTML");
			original_videoinfo = "";
		    if (MI.Open(realfileoriginalPath)>0){
		    	MI.Option("Complete", "");
				original_videoinfo+= MI.Inform();
	    	}else{
	    	original_videoinfo+="Unable to detect media info\r\n";
	    	}
			convert_videoinfo= "";
			if (MI.Open(realfilePath)>0){
				MI.Option("Complete", "");
				convert_videoinfo+= MI.Inform();
			}else{
		    	convert_videoinfo+="Unable to detect media info\r\n";
		    }
			*/
			//System.out.println(original_videoinfo);
			//System.out.println(convert_videoinfo);
			
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
}
