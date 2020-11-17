<template>
  <div class="cakesort">
    <!-- 顶部导航栏开始 -->
    <mt-header fixed class="myHeader">
      <div slot="left">北京东城区</div>
      <router-link to="/cakesearch" slot="right">
        <mt-button class="mysearch"><img src="../assets/icon/搜索.png" slot="icon">搜素你喜欢的蛋糕</mt-button>
      </router-link>
    </mt-header>
    <!-- 顶部导航栏结束 -->
    <!-- 面板开始 -->
    <mt-tab-container class="brand">
      <mt-tab-container-item>
        <ul>
          <li><span></span>品牌<span></span></li>
          <li>
            <router-link to="/cakelist" v-for="(item, index) in 11" :key="index">
              <img src="../assets/img/100.jpg" alt="">
            </router-link>
          </li> 
        </ul>
        <ul>
          <li><span></span>人群<span></span></li>
          <li>
            <router-link to="/cakelist" v-for="(item, index) in 3" :key="index">
              <img src="../assets/img/012.jpg" alt="">
              <p>送恋人朋友</p>
            </router-link>
          </li> 
        </ul>
        <ul>
          <li><span></span>口味<span></span></li>
          <li>
            <router-link to="/cakelist" v-for="(item, index) in 12" :key="index">
              <img src="../assets/img/017.jpg" alt="">
              <p>鲜奶口味</p>
            </router-link>
          </li> 
        </ul>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- 面板结束 -->
    <!-- 底部选项卡开始 -->
    <mt-tabbar fixed class="myTabbar" v-model="select">
      <mt-tab-item id="index">
        <img src="../assets/icon/index2.png" slot="icon" v-if="select=='index'">
        <img src="../assets/icon/index1.png" slot="icon" v-else>
        <router-link to="/">首页</router-link>
      </mt-tab-item>
      <mt-tab-item id="sort">
        <img src="../assets/icon/sort2.png" slot="icon" v-if="select=='sort'">
        <img src="../assets/icon/sort1.png" slot="icon" v-else>
        <router-link to="/cakesort">分类</router-link>
      </mt-tab-item>
      <mt-tab-item id="shopping">
        <img src="../assets/icon/shopping2.png" slot="icon" v-if="select=='shopping'">
        <img src="../assets/icon/shopping1.png" slot="icon" v-else>
        <router-link to="/">购物车</router-link>
      </mt-tab-item>
      <mt-tab-item id="me">
        <img src="../assets/icon/me2.png" slot="icon" v-if="select=='me'">
        <img src="../assets/icon/me1.png" slot="icon" v-else>
        <router-link to="/">我的</router-link>
      </mt-tab-item>
    </mt-tabbar>
    <!-- 底部选项卡结束 -->
  </div>
</template>
<style>
  /* 分类页面的主体颜色 */
  .cakesort{background-color: #e4e4e4;font-size: 12px;}
  /* 头部导航栏的样式 */
  .cakesort .myHeader{background-color: #fff;color: #000;font-size: 12px;}
  .cakesort .myHeader .mysearch{border: 1px solid #d9d9d9;border-radius: 4px;width:90%;height: 30px;padding-left: 10px;margin-right: 10px;background-color: #e4e4e4;}
  .cakesort .myHeader .mysearch label{margin: 0 140px 0 6px;}
  /* 面板的样式 */
  .cakesort .brand{padding: 60px 20px 20px;margin:0 auto;color: #000;}
  .cakesort .brand ul{background-color:#fff;border: 1px solid #fff;border-radius: 20px;padding: 10px;margin-bottom: 20px;}
  .cakesort .brand ul span{display: inline-block; width: 50px;border: 1px solid #d9d9d9;margin: 0 10px 3px;}
  .cakesort .brand ul li:first-child{margin: 10px 0 0;text-align: center;font-size: 16px;}
  .cakesort .brand ul li a{display: inline-block; width: 33.3%;margin: 10px 0;text-align: center;color: #333;}
  .cakesort .brand ul li img{width:100%;border-radius: 50%;}
  /* 顶部选项卡的样式 */
  .cakesort .mint-tabbar{background-color: #eaeaea;}
  .cakesort .myTabbar a{color: #8a8a8a;}
  .cakesort .mint-tabbar>.mint-tab-item.is-selected a{color: #ff6700;}
</style>
<script>
export default {
  data() {
    return {
      select:'sort',
    }
  },
  mounted() {
    
  },
}
</script>