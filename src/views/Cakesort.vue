<template>
  <div>
    <mt-header>
      <div slot="left">
        <select name="city" size="1" class="select">
          <option value="">请选择城市</option>
          <option value="">北京</option>
        </select>
      </div>
      <div id="search" slot="right">
        <router-link to="/search" class="shortcut">
          <!-- <mt-search placeholder="搜索你喜欢的蛋糕" readonly></mt-search> -->
          <input type="text" placeholder="搜索你喜欢的蛋糕" />
        </router-link>
      </div>
    </mt-header>
    <div id="container">
      <div id="brand">
        <h2 class="p">—— 品牌 ——</h2>
        <img src="" alt="" />
      </div>
      <div id="people">
        <h2 class="p">—— 人群 ——</h2>
        <div id="people-list">
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>送恋人朋友</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>送老人</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>送儿童</p>
          </div>
        </div>
      </div>
      <div id="flavour">
        <h2>—— 口味 ——</h2>
        <div id="flavour-list">
          <div>
            <img src="../assets/sort/5131001.jpg_220x240.jpg" alt="" />
            <p>鲜奶蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>水果蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>巧克力蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>慕斯蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>冰激凌蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>抹茶蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>提拉米苏蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>拿破仑蛋糕</p>
          </div>
          <div>
            <img src="../assets/sort/5901084.jpg_220x240.jpg" alt="" />
            <p>芝士蛋糕</p>
          </div>
        </div>
      </div>
    </div>
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
        <router-link to="/me">我的</router-link>
      </mt-tab-item>
    </mt-tabbar>
    <!-- 底部选项卡结束 -->
  </div>
</template>
<style scoped>
h2{
  margin:0;
  padding:10px 0;
  color:#333;
  font-weight:normal;
}
.shortcut {
  text-decoration: none;
}
.mint-header {
  padding: 0;
  color: #000;
  background-color: #fff;
}
.select {
  border: none;
}
#container {
  background-color: #ddd;
  padding: 5px 10px;
}
/* #search .mint-search {
  width: 240px;
  height: 40px;
  padding-bottom: 8px;
  margin-bottom: 20px;
}
div.mint-searchbar {
  background-color: #ff0;
} */
#search input {
  background: url(../assets/sort/search.png) no-repeat 1% center;
  padding: 8px 30px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
}
#brand,
#people,
#flavour {
  /* width:300px; */
  /* height:300px; */
  background-color: #fff;
  border-radius: 20px;
  padding-top: 10px;
  margin: 15px 0;
  font-size:14px;
}
#people-list,
#flavour-list {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
#people-list > div,
#flavour-list > div {
  padding: 0 10px;
}
#people-list > div > img,
#flavour-list > div > img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
}
.myTabbar .mint-tabbar{background-color: #eaeaea;}
.myTabbar a{color: #8a8a8a;}
.myTabbar.mint-tabbar>.mint-tab-item.is-selected a{color: #ff6700;}
</style>
<script>
export default {
  data() {
    return {
      task:'',
      select:"sort",
    }
  },
  methods: {
    add(){
      this.bus.$emit("add_task",this.task);
      this.task="";
    }
  },
}
</script>
