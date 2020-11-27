<template>
  <div class="cakeindex">
    <!-- 顶部选项卡开始 -->
    <mt-header title="美丽家蛋糕" fixed>
      <span slot="left">
         <van-cell is-link @click="showPopup" class="details_address">配送至{{province}} {{city}}  {{country}}</van-cell>
          <van-popup v-model="show" position="top" :style="{ height: '50%' }">
            <van-area :area-list="areaList" :columns-num="3" ref="myArea"
            @confirm="onConfirm" @cancel="onCancel"  @change="onChange" title="配送至"  />  
        </van-popup> 
      </span>
        <router-link to="/cakesearch" slot="right"><img src="../assets/sort/search.png" alt=""></router-link>
    </mt-header>
    <!-- 顶部选项卡结束 -->
    <!-- 轮播图部分开始 -->
    <mt-swipe :auto="2000" class="swipe">
      <mt-swipe-item v-for="(item, index) in bannerImage" :key="index">
        <img :src="require('../assets/img/'+item.pic)" alt="">
      </mt-swipe-item>
    </mt-swipe>
    <div class="list">
      <router-link to="/cakelist/热门蛋糕">热门蛋糕<img src="../assets/img/021.jpg" alt=""></router-link>
      <router-link to="/cakelist/今日达">当日达<img src="../assets/img/050.jpg" alt=""></router-link>
      <router-link to="/cakelist/全部">全部<img src="../assets/img/019.jpg" alt=""></router-link>
    </div>
    <!-- 轮播图部分结束 -->
    <!-- 品牌馆部分开始 -->
    <div class="brand">
      <h1>严选品牌馆</h1>
      <div>
        <router-link :to="`/cakelist/${item.bname}`" v-for="(item, index) in brand" :key="index">
          <img :src="require('../assets/brand/'+item.pic)" alt="">
        </router-link>
        <router-link to="/cakelist/蛋糕">全国蛋糕</router-link>
      </div>
    </div>
    <!-- 品牌馆部分结束 -->
    <!-- 送给爱的人部分开始 -->
    <div class="love">
      <h1>送给爱的人</h1>
      <div>
        <router-link to="/cakelist/送恋人朋友蛋糕"><img src="../assets/img/004.jpg" alt="">送恋人朋友</router-link>
        <router-link to="/cakelist/送老人"><img src="../assets/img/5013003.jpg" alt="">长辈祝福</router-link>
        <router-link to="/cakelist/送儿童"><img src="../assets/img/5012002.jpg_220x240.jpg" alt="">送小朋友</router-link>
      </div>
    </div>
    <!-- 送给爱的人部分结束 -->
    <!-- 口味部分开始 -->
    <div class="flavor">
      <h1>口味随心挑 <router-link to="/cakesort">更多<i class="iconfont icon-xiangyou"></i></router-link></h1>
      <div>
        <router-link to="/cakelist/鲜奶蛋糕">
          <p>鲜奶蛋糕</p>
          <span>浓香奶味</span>
        </router-link>
        <router-link to="/cakelist/水果蛋糕">
          <p>水果蛋糕</p>
          <span>新鲜现切</span>             
        </router-link>
        <router-link to="/cakelist/慕斯蛋糕">
          <p>慕斯蛋糕</p>
          <span>细腻口感</span>              
        </router-link>
        <router-link to="/cakelist/巧克力蛋糕">
          <p>巧克力蛋糕</p>
          <span>纵享丝滑</span>
        </router-link>
      </div>    
    </div>
    <!-- 口味部分结束 -->
    <!-- 热销推荐蛋糕开始 -->
    <div class="recommend">
      <h1>热销推荐蛋糕</h1>
      <div>
        <router-link :to="`/cakeDetails/${item.did}`" v-for="(item, index) in cakedetails" :key="index">
          <ul>
            <li><img :src="require('../assets/img/'+item.mini_pic)"></li>
            <li>{{item.dname}}</li>
            <li>{{item.bname}}蛋糕 | 最快{{item.arrival_time}}送达</li>
            <li>￥{{item.price}}</li>
          </ul>
        </router-link>
      </div>
      <router-link to="/cakelist/全部">查看全部蛋糕<i class="iconfont icon-xiangyou"></i></router-link>
    </div>
    <!-- 热销推荐蛋糕结束 -->
    <!-- 回到顶部开始 -->
    <div class="backTop" v-show="page>1"><a href="#"><img src="../assets/icon/回到顶部.png" alt=""></a></div>
    <!-- 回到顶部结束 -->
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
        <router-link to="/shoppingcart/1">购物车</router-link>
      </mt-tab-item>
      <mt-tab-item id="mine">
        <img src="../assets/icon/me2.png" slot="icon" v-if="select=='me'">
        <img src="../assets/icon/me1.png" slot="icon" v-else>
        <router-link to="/mine">我的</router-link>
      </mt-tab-item>
    </mt-tabbar>
    <!-- 底部选项卡结束 -->
  </div>
