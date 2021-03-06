-- 设置客户端连接服务器的编码为UTF-8
SET NAMES UTF8;
-- 丢弃数据库，如果存在cake
DROP DATABASE IF EXISTS CAKE;
-- 创建新的数据库cake
CREATE DATABASE CAKE charset=utf8;
-- 进入数据库cake
USE CAKE;
-- 创建保存用户信息的表
CREATE TABLE user(
  uid INT PRIMARY KEY Auto_increment,
  uname VARCHAR(16),
  upwd VARCHAR(32),
  sex BOOL DEFAULT 1,
  birthday DATE,
  phone VARCHAR(11),
  city VARCHAR(11)
);
-- 插入数据
INSERT INTO user VALUES(NULL,'','','','','','');

-- 创建一个首页列表
CREATE TABLE c_index(
  xid INT PRIMARY KEY AUTO_INCREMENT,
  banner VARCHAR(256),
  sorts VARCHAR(36),
  brand_message VARCHAR(128),
  cake_details VARCHAR(128)
);
-- 插入数据
INSERT INTO c_index VALUES(NULL,'img/036.jpg','送给有爱的人','甘一客','鲜奶蛋糕');
INSERT INTO c_index VALUES(NULL,'img/037.jpg','送给爱的人','窝夫小子','慕斯蛋糕');
INSERT INTO c_index VALUES(NULL,'img/038.jpg','送给暖心的人','幸福西饼','水果蛋糕');
INSERT INTO c_index VALUES(NULL,'img/039.jpg','送给关心的人','品牌馆','口味随心挑');
INSERT INTO c_index VALUES(NULL,'img/040.jpg','送给关心的人','诺心','冰淇淋');
INSERT INTO c_index VALUES(NULL,'img/036.jpg','送给爱的人','派悦坊','鲜奶蛋糕');
INSERT INTO c_index VALUES(NULL,'img/041.jpg','送给爱的人','心之和','口味随心挑');
INSERT INTO c_index VALUES(NULL,'img/036.jpg','送给牵挂人','M CAKE','巧克力蛋糕');
INSERT INTO c_index VALUES(NULL,'img/042.jpg','送给牵挂人','品牌馆','口味随心挑');
INSERT INTO c_index VALUES(NULL,'img/043.jpg','送给爱的人','BON CAKE','水果蛋糕');
INSERT INTO c_index VALUES(NULL,'img/036.jpg','送给爱的人','品牌馆','口味随心挑');
INSERT INTO c_index VALUES(NULL,'img/045.jpg','送给失恋的人','cake boss','慕斯蛋糕');
INSERT INTO c_index VALUES(NULL,'img/056.jpg','送给呵护人','品牌馆','鲜奶蛋糕');
INSERT INTO c_index VALUES(NULL,'img/046.jpg','送给呵护人','品牌馆','口味随心挑');
INSERT INTO c_index VALUES(NULL,'img/036.jpg','送给爱的人','幸福西饼','巧克力蛋糕');
INSERT INTO c_index VALUES(NULL,'img/046.jpg','送给爱的人','品牌馆','水果蛋糕');
INSERT INTO c_index VALUES(NULL,'img/055.jpg','送给儿童','派悦坊','口味随心挑');
INSERT INTO c_index VALUES(NULL,'img/017.jpg','送给儿童','品牌馆','巧克力蛋糕');
INSERT INTO c_index VALUES(NULL,'img/036.jpg','送给爱的人','窝夫小子','口味随心挑');
INSERT INTO c_index VALUES(NULL,'img/051.jpg','送给深爱的人','品牌馆','慕斯蛋糕');
INSERT INTO c_index VALUES(NULL,'img/036.jpg','送给爱的人','诺心','鲜奶蛋糕');
-- 创建一个蛋糕系列表
CREATE TABLE series(
  series_id VARCHAR(36),
  series_title VARCHAR(36)
);
-- 插入数据
INSERT INTO series VALUES(1,'深爱');
INSERT INTO series VALUES(2,'四重奏蛋糕');
INSERT INTO series VALUES(3,'蓝色星球');
INSERT INTO series VALUES(4,'小天鹅');
INSERT INTO series VALUES(5,'浓情巧克力');
INSERT INTO series VALUES(6,'汪来了');
INSERT INTO series VALUES(7,'心相印');
INSERT INTO series VALUES(8,'多彩生活');
INSERT INTO series VALUES(9,'陪伴左右');
INSERT INTO series VALUES(10,'全心全意');
INSERT INTO series VALUES(11,'鲜果缤纷');
INSERT INTO series VALUES(12,'情人玫瑰芝士');
INSERT INTO series VALUES(13,'奔放的小野马');
INSERT INTO series VALUES(14,'天使之恋');
INSERT INTO series VALUES(15,'全家福');
INSERT INTO series VALUES(16,'乖乖熊');
INSERT INTO series VALUES(17,'热火朝天');
-- 轮播图表
CREATE TABLE banner(
  baid INT PRIMARY KEY AUTO_INCREMENT,
  pic VARCHAR(512)
);
INSERT INTO banner VALUES(NULL,'041.jpg');
INSERT INTO banner VALUES(NULL,'042.jpg');
INSERT INTO banner VALUES(NULL,'043.jpg');
INSERT INTO banner VALUES(NULL,'054.jpg');
INSERT INTO banner VALUES(NULL,'055.jpg');
INSERT INTO banner VALUES(NULL,'056.jpg');
INSERT INTO banner VALUES(NULL,'060.jpg');

