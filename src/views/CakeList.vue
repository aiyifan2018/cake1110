<template>
  <div class="cakelist">
    <!-- 顶部导航栏开始 -->
    <mt-header :title="kw" fixed class="myHeader">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
      <div slot="right">北京东城区</div>
    </mt-header>
    <!-- 顶部导航栏结束 -->
    <!-- 顶部选项卡开始 -->
    <mt-navbar v-model="activeUpdata" fixed>
      <mt-tab-item id="did">综合</mt-tab-item>
      <mt-tab-item id="sales_count">销量</mt-tab-item>
      <mt-tab-item id="price">价格<img src="../assets/icon/价格.png" alt=""></mt-tab-item>
      <mt-tab-item id="add_time">最新</mt-tab-item>
    </mt-navbar>
    <!-- 顶部选项卡结束 -->
    <!-- 面板内容开始 -->
    <mt-tab-container class="main" v-infinite-scroll="loadMore" infinite-scroll-distance="10" infinite-scroll-disabled="loading" infinite-scroll-immediate-check="true">
      <mt-tab-container-item v-if="render">
        <router-link to="`/cakeDetails/${item.did}`" v-for="(item, index) in cakelist" :key="index">
          <ul>
            <li><img :src="require('../assets/img/'+item.mini_pic)"></li>
            <li>{{item.dname}}(约2磅)</li>
            <li>{{item.bname}}蛋糕 | 最快{{item.arrival_time}}送达</li>
            <li>￥{{item.price}}</li>
          </ul>
        </router-link>        
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
  .cakelist .mint-tab-container-item{display: flex;flex-wrap: wrap;}
  .cakelist .main a{flex: 0 0 49%; background-color: #fff;margin-bottom: 4px;padding: 10px;box-sizing: border-box;}
  .cakelist .main a:nth-child(odd){margin-right: 4px;}
  .cakelist .main a img{width: 100%;margin-bottom: 8px;}
  .cakelist .main a li{font-size: 12px;color: #000;line-height: 20px;}
  .cakelist .main a li:nth-child(3){color: #666;}
  /* 回到顶部的样式 */
  .cakelist .backTop{position: fixed;top:89%;left: 80%;z-index: 99;}
</style>
<script>
export default {
  data() {
    return {
      kw:"",
      activeUpdata:"did",
      page:1,
      loading:false,
      // 接受服务器传的数据
      pagecount:1,
      cakelist:[],
      render: true 
    }
  },
  methods: {
    // 封装axios请求list接口的代码loadList()
    loadList(kw,activeUpdata){
      this.$indicator.open("加载中");
      this.loading=true;
       this.axios.get('/sales?kw='+kw+'&s='+activeUpdata).then(res=>{
        this.cakelist=res.data.results;
        this.pagecount=res.data.pagecount;
        this.$indicator.close();
        this.loading=false;
      });
    },
    // 页面无限滚动时调用的函数loadMore
    loadMore(){
     
    }
  },
  watch: {
    // 监听顶部选项卡active变化，面板数据随之发生变化
    activeUpdata(value){
      console.log(value)
      this.cakelist=[];
      this.render = false
      this.axios.get('/sales?kw='+this.kw+'&s='+value).then(res=>{
        this.cakelist=res.data.results;
        this.$nextTick(() => {
          this.render = true
          console.log("jiage",this.cakelist)
          console.log(this.render)
        })
      });
    },
  },
  // 在页面初始化加载时发送请求获取页面数据
  mounted() {
    // 获取地址栏中传过来的参数
    this.kw=`${this.$route.params.kw}`;
    console.log(this.kw);
    this.loadList(this.kw,this.activeUpdata);
  }, 
}
</script>