</template>
<style>
    .cakeindex,.cakeindex a{color: #000;}
    /* 顶部选项卡样式 */
    .cakeindex .mint-header{background-color: #fff;color: #ff6700;font-size: 26px;}
    .cakeindex .mint-header span{font-size: 14px;color: #000;}
    /* 轮播图的样式 */
    .cakeindex .swipe{ width: 100%; height: 300px;margin-top: 40px;}
    .cakeindex .swipe img{width: 100%;}
    /* 热门蛋糕等的样式 */
    .cakeindex .list{padding: 20px;text-align: center;border-bottom: 4px solid #d0d3da;display: flex;}
    .cakeindex .list a{background-color: #ffe7e8;padding: 10px 5px 5px;box-sizing: border-box;flex: 0 0 32%;}
    .cakeindex .list a:first-child{background-color: #fde3b5;}
    .cakeindex .list a:last-child{background-color: #d7e7f7;}
    .cakeindex .list a+a{margin-left: 6px;}
    .cakeindex .list img{width: 80%;margin-top: 10px;}
    /* 品牌馆样式 */
    .cakeindex .brand{width: 100%;padding: 20px 0 20px 20px;box-sizing: border-box;font-size: 22px;}
    .cakeindex .brand>div{display: flex;margin-top: 20px;overflow: hidden;}
    .cakeindex .brand>div a{padding: 10px 5px;background-color: #eceeed;margin-right: 8px;flex: 0 0 31%;text-align: center;box-sizing: border-box;}
    .cakeindex .brand img{width: 80%;}
    /* 送给爱的人的部分的样式 */
    .cakeindex .love{padding: 30px 14px 20px 20px;font-size: 14px;}
    .cakeindex .love>h1{font-size: 22px;}
    .cakeindex .love>div{display: flex;margin-top: 20px;}
    .cakeindex .love>div>a{flex: 0 0 31%;text-align: center;margin-left: 8px;}
    .cakeindex .love img{width: 100%;}
    /* 口味部分的样式 */
    .cakeindex .flavor{font-size: 14px;padding: 20px;border-bottom: 4px solid #d0d3da;}
    .cakeindex .flavor h1{font-size: 22px;}
    .cakeindex .flavor h1>a{font-size: 14px;margin-left: 52%;}
    .cakeindex .flavor>div{display: flex;margin-top: 20px;flex-wrap: wrap;}
    .cakeindex .flavor>div>a{flex:0 0 44%;background: #eceeed url("../assets/img/006.jpg") no-repeat 100% 50%;background-size: 40%;padding: 25px 0 25px 15px;margin-bottom: 10px;}
    .cakeindex .flavor>div>a:nth-child(2){background-color: #fde3b5;margin-left: 10px;}
    .cakeindex .flavor>div>a:nth-child(3){background-color: #ffe7e8;}
    .cakeindex .flavor>div>a:nth-child(4){background-color: #d7e7f7;margin-left: 10px;}
    .cakeindex .flavor a span{color: #666;margin-top: 10px;display: inline-block;font-size: 12px;}
    /* 热销推荐蛋糕部分样式 */
    .cakeindex .recommend h1{margin-left: 20px;}
    .cakeindex .recommend{font-size: 22px;margin: 20px 0 80px;}
    .cakeindex .recommend div{display: flex;flex-wrap: wrap;}
    .cakeindex .recommend div a{flex: 0 0 49%;display: inline-block; background-color: #fff;margin-bottom: 4px;padding: 10px;box-sizing: border-box;}
    .cakeindex .recommend div a:nth-child(odd){margin-right: 4px;}
    .cakeindex .recommend div a img{width: 100%;height: 100%; margin-bottom: 8px;}
    .cakeindex .recommend div a li{font-size: 12px;color: #000;line-height: 20px;}
    .cakeindex .recommend div a li:nth-child(3){color: #666;}
    /* 查看全部蛋糕连接的样式 */
    .cakeindex .recommend>a{display: block;width: 40%; border: 1px solid #000;padding: 8px 0;font-size: 14px;margin: 0 auto;text-align: center;}
    /* 回到顶部的样式 */
    .cakeindex .backTop{position: fixed;top:80%;left: 80%;z-index: 99;}
    /* 底部选项卡的样式 */
    .myTabbar .mint-tabbar{background-color: #eaeaea;}
    .myTabbar a{color: #8a8a8a;}
    .myTabbar.mint-tabbar>.mint-tab-item.is-selected a{color: #ff6700;}
</style>
<script>
import areaList from '../assets/area/area.js';
import { Toast } from 'vant';
export default {
  data() {
    return {
      show:false,
      	areaList,
				overlay: false,
				isShow:true,
      select:"index",
      page:2,
      cakedetails:[],
      brand:[],
      bannerImage:[],
      province:'', 
      city:'',
      country:''
				
    }
  },
  mounted() {
    // 发送获取蛋糕详情的请求
    this.axios.get('/details').then(res=>{
      this.cakedetails=res.data.results;
    });
    // 发送获取品牌的请求
    this.axios.get('/brand').then(res=>{
      this.brand=res.data.results;
    });
    // 发送请求获取轮播图
    this.axios.get('/banner').then(res=>{
      this.bannerImage=res.data.results;
    });
  },
  methods:{
  
			onCancel() {
                this.show = false;
                this.$refs.myArea.reset()
        },
			 onConfirm(val) {
                this.province= val[0].name,
                this.city=val[1].name,
                this.country=val[2].name;
                this.show = false;
             },
			onChange(picker) {
                let val = picker.getValues();
                return val;
      },
			 showPopup() {
         console.log("888")
          this.show = true;
          this.overlay = true;
      },
  }
}
</script>