<template>
  <div class="cakelist">
    <!-- 顶部导航栏开始 -->
    <mt-header title="热门蛋糕" fixed class="myHeader">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <div slot="right">北京东城区</div>
    </mt-header>
    <!-- 顶部导航栏结束 -->
    <!-- 顶部选项卡开始 -->
    <mt-navbar v-model="active" fixed>
      <mt-tab-item id="complete">综合</mt-tab-item>
      <mt-tab-item id="sales">销量</mt-tab-item>
      <mt-tab-item id="price">价格<img src="../assets/icon/价格.png" alt=""></mt-tab-item>
      <mt-tab-item id="nice">最新</mt-tab-item>
    </mt-navbar>
    <!-- 顶部选项卡结束 -->
    <!-- 面板内容开始 -->
    <mt-tab-container class="main" v-infinite-scroll="loadMore" infinite-scroll-distance="10" infinite-scroll-disabled="loading" infinite-scroll-immediate-check="true">
      <mt-tab-container-item>
        <ul v-for="(item, index) in 20" :key="index">
          <li><img src="../assets/img/042.jpg"></li>
          <li>四重奏蛋糕(约2磅)</li>
          <li>幸福西饼蛋糕 | 最快3小时送达</li>
          <li>￥228</li>
        </ul>
      </mt-tab-container-item>
    </mt-tab-container>
    <!-- 面板内容结束 -->
    <!-- 回到顶部开始 -->
    <div class="backTop" v-show="page>1"><a href="#"><img src="../assets/icon/回到顶部.png" alt=""></a></div>
    <!-- 回到顶部结束 -->
  </div>
</template>
<style>
  /* 顶部导航栏的背景色和下边框 */
  .cakelist .mint-header{background-color: #f6f6f6;color: #000;border-bottom:1px solid #d8d8d8;}
  /* 顶部选项卡的样式 */
  .cakelist .mint-navbar{background-color: #f6f6f6;margin-top: 40px;}
  .cakelist .mint-navbar .mint-tab-item.is-selected{color: #ff6700;border-bottom: none;}
  /* 面板的样式 */
  .cakelist .main{margin-top: 88px;background-color: #f6f6f6;}
  .cakelist .main ul{width: 49%; background-color: #fff;margin-bottom: 4px;padding: 10px;box-sizing: border-box;float: left;}
  .cakelist .main ul:nth-child(odd){margin-right: 4px;}
  .cakelist .main ul img{width: 100%;margin-bottom: 8px;}
  .cakelist .main ul li{font-size: 12px;color: #000;line-height: 20px;}
  .cakelist .main ul li:nth-child(3){color: #666;}
  /* 回到顶部的样式 */
  .cakelist .backTop{position: fixed;top:89%;left: 80%;z-index: 99;}
</style>
<script>
export default {
  data() {
    return {
      active:"complete",
      page:1,
      loading:false,
      cakelist:[],
      pagecount:1,
    }
  },
  methods: {
    // 封装axios请求list接口的代码
    loadList(active,page){
      this.indicator.open();
      this.loading=true;
      this.axios.get('/list?cid='+active+'&page='+page).then(res=>{
        this.cakelist=res.data.results;
        this.pagecount=res.data.pagecount;
        this.indicator.close();
        this.loading=false;
      });
    },
    // 页面无限滚动时调用的函数loadMore
    loadMore(){
      // 每滚动一次页码加1
      this.page++;
      if(this.page<=this.pagecount){
        this.loadList(this.active,this.page);
      }
    }
  },
  watch: {
    // 监听顶部选项卡active变化，面板数据随之发生变化
    active(value){
      this.cakelist=[];
      this.loadList(value,this.page);
    }
  },
  // 在页面初始化加载时发送请求获取页面数据
  mounted() {
    this.loadList(this.active,this.page);
  }, 
}
</script>