-- 创建保存蛋糕信息的表
CREATE TABLE cake_details(
  did INT PRIMARY KEY Auto_increment,
  title VARCHAR(32),
  dname VARCHAR(32),
  mini_pic VARCHAR(128),
  price DECIMAL(4,1),
  size TINYINT,
  shape VARCHAR(32),
  -- 保鲜时间
  freshtime VARCHAR(32),
  -- 食材
  ingredients VARCHAR(64),
  -- 适用几人
  many_people VARCHAR(16),
  -- 几套餐具
  tableware VARCHAR(24),
  -- 赠送的礼物
  gift VARCHAR(24),
  -- 最快送达时间
  arrival_time VARCHAR(24),
  -- 适用人群
  applicable VARCHAR(24),
  -- 销售总额
  sales_count INT,
  -- 上架时间
  add_time VARCHAR(24),
  -- 品牌id
  brand_id INT,
  -- 分类id
  sort_id INT,
  -- 蛋糕详情页面的介绍图片
  pic1 VARCHAR(64),
  pic2 VARCHAR(64),
  pic3 VARCHAR(64),
  series_id VARCHAR(32)
);
-- 插入数据
INSERT INTO cake_details VALUES(1,'送儿童、心之和、鲜奶蛋糕、热门蛋糕、全部','深爱','006.jpg',276,'6寸','圆形','0-4℃保存12小时、15℃食用为佳','玫瑰酱、芒果/草莓夹心、百利甜酒、乳脂奶油','3-4个人','5套','赠送巧克力牌及贺卡','5小时','送恋人朋友蛋糕',442,'2018-08-18',1,1,'','','',1);
INSERT INTO cake_details VALUES(2,'送恋人朋友蛋糕、甘一客、慕斯蛋糕、热门蛋糕、全部','深爱','006.jpg',406,'8寸','三角形','0-4℃保存12小时、15℃食用为佳','玫瑰酱、芒果/草莓夹心、百利甜酒、乳脂奶油','7-8个人','10套','赠送巧克力牌及贺卡','5小时','送恋人朋友蛋糕',117,'2018-08-28',2,4,'','','',1);
INSERT INTO cake_details VALUES(3,'送老人、cakeboss、水果蛋糕、热门蛋糕、全部','深爱','006.jpg',606,'10寸','方形','0-4℃保存12小时、12℃食用为佳','玫瑰酱、芒果/草莓夹心、百利甜酒、乳脂奶油','11-12个人','14套','赠送巧克力牌及贺卡','5小时','送恋人朋友蛋糕',13,'2018-08-18',3,2,'','','',1);
INSERT INTO cake_details VALUES(4,'送儿童、幸福西饼、草莓夹心、热门蛋糕、全部','深爱','006.jpg',966,'14寸','心形','0-4℃保存12小时、15℃食用为佳','玫瑰酱、芒果/草莓夹心、百利甜酒、乳脂奶油','15-20个人','含22套餐具','赠送巧克力牌及贺卡','5小时','送恋人朋友蛋糕',7,'2020-08-20',4,12,'','','',1);
INSERT INTO cake_details VALUES(5,'送老人、派悦坊、巧克力蛋糕、热门蛋糕、全部','四重奏蛋糕','062.jpg',228,'8寸','方形','0-15℃保存1天、4小时内15℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','3小时','送老人',4805,'2018-11-11',5,3,'','','',2);
INSERT INTO cake_details VALUES(6,'送恋人朋友蛋糕、米卡米卡、芝士蛋糕、热门蛋糕、全部','四重奏蛋糕','062.jpg',288,'9寸','方形','0-4℃保存1天、4小时内18℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',302,'2018-11-11',6,9,'','','',2);
INSERT INTO cake_details VALUES(7,'送儿童、窝夫小子、水果蛋糕、热门蛋糕、全部','四重奏蛋糕','062.jpg',338,'10寸','圆形','0-4℃保存2天、6小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',443,'2018-11-11',7,2,'','','',2);
INSERT INTO cake_details VALUES(8,'送老人、Bon CAKE、巧克力蛋糕、热门蛋糕、全部','四重奏蛋糕','062.jpg',448,'16寸','方形','0-4℃保存1天、4小时内15℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送儿童',27,'2018-10-11',8,3,'','','',2);
INSERT INTO cake_details VALUES(9,'送儿童、诺心、咖啡蛋糕、热门蛋糕、全部','蓝色星球','026.jpg',228,'8寸','心形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、橘子、榴莲肉、香蕉、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',4805,'2018-11-11',9,12,'','','',3);
INSERT INTO cake_details VALUES(10,'送恋人朋友蛋糕、M CAKE、咖啡蛋糕、热门蛋糕、今日达、全部','蓝色星球','026.jpg',288,'9寸','方形','0-4℃保存1天、4小时内18℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',302,'2018-11-11',10,10,'','','',3);
INSERT INTO cake_details VALUES(11,'送儿童、M CAKE、慕斯蛋糕、热门蛋糕、今日达、全部','蓝色星球','026.jpg',338,'10寸','菱形','0-10℃保存2天、3小时内5℃食用为佳','鸡蛋、奶油、乔麦粉、芒果、榴莲肉、香蕉、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',443,'2018-11-11',10,4,'','','',3);
INSERT INTO cake_details VALUES(12,'送儿童、诺心、拿破仑蛋糕、热门蛋糕、全部','蓝色星球','026.jpg',448,'16寸','方形','0-4℃保存1天、4小时内19℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送儿童',27,'2018-9-11',9,8,'','','',3);
INSERT INTO cake_details VALUES(13,'送老人、Bon CAKE、草莓夹心、全部','小天鹅','047.jpg',228,'8寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','0.3小时','送老人',4805,'2018-11-11',8,12,'','','',4);
INSERT INTO cake_details VALUES(14,'送儿童、窝夫小子、芝士蛋糕、今日达、全部','小天鹅','047.jpg',288,'9寸','圆形','0-12℃保存1天、2小时内18℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',302,'2020-7-11',7,9,'','','',4);
INSERT INTO cake_details VALUES(15,'送儿童、米卡米卡、慕斯蛋糕、热门蛋糕、全部','小天鹅','047.jpg',338,'10寸','方形','0-4℃保存2天、4小时内16℃食用为佳','鸡蛋、草莓、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','1小时','送老人',443,'2018-11-11',6,4,'','','',4);
INSERT INTO cake_details VALUES(16,'送恋人朋友蛋糕、派悦坊、水果蛋糕、热门蛋糕、今日达、全部','小天鹅','047.jpg',448,'16寸','方形','0-14℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、乔麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送老人',27,'2020-6-11',5,2,'','','',4);
INSERT INTO cake_details VALUES(17,'送老人、幸福西饼、咖啡蛋糕、热门蛋糕、全部','浓情巧克力','067.jpg',228,'8寸','三角形','0-12℃保存1天、4小时内18℃食用为佳','鸡蛋、奶油、小麦粉、芒果、香蕉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','1.1小时','送恋人朋友蛋糕',4805,'2018-11-11',4,10,'','','',5);
INSERT INTO cake_details VALUES(18,'送儿童、cakeboss、巧克力蛋糕、热门蛋糕、全部','浓情巧克力','067.jpg',288,'9寸','方形','0-4℃保存1天、6小时内5℃食用为佳','鸡蛋、巧克力、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',302,'2018-5-11',3,3,'','','',5);
INSERT INTO cake_details VALUES(19,'送恋人朋友蛋糕、甘一客、草莓夹心、全部','浓情巧克力','067.jpg',338,'10寸','心形','0-13℃保存2天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',443,'2020-11-11',2,12,'','','',5);
INSERT INTO cake_details VALUES(20,'送儿童、幸福西饼、水果蛋糕、今日达、全部','浓情巧克力','067.jpg',448,'16寸','方形','0-4℃保存1天、4小时内18℃食用为佳','鸡蛋、奶油、乔麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','1小时','送老人',27,'2018-11-11',4,2,'','','',5);
INSERT INTO cake_details VALUES(21,'送老人、心之和、巧克力蛋糕、热门蛋糕、全部','汪来了','060.jpg',228,'8寸','圆形','0-13℃保存1天、4小时内5℃食用为佳','鸡蛋、抹茶、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','2小时','送老人',4805,'2018-11-11',1,3,'','','',6);
INSERT INTO cake_details VALUES(22,'送儿童、米卡米卡、慕斯蛋糕、今日达、全部','汪来了','060.jpg',288,'9寸','圆形','0-4℃保存1天、5小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',302,'2020-3-11',6,4,'','','',6);
INSERT INTO cake_details VALUES(23,'送儿童、cakeboss、冰淇淋蛋糕、热门蛋糕、全部','汪来了','060.jpg',338,'10寸','方形','0-14℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','0.5小时','送恋人朋友蛋糕',443,'2018-11-11',3,5,'','','',6);
INSERT INTO cake_details VALUES(24,'送老人、幸福西饼、拿破仑蛋糕、热门蛋糕、今日达、全部','汪来了','060.jpg',448,'16寸','三角形','0-4℃保存2天、4小时内19℃食用为佳','鸡蛋、冰淇淋、小麦粉、芒果、香蕉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',27,'2019-11-11',4,8,'','','',6);
INSERT INTO cake_details VALUES(25,'送恋人朋友蛋糕、派悦坊、草莓夹心、热门蛋糕、今日达、全部','心相印','011.jpg',228,'8寸','心形','0-4℃保存1天、3小时内5℃食用为佳','鸡蛋、奶油、乔麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','1小时','送老人',4805,'2019-11-11',5,12,'','','',7);
INSERT INTO cake_details VALUES(26,'送儿童、幸福西饼、芝士蛋糕、今日达、全部','心相印','011.jpg',288,'9寸','方形','0-14℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',302,'2019-11-11',4,9,'','','',7);
INSERT INTO cake_details VALUES(27,'送儿童、米卡米卡、巧克力蛋糕、今日达、全部','心相印','011.jpg',338,'10寸','方形','0-14℃保存1天、4小时内20℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',443,'2018-11-11',6,3,'','','',7);
INSERT INTO cake_details VALUES(28,'送恋人朋友蛋糕、幸福西饼、水果蛋糕、热门蛋糕、全部','心相印','011.jpg',448,'16寸','圆形','0-4℃保存1天、1小时内20℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送老人',27,'2018-11-11',6,2,'','','',7);
INSERT INTO cake_details VALUES(29,'送儿童、窝夫小子、慕斯蛋糕、热门蛋糕、全部','多彩生活','007.jpg',228,'8寸','心形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、粗粮、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','3小时','送老人',4805,'2019-11-11',7,4,'','','',8);
INSERT INTO cake_details VALUES(30,'送恋人朋友蛋糕、幸福西饼、冰淇淋蛋糕、全部','多彩生活','007.jpg',288,'9寸','方形','0-4℃保存3天、4小时内5℃食用为佳','鸡蛋、奶油、乔麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送祝福牌及贺卡','2小时','送老人',302,'2021-11-11',4,5,'','','',8);
INSERT INTO cake_details VALUES(31,'送儿童、Bon CAKE、水果蛋糕、热门蛋糕、全部','多彩生活','007.jpg',338,'10寸','圆形','0-15℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、香蕉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','2小时','送恋人朋友蛋糕',443,'2018-11-11',8,2,'','','',8);
INSERT INTO cake_details VALUES(32,'送儿童、诺心、水果蛋糕、热门蛋糕、今日达、全部','多彩生活','007.jpg',448,'16寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送心愿牌及贺卡','3小时','送老人',27,'2021-1-11',9,12,'','','',8);
INSERT INTO cake_details VALUES(33,'送老人、诺心、巧克力蛋糕、今日达、全部','陪伴左右','009.jpg',228,'8寸','菱形','0-4℃保存1天、4小时内15℃食用为佳','鸡蛋、奶油、淀粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','1小时','送老人',4805,'2018-11-12',9,3,'','','',9);
INSERT INTO cake_details VALUES(34,'送儿童、幸福西饼、慕斯蛋糕、全部','陪伴左右','009.jpg',288,'9寸','圆形','0-2℃保存2天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送恋人朋友蛋糕',302,'2020-11-13',4,4,'','','',9);
INSERT INTO cake_details VALUES(35,'送老人、Bon CAKE、水果蛋糕、今日达、全部','陪伴左右','009.jpg',338,'10寸','方形','0-15℃保存1天、4小时内20℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','1小时','送老人',443,'2018-11-14',8,2,'','','',9);
INSERT INTO cake_details VALUES(36,'送儿童、派悦坊、芝士蛋糕、热门蛋糕、全部','陪伴左右','009.jpg',448,'16寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、草莓、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送老人',27,'2018-11-15',5,9,'','','',9);
INSERT INTO cake_details VALUES(37,'送老人、窝夫小子、冰淇淋蛋糕、热门蛋糕、今日达、全部','全心全意','005.jpg',228,'8寸','菱形','0-4℃保存1天、4小时内15℃食用为佳','鸡蛋、奶油、乔麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','1.5小时','送恋人朋友蛋糕',4805,'2018-11-11',7,5,'','','',10);
INSERT INTO cake_details VALUES(38,'送儿童、米卡米卡、巧克力蛋糕、全部','全心全意','005.jpg',288,'9寸','方形','0-13℃保存3天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',302,'2018-11-16',6,10,'','','',10);
INSERT INTO cake_details VALUES(39,'恋人朋友、米卡米卡、水果蛋糕、热门蛋糕、今日达、全部','全心全意','005.jpg',338,'10寸','圆形','0-15℃保存1天、4小时内20℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','1小时','送老人',443,'2018-11-11',6,2,'','','',10);
INSERT INTO cake_details VALUES(40,'送儿童、甘一客、水果蛋糕、全部','全心全意','005.jpg',448,'16寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、苹果、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送老人',27,'2018-11-17',2,12,'','','',10);
INSERT INTO cake_details VALUES(41,'老人、派悦坊、慕斯蛋糕、热门蛋糕、全部','鲜果缤纷','006.jpg',228,'8寸','圆形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送祝福牌及贺卡','3小时','送老人',4805,'2018-11-11',5,4,'','','',11);
INSERT INTO cake_details VALUES(42,'送儿童、甘一客、水果蛋糕、全部','鲜果缤纷','006.jpg',288,'9寸','方形','0-4℃保存4天、4小时内15℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','1.2小时','送恋人朋友蛋糕',302,'2018-11-18',2,2,'','','',11);
INSERT INTO cake_details VALUES(43,'送儿童、甘一客、冰淇淋蛋糕、热门蛋糕、全部','鲜果缤纷','006.jpg',338,'10寸','方形','0-15℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、乔麦粉、芒果、火龙果、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',443,'2018-11-11',4,2,'','','',11);
INSERT INTO cake_details VALUES(44,'送恋人朋友蛋糕、诺心、巧克力蛋糕、全部','鲜果缤纷','006.jpg',448,'16寸','三角形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送心愿牌及贺卡','3小时','送儿童',27,'2018-11-11',9,3,'','','',11);
INSERT INTO cake_details VALUES(45,'送儿童、米卡米卡、水果蛋糕、热门蛋糕、全部','情人玫瑰芝士','059.jpg',228,'8寸','方形','0-4℃保存3天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',4805,'2018-11-11',6,2,'','','',12);
INSERT INTO cake_details VALUES(46,'送恋人朋友蛋糕、M CAKE、芝士蛋糕、全部','情人玫瑰芝士','059.jpg',288,'9寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、香蕉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','2小时','送老人',302,'2018-11-20',10,12,'','','',12);
INSERT INTO cake_details VALUES(47,'送儿童、心之和、慕斯蛋糕、热门蛋糕、全部','情人玫瑰芝士','059.jpg',338,'10寸','方形','0-20℃保存1天、8小时内15℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','1小时','送老人',443,'2018-11-11',1,4,'','','',12);
INSERT INTO cake_details VALUES(48,'送儿童、派悦坊、芝士蛋糕、全部','情人玫瑰芝士','059.jpg',448,'16寸','方形','0-4℃保存2天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送儿童',27,'2018-11-20',5,9,'','','',12);
INSERT INTO cake_details VALUES(49,'送恋人朋友蛋糕、甘一客、巧克力蛋糕、热门蛋糕、今日达、全部','奔放的小野马','065.jpg',228,'8寸','三角形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送扑克牌及贺卡','3小时','送老人',4805,'2018-11-11',2,3,'','','',13);
INSERT INTO cake_details VALUES(50,'送儿童、幸福西饼、水果蛋糕、今日达、全部','奔放的小野马','065.jpg',288,'9寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、椰子、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',302,'2018-11-11',4,2,'','','',13);
INSERT INTO cake_details VALUES(51,'送儿童、甘一客、冰淇淋蛋糕、今日达、全部','奔放的小野马','065.jpg',338,'10寸','三角形','0-4℃保存1天、7小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','1小时','送儿童',443,'2018-11-21',2,5,'','','',13);
INSERT INTO cake_details VALUES(52,'恋人朋友、派悦坊、拿破仑蛋糕、热门蛋糕、全部','奔放的小野马','065.jpg',448,'16寸','方形','0-20℃保存2天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送停车牌及贺卡','3小时','送老人',27,'2018-11-11',5,8,'','','',13);
INSERT INTO cake_details VALUES(53,'送老人、甘一客、巧克力蛋糕、今日达、全部','天使之恋','050.jpg',228,'8寸','菱形','0-20℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','1小时','送老人',4805,'2018-11-21',2,3,'','','',14);
INSERT INTO cake_details VALUES(54,'送儿童、幸福西饼、抹茶蛋糕、热门蛋糕、今日达、全部','天使之恋','050.jpg',288,'9寸','方形','0-4℃保存1天、6小时内5℃食用为佳','鸡蛋、奶油、淀粉、芒果、猕猴桃、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送恋人朋友蛋糕',302,'2019-11-11',4,6,'','','',14);
INSERT INTO cake_details VALUES(55,'恋人朋友、M CAKE、草莓夹心、今日达、全部','天使之恋','050.jpg',338,'10寸','方形','0-13℃保存2天、4小时内20℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','0.6小时','送老人',443,'2019-11-11',10,12,'','','',14);
INSERT INTO cake_details VALUES(56,'送老人、诺心、水果蛋糕、热门蛋糕、今日达、全部','天使之恋','050.jpg',448,'16寸','圆形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、橘子、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','3小时','送老人',27,'2019-11-11',9,2,'','','',14);
INSERT INTO cake_details VALUES(57,'送儿童、米卡米卡、拿破仑蛋糕、今日达、全部','全家福','040.jpg',228,'8寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','0.8小时','送恋人朋友蛋糕',4805,'2018-07-11',6,8,'','','',15);
INSERT INTO cake_details VALUES(58,'送儿童、派悦坊、巧克力蛋糕、热门蛋糕、全部','全家福','040.jpg',288,'9寸','三角形','0-13℃保存3天、5小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、猕猴桃、巧克力、干酪','9-12个人','含14套餐具','赠送扑克牌及贺卡','3小时','送儿童',302,'2018-11-29',5,3,'','','',15);
INSERT INTO cake_details VALUES(59,'送老人、甘一客、芝士蛋糕、今日达、全部','全家福','040.jpg',338,'10寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、淀粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',443,'2018-11-11',2,9,'','','',15);
INSERT INTO cake_details VALUES(60,'送儿童、心之和、抹茶蛋糕、热门蛋糕、今日达、全部','全家福','040.jpg',448,'16寸','圆形','0-4℃保存3天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、火龙果、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',27,'2019-09-11',1,6,'','','',15);
INSERT INTO cake_details VALUES(61,'送儿童、M CAKE、水果蛋糕、今日达、全部','乖乖熊','017.jpg',228,'8寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、淀粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','3小时','送老人',4805,'2018-11-11',10,2,'','','',16);
INSERT INTO cake_details VALUES(62,'恋人朋友、cakeboss、巧克力蛋糕、热门蛋糕、今日达、全部','乖乖熊','017.jpg',288,'9寸','方形','0-4℃保存1天、3小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送祝福牌及贺卡','3小时','送恋人朋友蛋糕',302,'2018-12-11',3,3,'','','',16);
INSERT INTO cake_details VALUES(63,'送儿童、诺心、冰淇淋蛋糕、今日达、全部','乖乖熊','017.jpg',338,'10寸','方形','0-4℃保存3天、4小时内5℃食用为佳','鸡蛋、莫斯、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',443,'2018-12-11',9,6,'','','',16);
INSERT INTO cake_details VALUES(64,'送儿童、米卡米卡、芝士蛋糕、热门蛋糕、今日达、全部','乖乖熊','017.jpg',448,'16寸','圆形','0-22℃保存1天、4小时内20℃食用为佳','鸡蛋、奶油、小麦粉、芒果、草莓、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','0.4小时','送老人',27,'2019-12-11',6,9,'','','',16);
INSERT INTO cake_details VALUES(65,'送恋人朋友蛋糕、Bon CAKE、抹茶蛋糕、今日达、全部','热火朝天','025.jpg',228,'8寸','方形','0-4℃保存1天、4小时内5℃食用为佳','鸡蛋、奶油、小麦粉、芒果、榴莲肉、巧克力、干酪','6-8个人','含10套餐具','赠送巧克力牌及贺卡','2小时','送老人',4805,'2018-11-22',8,6,'','','',17);
INSERT INTO cake_details VALUES(66,'送儿童、心之和、拿破仑蛋糕、热门蛋糕蛋糕、今日达、全部','热火朝天','025.jpg',288,'9寸','菱形','0-4℃保存2天、4小时内5℃食用为佳','鸡蛋、米拉、小麦粉、芒果、椰子、巧克力、干酪','9-12个人','含14套餐具','赠送心愿牌及贺卡','1小时','送儿童',302,'2020-11-19',1,8,'','','',17);
INSERT INTO cake_details VALUES(67,'送恋人朋友蛋糕、派悦坊、草莓夹心、热门蛋糕蛋糕蛋糕、今日达、全部','热火朝天','025.jpg',338,'10寸','方形','0-21℃保存1天、4小时内5℃食用为佳','鸡蛋、牛奶、小麦粉、芒果、榴莲肉、巧克力、干酪','9-12个人','含14套餐具','赠送巧克力牌及贺卡','3小时','送老人',443,'2018-11-15',5,12,'','','',17);
INSERT INTO cake_details VALUES(68,'送儿童、甘一客、水果蛋糕、热门蛋糕蛋糕蛋糕、今日达、全部','热火朝天','025.jpg',448,'16寸','心形','0-4℃保存1天、2小时内20℃食用为佳','鸡蛋、鲜奶、粗粮、芒果、榴莲肉、巧克力、干酪','20-25个人','含26套餐具','赠送巧克力牌及贺卡','0.5小时','送老人',27,'2018-11-19',2,2,'','','',17);

