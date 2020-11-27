// 加载Express模块
const express = require('express');

//加载MD5模块
const md5 = require('md5');
const qs = require('qs')
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

var http = require('http').createServer(server);
var io = require('socket.io')(http);
http.listen(3000, function () {
  console.log("9999999999")
});
// socket业务逻辑
io.on('connection', socket => {
  console.log("11111111111");
  socket.on('sendMessage', data => {
    console.log("22222");
    io.emit('reciveMessgae', data)
  })
  // 群发图片
  socket.on('sendImage', data => {
    console.log(data)
    io.emit('reciveImage', data)
  })
});
// 购物列表
server.get('/cake', (req, res) => {
  // let id=req.query.id;
  let sql = 'SELECT  * from cakes';
  pool.query(sql, (error, results) => {
    if (error) throw error;
    //console.log(results)
    if (results.length > 0) {
      res.send({
        message: '查询成功',
        code: 1,
        cakeInfo: results[0]
      });
    } else {
      res.send({
        message: '查询失败',
        code: 0
      });
    }
  })
});

//添加购物车
server.get('/addcart', (req, res) => {
  let id = req.query.id;
  console.log(req.query.id);
  id=parseInt(id)
  // let sql1 = "SELECT did,title,price,size,mini_pic from cake_details where did=?"
  let sql1 = "SELECT title,mini_pic,price,size,shape,ingredients,add_time FROM `cake_details` WHERE did =?"
  pool.query(sql1, [id], (error, results) => {
    if (error) throw error;
    if (results.length > 0) {
      console.log(results[0].count=1)
      console.log(results[0].checked=0)
      let sql = "insert into cakes set ?"
      console.log(results[0])
      pool.query(sql, [results[0]], (err, result) => {
        console.log(sql) 
        console.log("-----",result);
        // if (result.affectedRows > 0) {
        //   res.send({
        //     message: '添加成功',
        //     code: 1
        //   });
        // } else {
        //   res.send({
        //     message: '添加失败',
        //     code: 0
        //   });
        // }
      })
    }

  })
})

//获取蛋糕首页详情的接口
server.get('/index', (req, res) => {
  //获取首页分类表中的全部数据
  let sql = 'SELECT * FROM c_index';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({
      message: '查询成功',
      code: 1,
      results: results
    });
  });
});

// 获取蛋糕分类页详情的接口
server.get('/sort', (req, res) => {
  let sql = 'SELECT sname,pic FROM sort';
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({
      message: '有此品牌',
      code: 1,
      results: results
    });
  });
});

// 模糊查询信息
server.get('/search', (req, res) => {
  // 接受参数
  let kw = req.query.kw;
  // let sql="SELECT * FROM cake_details INNER JOIN sort ON sort_id=sid WHERE sname like ?";
  let sql = "select * from cake_details INNERN JOIN brand_message ON brand_id=bid WHERE title LIKE ?";
  pool.query(sql, ['%' + kw + '%'], (error, results) => {
    if (error) throw error;
    res.send({
      code: 1,
      results: results
    });
  });
});

// 模糊查询并按选项卡的值查询所有
server.get('/sales', (req, res) => {
  let kw = req.query.kw;
  let s = req.query.s;
  // console.log(kw, s)
  let cps = "%" + kw + "%";
  console.log(cps, s)
  let sql = `select * from cake_details INNERN JOIN brand_message ON brand_id=bid WHERE title LIKE '${cps}' ORDER BY ${s} DESC`;
  console.log(sql)
  // select * from cake_details INNERN JOIN brand_message ON brand_id=bid WHERE title LIKE '%全部%'  ORDER BY price  DESC
  pool.query(sql, (error, results) => {
    if (error) throw error;
    console.log(results)
    if (results.length > 0) {
      res.send({
        code: 1,
        results: results
      });
    } else {
      res.send({
        code: 0,
        msg: "查询失败"
      });
    }
  });
});

// 获取蛋糕品牌的接口
server.get('/brand', (req, res) => {
  let sql = 'SELECT bid,bname,pic FROM brand_message';
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({
      message: '有此品牌',
      code: 1,
      results: results
    });
  });
});

