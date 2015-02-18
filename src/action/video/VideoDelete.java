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

import java.io.File;
import java.util.List;

import org.apache.struts2.ServletActionContext;

import service.BaseService;

import bean.Video;

import com.opensymphony.xwork2.ActionSupport;
/**
 * @author 雷霄骅
 * 删除视频的Action
 */
public class VideoDelete extends ActionSupport {
	private int videoid;
	private BaseService baseService;
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

	public String execute(){
		try{
			Video video=(Video) baseService.ReadByID("Video", videoid);
			//相对路径
			String thumbnailPath=video.getThumbnailurl();
			String path=video.getUrl();
			String oripath=video.getOriurl();
			//获取根路径（绝对路径）
			String thumbnailrealpath=ServletActionContext.getServletContext().getRealPath("/").replace('\\', '/')
					+thumbnailPath;
			String realpath=ServletActionContext.getServletContext().getRealPath("/").replace('\\', '/')
					+path;
			String orirealpath=ServletActionContext.getServletContext().getRealPath("/").replace('\\', '/')
					+oripath;
			File thumbnailfile=new File(thumbnailrealpath);
			File videofile=new File(realpath);
			File orivideofile=new File(orirealpath);
			//删除与之相关的截图文件和视频文件
			if(thumbnailfile!=null){
				thumbnailfile.delete();
			}
			if(videofile!=null){
				videofile.delete();
			}
			if(orivideofile!=null){
				orivideofile.delete();
			}
			//最后才删除该记录
			baseService.delete(video);
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
}