-- 蛋糕分类表
CREATE TABLE sort(
  sid INT,
  sname VARCHAR(8),
  pic VARCHAR(32)
);
-- 插入数据
INSERT INTO sort VALUES( 1,'鲜奶蛋糕','img/001.jpg');
INSERT INTO sort VALUES( 2,'水果蛋糕','img/006.jpg');
INSERT INTO sort VALUES( 3,'巧克力蛋糕','img/019.jpg');
INSERT INTO sort VALUES( 4,'慕斯蛋糕','img/062.jpg');
INSERT INTO sort VALUES( 5,'冰淇淋蛋糕','img/071.jpg');
INSERT INTO sort VALUES( 6,'抹茶蛋糕','img/065.jpg');
INSERT INTO sort VALUES( 7,'提苏米拉蛋糕','img/064.jpg');
INSERT INTO sort VALUES( 8,'拿破仑蛋糕','img/036.jpg');
INSERT INTO sort VALUES( 9,'芝士蛋糕','img/035.jpg');
INSERT INTO sort VALUES( 10,'咖啡蛋糕','img/041.jpg');
INSERT INTO sort VALUES( 11,'无糖蛋糕','img/030.jpg');
INSERT INTO sort VALUES( 12,'草莓夹心','img/050.jpg');

-- 创建一个蛋糕品牌的列表
CREATE TABLE brand_message(
  bid INT PRIMARY KEY AUTO_INCREMENT NULL,
  bname VARCHAR (16),
  pic VARCHAR(128)
);
-- 插入品牌数据
INSERT INTO brand_message VALUES(1,'心之和','xinzhihe.png');
INSERT INTO brand_message VALUES(2,'甘一客','logo.png');
INSERT INTO brand_message VALUES(3,'cakeboss','cakeboss.png');
INSERT INTO brand_message VALUES(4,'幸福西饼','xingfu1.jpg');
INSERT INTO brand_message VALUES(5,'派悦坊','pantry.png');
INSERT INTO brand_message VALUES(6,'米卡米卡','micamika.jpg');
INSERT INTO brand_message VALUES(7,'窝夫小子','waffleboy.jpg');
INSERT INTO brand_message VALUES(8,'Bon CAKE','boncake.png');
INSERT INTO brand_message VALUES(9,'诺心','lecake.jpg');
INSERT INTO brand_message VALUES(10,'M CAKE','mcake.jpg');

