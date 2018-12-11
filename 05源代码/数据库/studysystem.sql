# Host: 10.254.1.11  (Version 5.0.22-community-nt)
# Date: 2018-11-26 08:07:04
# Generator: MySQL-Front 6.0  (Build 3.3)


#
# Structure for table "actions"
#

DROP TABLE IF EXISTS `actions`;
CREATE TABLE `actions` (
  `action_id` int(11) NOT NULL auto_increment COMMENT 'åè½id',
  `action_name` varchar(30) default NULL COMMENT 'åè½å',
  `action_url` varchar(150) default NULL COMMENT 'åè½å°å',
  `action_pid` int(11) default NULL COMMENT 'åè½ç¶èç¹id',
  `action_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `action_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "actions"
#

INSERT INTO `actions` VALUES (1,'系统管理',NULL,0,NULL,NULL),(2,'业务管理',NULL,0,NULL,NULL),(3,'学习培训',NULL,0,NULL,NULL),(4,'个人信息','/159000701OSS/moduls/user/detail.jsp',0,NULL,NULL),(5,'查看学习','/159000701OSS/moduls/studyinfo/studentstudyinfo.jsp',0,NULL,NULL),(6,'学习成绩','/159000701OSS/moduls/tongji/studentscoretj.jsp',0,NULL,NULL),(7,'用户管理','/159000701OSS/moduls/user/usermanager.jsp',1,NULL,NULL),(8,'角色管理','/159000701OSS/moduls/role/rolemanager.jsp',1,NULL,NULL),(9,'功能管理','/159000701OSS/moduls/action/actionmanager.jsp',1,NULL,NULL),(10,'课程管理','/159000701OSS/moduls/course/coursemanager.jsp',2,NULL,NULL),(11,'课件管理',NULL,2,NULL,NULL),(12,'批次管理','/159000701OSS/moduls/batch/batchmanager.jsp',2,NULL,NULL),(13,'批次课程管理','/159000701OSS/moduls/batchcourse/bcmanager.jsp',2,NULL,NULL),(14,'考试资格筛查','/159000701OSS/moduls/studyinfo/studyinfomanager.jsp',2,NULL,NULL),(15,'成绩管理','/159000701OSS/moduls/score/scoremanager.jsp',2,NULL,NULL),(16,'统计分析',NULL,2,NULL,NULL),(17,'选择课程','/159000701OSS/choosebatchjsp.do',3,NULL,NULL),(18,'进入学习','/159000701OSS/choosecoursejsp.do',3,NULL,NULL);

#
# Structure for table "batch"
#

DROP TABLE IF EXISTS `batch`;
CREATE TABLE `batch` (
  `batch_id` int(11) NOT NULL auto_increment COMMENT 'æ¹æ¬¡id',
  `batch_name` varchar(30) default NULL COMMENT 'æ¹æ¬¡å',
  `batch_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `batch_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "batch"
#

INSERT INTO `batch` VALUES (1,'批次1',NULL,NULL);

#
# Structure for table "batchcourse"
#

DROP TABLE IF EXISTS `batchcourse`;
CREATE TABLE `batchcourse` (
  `Id` int(11) NOT NULL auto_increment,
  `batchid` int(11) default NULL COMMENT 'æ¹æ¬¡id',
  `courseid` int(11) default NULL COMMENT 'è¯¾ç¨id',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "batchcourse"
#

INSERT INTO `batchcourse` VALUES (1,1,1);

#
# Structure for table "chapter"
#

DROP TABLE IF EXISTS `chapter`;
CREATE TABLE `chapter` (
  `chapter_id` int(11) NOT NULL auto_increment COMMENT 'ç« èid',
  `chapter_name` varchar(30) default NULL COMMENT 'ç« èå',
  `chapter_pid` int(11) default NULL COMMENT 'ç« èç¶èç¹id',
  `is_leaf` tinyint(1) default '0' COMMENT 'æ¯å¦æ¯å­èç¹',
  `chapter_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `chapter_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`chapter_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "chapter"
#

INSERT INTO `chapter` VALUES (1,'章节1',0,0,NULL,NULL),(2,'小节1',1,0,NULL,NULL),(3,'小节2',1,0,NULL,NULL);

#
# Structure for table "chapterfile"
#

DROP TABLE IF EXISTS `chapterfile`;
CREATE TABLE `chapterfile` (
  `Id` int(11) NOT NULL auto_increment,
  `chapterid` int(11) default NULL COMMENT 'è¯¾ç¨id',
  `fileid` int(11) default NULL COMMENT 'è¯¾ä»¶id',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=COMPACT;

#
# Data for table "chapterfile"
#

INSERT INTO `chapterfile` VALUES (1,2,1),(2,2,2),(3,3,3),(4,3,4);

#
# Structure for table "course"
#

DROP TABLE IF EXISTS `course`;
CREATE TABLE `course` (
  `course_id` int(11) NOT NULL auto_increment COMMENT 'è¯¾ç¨id',
  `course_name` varchar(30) default '' COMMENT 'è¯¾ç¨å',
  `course_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `course_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`course_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "course"
#

INSERT INTO `course` VALUES (1,'课程1',NULL,NULL);

#
# Structure for table "coursechapter"
#

DROP TABLE IF EXISTS `coursechapter`;
CREATE TABLE `coursechapter` (
  `Id` int(11) NOT NULL auto_increment,
  `courseid` int(11) default NULL COMMENT 'è¯¾ç¨id',
  `chapterid` int(11) default NULL COMMENT 'ç« èid',
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "coursechapter"
#

INSERT INTO `coursechapter` VALUES (1,1,1),(2,1,2),(3,1,3);

#
# Structure for table "coursefile"
#

DROP TABLE IF EXISTS `coursefile`;
CREATE TABLE `coursefile` (
  `file_id` int(11) NOT NULL auto_increment COMMENT 'è¯¾ä»¶id',
  `file_name` varchar(30) default NULL COMMENT 'è¯¾ä»¶å',
  `file_url` varchar(50) default NULL COMMENT 'è¯¾ä»¶å°å',
  `file_text` text COMMENT 'è¯¾ä»¶è¯´æ',
  `file_type` tinyint(1) default NULL COMMENT 'è¯¾ä»¶ç±»åï¼0=è§é¢ï¼1=è¯¾ä»¶',
  `file_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `file_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`file_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "coursefile"
#

INSERT INTO `coursefile` VALUES (1,'视频1','/uploadVideo/b53370ecbd1845789b0cef006990eb2e.mp4','aaaaaaaa',0,NULL,NULL),(2,'','','',1,NULL,NULL),(3,'视频2','/uploadVideo/729251d99eb0412ab165322221114e4f.mp4','bbbbbb',0,NULL,NULL),(4,'','','',1,NULL,NULL);

#
# Structure for table "fileinfo"
#

DROP TABLE IF EXISTS `fileinfo`;
CREATE TABLE `fileinfo` (
  `fileinfo_id` int(11) NOT NULL auto_increment COMMENT 'è¯¾ä»¶ç»´æ¤id',
  `file_id` int(11) default NULL COMMENT 'è¯¾ä»¶id',
  `fileinfo_alltime` decimal(10,2) default NULL COMMENT 'è¯¾ä»¶æ»æ¶é¿',
  `fileinfo_playtime` decimal(10,2) default NULL COMMENT 'è¯¾ä»¶æ­æ¾æ¶é¿',
  `fileinfo_ratio` varchar(255) default NULL COMMENT 'è¯¾ä»¶è¿åº¦',
  `fileinfo_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `fileinfo_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`fileinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "fileinfo"
#

INSERT INTO `fileinfo` VALUES (1,1,20.02,4.46,'0.22289565434565436',NULL,NULL),(2,3,20.02,0.00,'1.0',NULL,NULL);

#
# Structure for table "role"
#

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `role_id` int(11) NOT NULL auto_increment COMMENT 'è§è²id',
  `role_name` varchar(30) default NULL COMMENT 'è§è²å',
  `role_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `role_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "role"
#

INSERT INTO `role` VALUES (1,'管理员',NULL,NULL),(2,'学员',NULL,NULL);

#
# Structure for table "roleaction"
#

DROP TABLE IF EXISTS `roleaction`;
CREATE TABLE `roleaction` (
  `Id` int(11) NOT NULL auto_increment,
  `roleid` int(11) default NULL COMMENT 'è§è²id',
  `actionid` int(11) default NULL COMMENT 'åè½id',
  PRIMARY KEY  (`Id`),
  KEY `roleid` (`roleid`),
  KEY `actionid` (`actionid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "roleaction"
#

INSERT INTO `roleaction` VALUES (1,1,1),(2,1,2),(7,1,7),(8,1,8),(9,1,9),(10,1,10),(12,1,12),(13,1,13),(14,1,14),(15,1,15),(16,1,16),(17,2,17),(18,2,18),(29,2,3),(30,2,4),(31,2,5),(33,2,6);

#
# Structure for table "score"
#

DROP TABLE IF EXISTS `score`;
CREATE TABLE `score` (
  `score_id` int(11) NOT NULL auto_increment COMMENT 'åæ°id',
  `studentcode` varchar(11) default '0' COMMENT 'å­¦çç¼å·',
  `score_stdname` varchar(30) default NULL COMMENT 'å­¦çå',
  `score_batchname` varchar(255) default NULL,
  `score_coursename` varchar(255) default NULL,
  `score` decimal(10,2) default NULL COMMENT 'åæ°',
  `score_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `score_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`score_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "score"
#

INSERT INTO `score` VALUES (1,'159000701','mbw','批次1','课程1',111.00,NULL,NULL),(2,'159000701','mbw','批次1','课程2',111.00,NULL,NULL),(3,'159000701','mbw','批次1','课程3',111.00,NULL,NULL);

#
# Structure for table "studentinfo"
#

DROP TABLE IF EXISTS `studentinfo`;
CREATE TABLE `studentinfo` (
  `student_id` int(11) NOT NULL auto_increment COMMENT 'å­¦çid',
  `userid` int(11) default NULL COMMENT 'å­¦çç¼å·',
  `student_name` varchar(30) default NULL COMMENT 'å­¦çå',
  `student_sex` tinyint(1) default NULL COMMENT 'å­¦çæ§å« 0ï¼ç· 1ï¼å¥³',
  `student_email` varchar(50) default NULL COMMENT 'å­¦çé®ç®±',
  `student_phone` varchar(11) default NULL COMMENT 'å­¦ççµè¯',
  `studnet_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `student_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`student_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "studentinfo"
#

INSERT INTO `studentinfo` VALUES (1,33,'asd',0,'2132','1231',NULL,NULL),(2,34,'ldy',0,'123','123',NULL,NULL);

#
# Structure for table "studyinfo"
#

DROP TABLE IF EXISTS `studyinfo`;
CREATE TABLE `studyinfo` (
  `studyinfo_id` int(11) NOT NULL auto_increment COMMENT 'å­¦ä¹ è®°å½id',
  `studyinfo_studentname` varchar(30) default NULL COMMENT 'å­¦çå',
  `studyinfo_ratio` decimal(10,2) default NULL COMMENT 'å­¦ä¹ è¿åº¦',
  `studyinfo_state` tinyint(1) default NULL COMMENT 'å®¡æ ¸ç¶æ0ï¼æªéè¿1:å®¡æ ¸ä¸­2ï¼å·²éè¿',
  `studyinfo_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `studyinfo_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`studyinfo_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "studyinfo"
#


#
# Structure for table "userbatch"
#

DROP TABLE IF EXISTS `userbatch`;
CREATE TABLE `userbatch` (
  `Id` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL,
  `batchid` int(11) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "userbatch"
#

INSERT INTO `userbatch` VALUES (1,33,1);

#
# Structure for table "userfile"
#

DROP TABLE IF EXISTS `userfile`;
CREATE TABLE `userfile` (
  `Id` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL,
  `fileinfoid` varchar(255) default NULL,
  PRIMARY KEY  (`Id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "userfile"
#

INSERT INTO `userfile` VALUES (1,33,'1'),(2,33,'2');

#
# Structure for table "users"
#

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `user_id` int(11) NOT NULL auto_increment COMMENT 'ç¨æ·id',
  `username` varchar(30) default NULL COMMENT 'ç¨æ·å',
  `password` varchar(20) default NULL COMMENT 'å¯ç ',
  `user_state` tinyint(1) default NULL COMMENT 'å®¡æ ¸ç¶æ0ï¼æªéè¿1:å®¡æ ¸ä¸­2ï¼å·²éè¿',
  `user_cdate` datetime default NULL COMMENT 'åå»ºæ¶é´',
  `user_udate` datetime default NULL COMMENT 'ä¿®æ¹æ¶é´',
  PRIMARY KEY  (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "users"
#

INSERT INTO `users` VALUES (1,'1','123',2,NULL,NULL),(33,'159000701','123',2,NULL,NULL),(34,'159000713','123',2,NULL,NULL);

#
# Structure for table "userrole"
#

DROP TABLE IF EXISTS `userrole`;
CREATE TABLE `userrole` (
  `Id` int(11) NOT NULL auto_increment,
  `userid` int(11) default NULL COMMENT 'ç¨æ·id',
  `roleid` int(11) default NULL COMMENT 'è§è²id',
  PRIMARY KEY  (`Id`),
  KEY `userid` (`userid`),
  KEY `roleid` (`roleid`),
  CONSTRAINT `userrole_ibfk_2` FOREIGN KEY (`roleid`) REFERENCES `role` (`role_id`),
  CONSTRAINT `userrole_ibfk_1` FOREIGN KEY (`userid`) REFERENCES `users` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

#
# Data for table "userrole"
#

INSERT INTO `userrole` VALUES (1,1,1),(11,33,2),(12,34,2);
