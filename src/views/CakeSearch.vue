<template>
  <div class="cakesearch">
    <div>
      <!-- 顶部搜索栏开始 -->
      <router-link to="/" class="index">
        <mt-button icon="back"></mt-button>
      </router-link>
      <mt-field type="text" placeholder="搜索你喜欢的蛋糕" v-model="value" class="mysearch" @keyup.native="kwsearch"></mt-field>
    </div>
    <!-- 顶部搜索栏结束 -->
    <!-- 历史搜索部分开始 -->
    <div class="searchItem" v-show="values.length>=1">
      <p>历史搜索</p>
      <router-link to="/cakelist" v-for="(item, index) in values" :key="index">{{item}}</router-link>
    </div>
    <!-- 历史搜索部分结束 -->
    <!-- 热门搜索开始 -->
    <div class="searchItem">
      <p>热门搜索</p>
      <router-link to="/cakelist/鲜奶蛋糕">鲜奶蛋糕</router-link>
      <router-link to="/cakelist/水果蛋糕">水果蛋糕</router-link>
      <router-link to="/cakelist/慕斯蛋糕">慕斯蛋糕</router-link>
      <router-link to="/cakelist/冰淇淋蛋糕">冰淇淋蛋糕</router-link>
    </div>
    <!-- 热门搜素结束 -->
  </div>
</template>
<style>
  .cakesearch{font-size: 12px;}
  .cakesearch>div:first-child{height: 42px; border-bottom:1px solid #e4e4e4;}
  .cakesearch>div:first-child::before{content: "";display: table;}
  /* 返回首页链接的样式 */
  .cakesearch>div .index{display:block; width: 15%;float: left;}
  .cakesearch>div .index .mint-button--default{background-color: #fff;box-shadow: none;color: #000;}
  /* 搜素框的样式 */
  .cakesearch .mysearch{width: 80%;height: 30px;margin-top: 5px;border-radius: 4px;}
  .cakesearch .mysearch.mint-cell{min-height: 30px;background-color: #e4e4e4;}
  .cakesearch .mint-cell-wrapper{font-size: 12px;background:url("../assets/icon/search2.png") no-repeat 5% 50%;padding: 0 10px 0 35px;}
  .cakesearch input{background-color: #e4e4e4;}
  /* 搜索项目的样式 */
  .cakesearch .searchItem{padding: 30px 0 0 10px;}
  .cakesearch .searchItem>p{margin-bottom: 16px;font-size: 14px;}
  .cakesearch .searchItem>a{display: inline-block;padding: 8px;border: 1px solid #e4e4e4;color: #000;background-color: #e4e4e4;margin-right: 16px;}

</style>
<script>
export default {
  data() {
    return {
      value:'',
      values:[],
    }
  },
  methods: {
    // 按回车键进行关键字搜素
    kwsearch(event){
      if(event.keyCode==13){
        // 获取输入的关键字
        let value=this.value.trim();
        if(value.length>0){
          // 向数据库发送请求
          this.axios.get("/search?kw="+value).then(res=>{
            let data=res.data.results;
            // 判断，成功跳转到成功页面
            if(data.length>0){
              this.$router.push({path: '/cakelist/'+value});
            }else{
              this.$router.push({path:'/cakenofound/'+value});
            }
          });
          // 将输入的关键字放到历史搜索栏里
          this.values.push(value);
        }else{
          this.value="全部";
          this.$router.push({path: '/cakelist/'+this.value});
        }
      }
    }
  },
}
</script>