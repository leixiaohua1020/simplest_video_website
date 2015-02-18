/*
Navicat MySQL Data Transfer

Source Server         : 本机Mysql
Source Server Version : 50524
Source Host           : localhost:3306
Source Database       : svw

Target Server Type    : MYSQL
Target Server Version : 50524
File Encoding         : 65001

Date: 2015-02-18 10:57:19
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `category`
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `parentid` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES ('1', 'vod', '0', null);
INSERT INTO `category` VALUES ('2', 'live', '0', null);

-- ----------------------------
-- Table structure for `configure`
-- ----------------------------
DROP TABLE IF EXISTS `configure`;
CREATE TABLE `configure` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `val` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of configure
-- ----------------------------
INSERT INTO `configure` VALUES ('1', 'transcoder_vcodec', 'libx264', 'Video encoder');
INSERT INTO `configure` VALUES ('2', 'transcoder_bv', '500000', 'Video bitrate');
INSERT INTO `configure` VALUES ('3', 'transcoder_framerate', '25', 'Video frame rate');
INSERT INTO `configure` VALUES ('4', 'transcoder_acodec', 'libmp3lame', 'Audio encoder');
INSERT INTO `configure` VALUES ('5', 'transcoder_ar', '22050', 'Audio sample rate');
INSERT INTO `configure` VALUES ('6', 'transcoder_ba', '64000', 'Audio bitrate');
INSERT INTO `configure` VALUES ('7', 'transcoder_scale_w', '640', 'Video width');
INSERT INTO `configure` VALUES ('8', 'transcoder_scale_h', '360', 'Video height');
INSERT INTO `configure` VALUES ('9', 'transcoder_watermarkuse', 'true', 'Use Watermark');
INSERT INTO `configure` VALUES ('10', 'transcoder_watermark_url', 'watermark/svw.png', 'Watermark file\'s URL');
INSERT INTO `configure` VALUES ('11', 'transcoder_watermark_x', '5', 'Watermark\'s location (x)');
INSERT INTO `configure` VALUES ('12', 'transcoder_watermark_y', '5', 'Watermark\'s location (y)');
INSERT INTO `configure` VALUES ('13', 'transcoder_keepaspectratio', 'true', 'Keep original aspect ratio');
INSERT INTO `configure` VALUES ('14', 'transcoder_outfmt', 'flv', 'Output file format');
INSERT INTO `configure` VALUES ('15', 'thumbnail_ss', '5', 'When to get thumbnail (from start)');
INSERT INTO `configure` VALUES ('16', 'folder_videoori', 'videoori', 'Folder to save Upload Video');
INSERT INTO `configure` VALUES ('17', 'folder_video', 'video', 'Folder to save Transcode Video');
INSERT INTO `configure` VALUES ('18', 'folder_thumbnail', 'videothumbnail', 'Folder to save Thumbnail of Video');

-- ----------------------------
-- Table structure for `video`
-- ----------------------------
DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `intro` varchar(8192) DEFAULT NULL,
  `edittime` datetime DEFAULT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `islive` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `oriurl` varchar(255) DEFAULT NULL,
  `thumbnailurl` varchar(255) DEFAULT NULL,
  `videostateid` int(11) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_CATEGORY` (`categoryid`),
  KEY `FK_VIDEOSTATE` (`videostateid`),
  CONSTRAINT `FK_CATEGORY` FOREIGN KEY (`categoryid`) REFERENCES `category` (`id`),
  CONSTRAINT `FK_VIDEOSTATE` FOREIGN KEY (`videostateid`) REFERENCES `videostate` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of video
-- ----------------------------
INSERT INTO `video` VALUES ('1', 'Avatar', '', '2015-02-16 13:13:35', '1', '0', 'video/1.flv', 'videoori/Avatar Blueray 3D.flv', 'videothumbnail/1.jpg', '4', null);
INSERT INTO `video` VALUES ('2', '建国大业', '影片讲述了从抗日战争结束到1949年中华人民共和国建国前夕发生的一系列故事，主线是中国人民政治协商会议第一届全体会议的筹备，突出了当时中国共产党领导的多党合作和政治协商制度的形成 。', '2015-02-16 13:31:04', '1', '0', 'video/2.flv', 'videoori/建国大业.mpg', 'videothumbnail/2.jpg', '4', null);
INSERT INTO `video` VALUES ('3', 'Sintel', 'Sintel (code-named Durian) is a short computer animated film by the Blender Institute, part of the Blender Foundation. Like the foundation\'s previous films Elephants Dream and Big Buck Bunny, the film was made using Blender, a free software application for animation created and supported by the same foundation. Sintel was produced by Ton Roosendaal, chairman of the Foundation, and directed by Colin Levy, an artist at Pixar Animation Studios.', '2015-02-16 13:32:48', '1', '0', 'video/3.flv', 'videoori/sintel.wmv', 'videothumbnail/3.jpg', '4', null);
INSERT INTO `video` VALUES ('4', 'Warcraft III - The Frozen Throne', 'The Frozen Throne was the receptacle of the soul of the Elder Shaman Ner\'zhul following his transformation into the dreaded Lich King. It stood atop a tall spire within a vast chamber. At the end of the War for the Frozen Throne, King Arthas entered the throne chamber, ascended the spire, and shattered the throne with Frostmourne. After the throne chamber collapsed and Arthas merged with Ner\'zhul to become the new Lich King, he used the remnants of the Frozen Throne as a physical throne. While the Lich King slept, Icecrown Citadel was built around the spire.', '2015-02-16 13:37:39', '1', '0', 'video/4.flv', 'videoori/Warcraft3_End.avi', 'videothumbnail/4.jpg', '4', null);
INSERT INTO `video` VALUES ('5', 'CUC IESchool', 'Just a test!', '2015-02-16 13:39:04', '1', '0', 'video/5.flv', 'videoori/cuc_ieschool.mkv', 'videothumbnail/5.jpg', '4', null);
INSERT INTO `video` VALUES ('6', '中国合伙人', '国合伙人是由香港导演陈可辛执导，黄晓明、邓超、佟大为主演，讲述由20世纪80年代至21世纪初，大时代下三个年轻人从学生年代相遇、相识，拥有同样的梦想至一起打拼事业，共同创办英语培训学校，最后功成名就实现梦想的励志故事。该片浓缩了一代创业者的成长历程，具有一定的时代意义。', '2015-02-16 13:40:00', '1', '0', 'video/6.flv', 'videoori/中国合伙人.flv', 'videothumbnail/6.jpg', '4', null);
INSERT INTO `video` VALUES ('7', '那些年，我们一起追的女孩', '青春是一场大雨。即使感冒了，还盼望回头再淋它一次。人生就是不停的战斗，在还没有获得女神青睐时，左手永远都只是辅助！！！ \r\n　　柯景腾（柯震东 饰）和他的一群好友，爱耍帅却老是情场失意的老曹（敖犬 饰），停止不了勃起所以叫勃起的勃起（鄢胜宇 饰），想用搞笑致胜却总是失败的该边（蔡昌 宪 饰），胖界的夺爱高手阿和（赦绍文 饰），从国中到高中，一直是不离不弃的死党。他们都对班花沈佳宜（陈妍希 饰）有着一种纠结的感情。一方面，他们瞧不起这种只会用功读书的女生，另一方面他们又为她的美好气质倾倒。因为学习成绩较差，柯景腾被老师安排坐在沈佳宜前面。因为他的一次英雄救美，她开始用强制的方式帮他补习功课。此事令其他兄弟羡慕嫉妒恨，但是大家都未说破。毕业后，柯景腾和沈佳宜在各自大学保持恋人般的联系。直到他举办自由格斗赛，事情才出现了变化…… 这一连串下，原本按兵不动的好友也都纷纷加入女神争夺战！但是麻吉诚可贵，青春价更高，若为女神故，是否二者皆可抛哩？！ \r\n　　本片根据导演兼编剧九把刀在2007年的自传体小说改编。柯震东凭借本片获第48届金马奖最佳新演员。', '2015-02-16 13:41:29', '1', '0', 'video/7.flv', 'videoori/那些年，我们一起追的女孩.mp4', 'videothumbnail/7.jpg', '4', null);
INSERT INTO `video` VALUES ('8', '春晚是什么？', '春晚到底是什么？是团圆？是期待？是节日？这部短片用短短几分钟告诉我们春晚是什么。', '2015-02-16 13:42:36', '1', '0', 'video/8.flv', 'videoori/春晚是什么？.mov', 'videothumbnail/8.jpg', '4', null);
INSERT INTO `video` VALUES ('9', 'Forrest Gump IMAX', 'Forrest Gump is a 1994 American epic romantic-comedy-drama film based on the 1986 novel of the same name by Winston Groom. The film was directed by Robert Zemeckis and starred Tom Hanks, Robin Wright, Gary Sinise, Mykelti Williamson, and Sally Field. The story depicts several decades in the life of Forrest Gump, a slow-witted and naïve, but good-hearted and athletically prodigious, man from Alabama who witnesses, and in some cases influences, some of the defining events[peacock term] of the latter half of the 20th century in the United States; more specifically, the period between Forrest\'s birth in 1944 and 1982. The film differs substantially from Winston Groom\'s novel on which it was based, including Gump\'s personality and several events that were depicted.', '2015-02-16 13:43:24', '1', '0', 'video/9.flv', 'videoori/Forrest Gump IMAX.mp4', 'videothumbnail/9.jpg', '4', null);
INSERT INTO `video` VALUES ('10', '屌丝男士', '《屌丝男士》不是传统意义上的情景喜剧，有固定时长和单一场景，以及简单的生活细节。而是一部具有鲜明网络特点，舞台感十足，整体没有剧情衔接，固定的演员演绎着并不固定角色的笑话集。每个人都有疯狂和屌丝的一面，《屌丝男士》希望可以抓住生活中的每一个值得玩味的点，用夸张荒谬的手法对其进行变形，进而疯狂自嘲自贱，在犯二中，达到了娱乐自我和娱乐大众的目的。', '2015-02-16 13:45:06', '1', '0', 'video/10.flv', 'videoori/屌丝男士.mov', 'videothumbnail/10.jpg', '4', null);
INSERT INTO `video` VALUES ('11', 'Titanic', 'Titanic is a 1997 American epic romantic disaster film directed, written, co-produced, and co-edited by James Cameron. A fictionalized account of the sinking of the RMS Titanic, it stars Leonardo DiCaprio and Kate Winslet as members of different social classes who fall in love aboard the ship during its ill-fated maiden voyage.', '2015-02-16 13:47:53', '1', '0', 'video/11.flv', 'videoori/Titanic.mkv', 'videothumbnail/11.jpg', '4', null);
INSERT INTO `video` VALUES ('12', '北广传媒移动电视', '北广传媒移动电视始终坚持正确舆论导向，坚持“服务政府公共管理”、“服务市民精彩生活”的媒体定位，积极与政府“委、办、局”开展多层合作，充分发挥了党管新闻媒体喉舌功能、阵地作用。同时，又依据大多数乘客收视需求精心设计节目结构与编排方式。目前，基本形成以市民服务为主，新闻资讯、文体娱乐为辅的节目风格，为观众第一时间呈现最新的资讯、实时的路况、及时的突发事件报道、精彩赛事节目播报，全面展现“新闻性、资讯性、娱乐性、服务性”特色。在2008年抗震救灾、奥运报道、“神七”发射、全国及北京“两会”等重点宣传工作中突显出媒体的及时性和权威性，成为首都市民喜闻乐见的超级户外电视新媒体。', '2015-02-16 15:30:19', '2', '1', 'rtmp://www.bj-mobiletv.com:8000/live/live1', null, 'videothumbnail/12.jpg', '4', null);
INSERT INTO `video` VALUES ('13', '香港电视台', 'hks香港卫视国际传媒是一家集卫星电视、网络电视、影视剧投资为一体的国际传媒集团。hks香港卫视为国家重点新闻网站，是集新闻直播、娱乐、服务等为一体的具有视听互动特色的综合性门户网站。', '2015-02-16 15:32:08', '2', '1', 'rtmp://live.hkstv.hk.lxdns.com/live/hks', null, 'videothumbnail/13.jpg', '4', null);
INSERT INTO `video` VALUES ('14', '东莞电视台', '东莞广播电视台成立于2005年3月28日，整合了东莞人民广播电台、东莞电视台、东莞阳光网三大媒体，是中共东莞市委宣传部领导下的正处级事业单位，是南方广播影视传媒集团的成员单位。', '2015-02-16 15:34:13', '2', '1', 'rtmp://ftv.sun0769.com/dgrtv1/mp4:b1', null, 'videothumbnail/14.jpg', '4', null);
INSERT INTO `video` VALUES ('15', '看看新闻网', '看看新闻网（www.kankanews.com）是上海广播电视台旗下的网络新闻媒体，是依托上海广播电视台强大的内容资源和制播能力支撑，凭借传统媒体背景，结合网络科技创新技术的新媒体平台。看看新闻网由上海看看牛视网络传播有限公司运营。看看新闻网打破传统电视传播与网络传播的界限，建设以视频新闻为特色的，网民积极参与的，具有公信力、影响力的互动传播网站，构建最具品牌价值的网络新闻互动平台。', '2015-02-16 16:02:21', '2', '1', 'rtmp://live.kksmg.com:80/live/mp4:Stream_1', null, 'videothumbnail/15.jpg', '4', null);
INSERT INTO `video` VALUES ('16', '绍兴新闻综合', '绍兴网络电视台是绍兴广播电视总台主办的,以互联网节目传播载体的新形态广播电视播出机构。', '2015-02-16 16:22:16', '2', '1', 'rtmp://www.scbtv.cn/live/new', null, 'videothumbnail/16.jpg', '4', null);
INSERT INTO `video` VALUES ('17', '央广购物', '央广购物（CNRmall) 系中央人民广播电台倾力打造的专业居家购物公司，是以电视购物频道为主体，辅助以广播、网络、手机app、型录等全通路电子商务平台。2009年6月，经由国家广电总局审批，获得全国电视网络落地覆盖牌照。', '2015-02-16 16:45:45', '2', '1', 'rtmp://wx.cnrmall.com/live/flv', null, 'videothumbnail/17.jpg', '4', null);
INSERT INTO `video` VALUES ('19', '亚太卫视', '亚太卫视是一家立足香港、覆盖亚洲及太平洋地区64个国家（地区）的国际新锐电视台,其节目信号通过香港亚太卫视已持有的卫星电视运营牌照、完善的卫星上行播出系统（亚太六号卫星C波段转发器）等资源与深圳的播控中心及亚太卫视网站，形成完整高效的传播平台，每天24小时滚动向亚洲及太平洋地区播出。', '2015-02-16 17:46:32', '2', '1', 'rtmp://58.61.150.198:1935/live/Livestream', null, 'videothumbnail/19.jpg', '4', null);
INSERT INTO `video` VALUES ('20', 'CCTV中学生', '《CCTV 中学生》频道是经国家广电总局批准，中央电视台开办的面向全国中学生的数字电视付费频道，是全世界首个以中学生教育成长服务为定位的专业电视频道。', '2015-02-16 18:02:50', '2', '1', 'rtmp://ams.studytv.cn/livepkgr/264', null, 'videothumbnail/20.jpg', '4', null);
INSERT INTO `video` VALUES ('22', '广州综合', '', '2015-02-16 18:44:49', '2', '1', 'rtmp://116.199.115.228/live/gztv_tv', null, 'videothumbnail/22.jpg', '4', null);
INSERT INTO `video` VALUES ('23', '睛彩广州', '', '2015-02-16 18:46:03', '2', '1', 'rtmp://116.199.115.228/live/cmmb', null, 'videothumbnail/23.jpg', '4', null);
INSERT INTO `video` VALUES ('24', '深圳娱乐', '', '2015-02-16 18:48:46', '2', '1', 'rtmp://tv.sznews.com:1935/live/live_233_mc43', null, 'videothumbnail/24.jpg', '4', null);
INSERT INTO `video` VALUES ('25', '南阳新闻综合', '', '2015-02-16 18:50:33', '2', '1', 'rtmp://61.136.113.35/tslsChannelLive/zyys888/live', null, 'videothumbnail/25.jpg', '4', null);
INSERT INTO `video` VALUES ('26', '大庆综合', '', '2015-02-16 18:52:58', '2', '1', 'rtmp://live1.baihuwang.com:1935/live/zh', null, 'videothumbnail/26.jpg', '4', null);
INSERT INTO `video` VALUES ('27', '温州新闻综合', '', '2015-02-16 18:58:05', '2', '1', 'rtmp://livetv.dhtv.cn:1935/live/news', null, 'videothumbnail/27.jpg', '4', null);

-- ----------------------------
-- Table structure for `videostate`
-- ----------------------------
DROP TABLE IF EXISTS `videostate`;
CREATE TABLE `videostate` (
  `id` int(11) NOT NULL DEFAULT '0',
  `name` varchar(255) DEFAULT NULL,
  `order` int(11) DEFAULT NULL,
  `cssstyle` varchar(255) DEFAULT NULL,
  `remark` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of videostate
-- ----------------------------
INSERT INTO `videostate` VALUES ('1', '等待上传', '1', 'background:#CCFFFF', null);
INSERT INTO `videostate` VALUES ('2', '等待截图', '2', 'background:#00FF99', null);
INSERT INTO `videostate` VALUES ('3', '等待转码', '3', 'background:#00FF00', null);
INSERT INTO `videostate` VALUES ('4', '完成', '4', 'background:#FFFFFF', null);
