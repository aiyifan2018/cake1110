<template>
  <div>   
    <div class="backtop">
      <router-link to="/Setup" class="routerLink">
        <img src="../../public/img/icons/setup.png" alt="">
      </router-link><br>
      <router-link to="/setup" v-if="this.$store.state.isLogined==1">
        <mt-button type="danger"  class="relogin">欢迎,{{this.$store.state.userInfo[0].uname}}</mt-button>
      </router-link>
      <router-link to="/register" v-else>
        <mt-button type="danger"  class="relogin">登录/注册</mt-button>
      </router-link>
    </div>
    <div class="ordermain">
      <div class="orders" >
        我的订单
        <router-link to="/" class="order">
          全部订单>
        </router-link>
        <hr class="hrs" />
      </div>
      <ul class="payment">
        <li>
          <router-link to="/">
            <img src="../../public/img/icons/paid.png">
            <p>待付款</p> 
          </router-link>          
        </li>
        <li>
          <router-link to="/">
            <img src="../../public/img/icons/delivered.png">
            <p>今日配送</p> 
          </router-link>          
        </li>
        <li>
          <router-link to="/">
            <img src="../../public/img/icons/evaluated.png">
            <p>待评价</p>  
          </router-link>
          
        </li>
      </ul>
    </div>
      
  
    <ul class="about">
      <li>
        <router-link to="/login">
          <img src="../../public/img/icons/coupon.png">
          优惠劵
        </router-link>
      </li>
      <li>
        <router-link to="/login">
          <img src="../../public/img/icons/address.png">
          收货地址
        </router-link>
      </li>
       <li>
        <router-link to="/login">
          <img src="../../public/img/icons/customer.png">
          联系客服
        </router-link>
      </li>
      <li>
        <router-link to="/login">
          <img src="../../public/img/icons/problem.png">
          常见问题
        </router-link>
      </li>
      <li>
        <router-link to="/login">
          <img src="../../public/img/icons/about.png">
          关于我们
        </router-link>
      </li>
    </ul>
  </div>
</template>
<style scoped>
a{
  text-decoration: none;
  color: #000 !important;
}
.hrs{
  
 border: 0.0.5px solid #000;
  margin-top: 20px;
}
  .backtop{
    background: url(../../public/img/background.svg);
    height: 125px;
  }
  .ordermain{
    background-color:#fff;
    width: 95%;
     margin: auto;
    margin-top: -20px;
   box-shadow: 0px 0px 10px #ccc;
     
  }
  .routerLink{
    margin-top: 10px;
    margin-right: 10px;
    float: right;
  }
  .relogin{
    display: block;
    margin: 30px auto;
    text-align: center;
    padding: 5px 20px;
  }
  .about{
    margin-top: 20px;
  }
  .about>li{
    padding: 10px 20px;
    color: #000 !important;
  }
  .orders{
    /* border-bottom: 1px solid #666; */
    padding: 10px 15px;
     
    
     
  }
  
  .order{
    float: right;
    text-decoration: none;
    color: #000;
  }
   
  ul>li{  
    list-style: none;
    
  }
  .payment{
    display: flex;
    justify-content: space-around;
    align-items: center;
    height: 100px;
    margin-top: -20px;
  }
  .payment>li{
    text-align: center;
    margin-left: 100px;
  }
  
  .payment>li{
    float: left;
    margin: 0 25px;
  }
  .about>li>a{
    
    list-style: none;
    text-decoration: none;
  }
  
</style>
<script>
export default {
  data(){
    return {

    }
  },
  methods:{
    
  }
}
</script>