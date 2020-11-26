<template>
  <div class="found">
    <div>
      <!-- 顶部搜索栏开始 -->
      <router-link to="/" class="index">
        <mt-button icon="back"></mt-button>
      </router-link>
      <mt-field type="text" placeholder="搜索你喜欢的蛋糕" v-model="value" class="mysearch" @keyup.native="kwsearch"></mt-field>
    </div>
    <div>
      <p>没有找到符合条件的商品</p>
      <router-link to="/cakelist/全部">
        <mt-button>查看全部</mt-button>
      </router-link>
    </div>
  </div>
</template>
<style>
  .found{font-size: 12px;}
  .found>div:first-child{height: 42px; border-bottom:1px solid #e4e4e4;}
  .found>div:first-child::before{content: "";display: table;}
  /* 返回首页链接的样式 */
  .found>div .index{display:block; width: 15%;float: left;}
  .found>div .index .mint-button--default{background-color: #fff;box-shadow: none;color: #000;}
  /* 搜素框的样式 */
  .found .mysearch{width: 80%;height: 30px;margin-top: 5px;border-radius: 4px;}
  .found .mysearch.mint-cell{min-height: 30px;background-color: #e4e4e4;}
  .found .mint-cell-wrapper{font-size: 12px;background:url("../assets/icon/search2.png") no-repeat 5% 50%;padding: 0 10px 0 35px;}
  .found input{background-color: #e4e4e4;}
  /* 内容部分的样式 */
  .found>div:last-child{background-color: #e4e4e4;padding: 50px 0 521px;text-align: center;}
  .found>div:last-child p{margin-bottom: 20px;}

</style>
<script>
export default {
  data() {
    return {
      value:"",
    }
  },
  methods: {
    // 按回车键进行关键字搜素
    kwsearch(event){
      if(event.keyCode==13){
        // 获取输入的关键字
        let value=this.value;
        // 向数据库发送请求
        this.axios.get("/search?kw="+value).then(res=>{
          let data=res.data.results;
          // 判断，成功跳转到list页面
          if(data.length>0){
            this.$router.push({path: '/cakelist/'+value});
          }
        });
      }
    }
  },
}
</script>