// 通过ID获取蛋糕详情的接口
server.get('/details', (req, res) => {
  //SQL查询
  let sql = 'SELECT did,dname,mini_pic,price,size,shape,freshtime,ingredients,many_people,tableware,gift,arrival_time,applicable,sales_count,add_time,brand_id,bname FROM cake_details INNERN JOIN brand_message ON brand_id=bid';
  // 执行SQL查询
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({
      message: '查询成功',
      code: 1,
      results: results
    });
  });
});


//获取轮播图
server.get('/banner', (req, res) => {
  //获取分类列表的全部数据
  let sql = 'SELECT baid,pic FROM banner';
  //通过连接池的query()方法来执行SQL语句
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({
      message: '查询成功',
      code: 1,
      results: results
    });
  });
});

// 获取蛋糕详细信息(包括标题,正文,作者等)
server.get('/cakeDetails', (req, res) => {
  let id = req.query.id;
  //SQL查询
  let sql = 'select add_time,applicable ,arrival_time,brand_id,did,dname,freshtime,gift,ingredients,many_people,mini_pic,price,sales_count,series_id,shape,size,sort_id,tableware,title,bname FROM cake_details INNER JOIN brand_message ON brand_message.bid = brand_id where did =?';
  // 执行SQL查询 
  pool.query(sql, [id], (error, results) => {
    if (error) throw error;
    //results代表的返回的结果集,为数组类型;同是在该数组中包含了一个
    //对象,该对象就是文章的详细信息,在使用时,无需返回数组可直接返回对象
    //所以results[0]代表的就是文章详细信息的对象
    //results此时的结果如 [{id:1,subject:'AA',nickname:'淘气的松鼠'}]
    res.send({
      message: '查询成功',
      code: 1,
      results: results
    });
  });
});

server.get('/cakeDetails_series', (req, res) => {
  let cid = req.query.cid;
  let sql = "SELECT * FROM cake_details WHERE series_id=?";
  pool.query(sql, [cid], (error, results) => {
    if (error) throw error;
    res.send({
      message: '查询成功',
      code: 1,
      results: results
    });
  })
});

// 用户注册的接口
server.post('/register', (req, res) => {
  //console.log(md5('12345678')) ;
  //获取用户名和密码
  let username = req.body.username;
  let password = req.body.password;
  //查找用户是否存在
  let sql = 'SELECT * FROM user WHERE uname= ?';
  pool.query(sql, [username], (error, result) => {
    console.log(result);
    if (error) throw error;
    //如果用户不存在,则插入记录
    if (result.length == 0) {
      sql = 'INSERT INTO user(uname,upwd) VALUES(?,MD5(?))';
      pool.query(sql, [username, password], (error, result) => {
        if (error) throw error;
        res.send({
          message: '注册成功',
          code: 1
        });
      })
    } else { //否则产生合理的错误提示
      res.send({
        message: '用户已存在',
        code: 0
      });
    }
  })
});


//用户登录的接口
server.post('/login', (req, res) => {
  //获取用户名和密码
  let username = req.body.username;
  let password = req.body.password;
  //以用户名和密码为条件进行查找
  let sql = 'SELECT uname,upwd FROM user WHERE uname=? AND upwd=MD5(?)';
  pool.query(sql, [username, password], (error, result) => {
    if (error) throw error;
    if (result.length == 0) {
      res.send({
        message: '登录失败',
        code: 0
      });
    } else {
      res.send({
        message: '登录成功',
        code: 1,
        userInfo: result
      });
    }
  });
});

// 搜索接口、
server.get('/input', (req, res) => {
  let sql = 'SELECT series,cake_details,sort,brand_message FROM *';
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({
      message: '查询成功',
      code: 1,
      results: results
    });
  });
});


server.get('/shopCake', (req, res) => {
  // let cid = req.query.cid;
  let sql = "SELECT * FROM cakes";
  pool.query(sql, (error, results) => {
    if (error) throw error;
    res.send({
      message: '查询成功',
      code: 1,
      results: results
    });
  })
});
// 指定WEB服务器监听的端口