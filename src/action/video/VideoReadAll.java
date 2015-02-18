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

import java.util.List;

import com.opensymphony.xwork2.ActionSupport;

import service.BaseService;

import bean.Video;
/**
 * @author 雷霄骅
 * 读取所有视频信息的Action
 */
public class VideoReadAll extends ActionSupport{
	private List<Video> resultvideo;
	private BaseService baseService;
	private int islive;
	
	public List<Video> getResultvideo() {
		return resultvideo;
	}

	public void setResultvideo(List<Video> resultvideo) {
		this.resultvideo = resultvideo;
	}
	
	public BaseService getBaseService() {
		return baseService;
	}

	public void setBaseService(BaseService baseService) {
		this.baseService = baseService;
	}


	public int getIslive() {
		return islive;
	}

	public void setIslive(int islive) {
		this.islive = islive;
	}

	@SuppressWarnings("unchecked")
	public String execute(){
		try{
			if(islive==0){
				resultvideo=baseService.ReadByProperty("Video","islive",0);
			}else{
				resultvideo=baseService.ReadByProperty("Video","islive",1);
			}
			return SUCCESS;
		}
		catch(Exception ex){
			ex.printStackTrace();
			return ERROR;
		}
	}
}