-- 创建订单表
CREATE TABLE orders(
  orders_id INT PRIMARY KEY Auto_increment,
  orders_date DATE,
  orders_time TIME,
  orders_site VARCHAR(64),
  orders_name VARCHAR(32),
  orders_phone VARCHAR(11)
);
-- 插入数据
INSERT INTO orders VALUES(NULL,'','','','','');


-- 创建一个保存用户留言的表
CREATE TABLE user_message(
uname VARCHAR(16) ,
messagetime VARCHAR(16) ,
content VARCHAR(300)
);
-- 插入留言
INSERT INTO user_message VALUES('Tom','2020-10-10','很美观、很好吃，超值赞');
INSERT INTO user_message VALUES('Rose','2020-09-10','送给女朋友的，大爱');
INSERT INTO user_message VALUES('Lick','2020-09-15','给姥爷的祝寿蛋糕，惊艳全场');
INSERT INTO user_message VALUES('bajie','2020-10-11','给儿子买的，儿子想了好久了，很喜欢');
INSERT INTO user_message VALUES('wukong','2020-10-12','送给男朋友的生日蛋糕，很甜蜜、温馨。超赞！');
INSERT INTO user_message VALUES('wujing','2020-10-12','老顾客了，每周都来，老牌子，没毛病');
INSERT INTO user_message VALUES('xiaohei','2020-10-15','蛋糕色香味俱全，赞老牌子');
-- 购物车表
CREATE TABLE cakes(
  cid INT PRIMARY KEY Auto_increment,
  cname VARCHAR(32),
  pic VARCHAR(128),
  price DECIMAL(4,1),
  size TINYINT,
  shape VARCHAR(32),
  kinds VARCHAR(32),
  PD VARCHAR(32),
  count INT,
  checked BOOL
);

INSERT INTO cakes VALUES(NULL,'蝶恋花景','001.jpg','58.5','8寸','圆形','鲜奶','2020-11-07',1,0);
INSERT INTO cakes VALUES(NULL,'清风徐来','002.jpg','67.8','10寸','圆形','慕斯','2020-11-07',1,0);
INSERT INTO cakes VALUES(NULL,'心之恋情','003.jpg','48.8','6寸','半圆形','草莓','2020-11-07',1,0);
INSERT INTO cakes VALUES(NULL,'甜蜜如心','004.jpg','73.2','8寸','圆形','巧克力','2020-11-07',1,0);
INSERT INTO cakes VALUES(NULL,'情有独钟','007.jpg','45.8','4寸','三角形','牛奶','2020-11-07',1,0);
