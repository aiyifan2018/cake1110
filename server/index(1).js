// 加载Express模块
const express = require('express');

//加载MD5模块
const md5 = require('md5');

// 加载CORS模块
const cors = require('cors');

// 加载body-parser模块
const bodyParser = require('body-parser');

// 加载MySQL模块
const mysql = require('mysql');

// 创建MySQL连接池
const pool = mysql.createPool({
  // 数据库服务器的地址
  host: '127.0.0.1',
  // 数据库服务器的端口号
  port: 3306,
  // 数据库用户的用户名
  user: 'root',
  // 数据库用户的密码
  password: '',
  // 数据库名称
  database: 'cake',
  // 编码方式
  charset: 'utf8',
  // 最大连接数
  connectionLimit: 20
});

// 创建WEB服务器实例
const server = express();

// 将CORS作为Server的中间件
server.use(cors({
  origin: ['http://localhost:8080', 'http://127.0.0.1:8080']
}));

//将bodyParser作为Server的中间件
server.use(bodyParser.urlencoded({
  extended: false
}));

// 模糊查询信息
server.get('/search',(req,res)=>{
  // 接受参数
  let kw=req.query.kw;
  // let sql="SELECT * FROM cake_details INNER JOIN sort ON sort_id=sid WHERE sname like ?";
  let sql="select * from cake_details INNERN JOIN brand_message ON brand_id=bid WHERE title LIKE ?";
  // if(kw==){}
  pool.query(sql,['%'+kw+'%'],(error,results)=>{
    if(error) throw error;
    res.send({code:1,results:results});
  });
});
// 模糊查询并按选项卡的值查询所有
server.get('/sales',(req,res)=>{
  let kw=req.query.kw;
  let s=req.query.s;
  let sql="select * from cake_details INNERN JOIN brand_message ON brand_id=bid WHERE title LIKE ? ORDER BY ? DESC";
  pool.query(sql,['%'+kw+'%',s],(error,results)=>{
    if(error) throw error;
    res.send({code:1,results:results});
  });
});
// 获取品牌
server.get('/brand',(req,res)=>{
  let sql='SELECT bid,bname,pic FROM brand_message';
  pool.query(sql,(error,results)=>{
    if(error) throw error;
    res.send({code:1,results:results});
  });
});


// 获取蛋糕分类页详情的接口
server.get('/sort',(req,res)=>{
  let sql='SELECT sid,sname,pic FROM sort';
  pool.query(sql,(error,results)=>{
    if(error) throw error;
    res.send({message:'有此品牌',code:1,results:results});
  });
});

//获取轮播图
server.get('/banner', (req, res) => {
  let sql = 'SELECT baid,pic FROM banner';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results });
  });
});

// 获取蛋糕详细信息(包括标题,正文,作者等)
server.get('/details', (req, res) => {
  //SQL查询
  let sql = 'SELECT did,dname,mini_pic,price,size,shape,freshtime,ingredients,many_people,tableware,gift,arrival_time,applicable,sales_count,add_time,brand_id,bname FROM cake_details INNERN JOIN brand_message ON brand_id=bid';
  // 执行SQL查询
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({ message: '查询成功', code: 1, results: results });
  });
});

// 用户注册的接口
server.post('/register', (req, res) => {
  //console.log(md5('12345678')) ;
  //获取用户名和密码
  let uname = req.body.username;
  let upwd = req.body.password;
  //查找用户是否存在
  let sql = 'SELECT * FROM user WHERE username=?';
  pool.query(sql, [uname], (error, results) => {
    if (error) throw error;
    //如果用户不存在,则插入记录
    if (results[0].count == 0) {
      sql = 'INSERT INTO user(uname,upwd) VALUES(?,MD5(?))';
      pool.query(sql, [uname, upwd], (error, results) => {
        if (error) throw error;
        res.send({ message: '注册成功', code: 1 });
      })
    } else { //否则产生合理的错误提示
      res.send({ message: '用户已存在', code: 0 });
    }
  })
});


//用户登录的接口
server.post('/login', (req, res) => {
  //获取用户名和密码
  let uname = req.body.username;
  let upwd = req.body.password;
  //以用户名和密码为条件进行查找
  let sql = 'SELECT uname,upwd FROM user WHERE username=? AND password=MD5(?)';
  pool.query(sql, [uname, upwd], (error, results) => {
    if (error) throw error;
    if (results.length == 0) {
      res.send({ message: '登录失败', code: 0 });
    } else {
      res.send({ message: '登录成功', code: 1, userInfo: results[0] });
    }
  });

});
// 获取购物车
server.post("/cart",(req,res)=>{
  // 根据用户id查询数据
  let user = (userId) => {
    let sql = `SELECT user FROM uid;`
    
};
});
// 指定WEB服务器监听的端口
server.listen(3000);

