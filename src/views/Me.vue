<template>
  <div>   
    <div>
      <router-link to="/" class="routerLink">
        <img src="../../public/img/index_enabled.png" alt="">
      </router-link><br>
      <mt-button type="danger" size="small" class="relogin">登录/注册</mt-button>
    </div>
    <div>
      <div class="orders">
        我的订单
        <router-link to="/" class="order">
          全部订单>
        </router-link>
      </div>
      <ul class="payment">
        <li><img src="../../public/img/index_enabled.png" slot="icon">
          <p>待付款</p>
          
        </li>
        <li>
          <img src="../../public/img/index_enabled.png" slot="icon">
          <p>今日配送</p>         
        </li>
        <li>
          <img src="../../public/img/index_enabled.png" slot="icon">
          <p>待评价</p>
          
        </li>
      </ul>
    </div>
    <ul>
      <li class="about">
        <router-link to="/">
          <img src="../../public/img/index_enabled.png">
          优惠劵
        </router-link>
      </li>
      <li>
        <router-link to="/">
          <img src="../../public/img/index_enabled.png">
          收货地址
        </router-link>
      </li>
       <li>
        <router-link to="/">
          <img src="../../public/img/index_enabled.png">
          联系客服
        </router-link>
      </li>
      <li>
        <router-link to="/">
          <img src="../../public/img/index_enabled.png">
          常见问题
        </router-link>
      </li>
      <li>
        <router-link to="/">
          <img src="../../public/img/index_enabled.png">
          关于我们
        </router-link>
      </li>
    </ul>
  </div>
</template>
<style scoped>
  .routerLink{
    float: right;
  }
  .relogin{
    display: block;
    margin: 20px auto;
  }
  .orders{
    border-bottom: 1px solid #000;
    padding: 10px 5px;
  }
  .order{
    float: right;
    text-decoration: none;
    color: #000;
  }
  ul{
    
  }
  ul>li{  
    list-style: none;
  }
  .payment{
    display: flex;
  }
  .payment>li{
    float: left;
    margin: 0 25px;
  }
  .about>a{
    list-style: none;
  }
</style>