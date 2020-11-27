<template>
  <div>
    <mt-header>
      <div slot="left">
        <van-cell is-link @click="showPopup" class="details_address"><span v-if="!province">选择地址:</span>{{province}} {{city}}  {{country}}</van-cell>
          <van-popup v-model="show" position="top" :style="{ height: '50%' }">
            <van-area :area-list="areaList" :columns-num="3" ref="myArea"
            @confirm="onConfirm" @cancel="onCancel"  @change="onChange" title="配送至"  />  
        </van-popup>
      </div>
      <div id="search" slot="right">
        <router-link to="/cakesearch" class="shortcut">
          <input type="text" placeholder="搜索你喜欢的蛋糕" />
        </router-link>
      </div>
    </mt-header>
    <!-- 面板区域开始 -->
    <div id="container">
      <mt-tab-container>
        <mt-tab-container-item>
          <div id="brand">
            <h2 class="h2">—— 品牌 ——</h2>
            <div id="brand-list">
              <div
                v-for="(brand, index) of brand"
                :key="index"
                @click="brand_goto(brand.bname)"
              >
                <img :src="brand.pic" alt="" />
              </div>
              <router-link to="/cakelist/全部">
                <div class="all">查看全部</div>
              </router-link>
            </div>
          </div>
          <div id="people">
            <h2 class="h2">—— 人群 ——</h2>
            <div id="people-list">
              <div id="people-list-item">
                <router-link to="/cakelist/送恋人朋友">
                  <img src="../assets/img/004.jpg" alt="" />
                  <p>送恋人朋友</p>
                </router-link>
                <router-link to="/cakelist/送老人">
                  <img src="../assets/img/5013003.jpg" alt="" />
                  <p>送老人</p>
                </router-link>
                <router-link to="/cakelist/送儿童">
                  <img src="../assets/img/5012002.jpg_220x240.jpg" alt="" />
                  <p>送儿童</p>
                </router-link>
              </div>
            </div>
          </div>
          <div id="flavour">
            <h2 class="h2">—— 口味 ——</h2>
            <div id="flavour-list">
              <div
                v-for="(flavour, index) of flavour"
                :key="index"
                @click="flavour_goto(flavour.sname)"
              >
                <img :src="flavour.pic" alt="" />
                <p>{{ flavour.sname }}</p>
              </div>
            </div>
          </div>
        </mt-tab-container-item>
      </mt-tab-container>
    </div>
    <!-- 面板区域结束 -->
    <!-- 底部选项卡开始 -->
    <mt-tabbar fixed class="myTabbar" v-model="select">
      <mt-tab-item id="index">
        <img
          src="../assets/icon/index2.png"
          slot="icon"
          v-if="select == 'index'"
        />
        <img src="../assets/icon/index1.png" slot="icon" v-else />
        <router-link to="/">首页</router-link>
      </mt-tab-item>
      <mt-tab-item id="sort">
        <img
          src="../assets/icon/sort2.png"
          slot="icon"
          v-if="select == 'sort'"
        />
        <img src="../assets/icon/sort1.png" slot="icon" v-else />
        <router-link to="/cakesort">分类</router-link>
      </mt-tab-item>
      <mt-tab-item id="shopping">
        <img
          src="../assets/icon/shopping2.png"
          slot="icon"
          v-if="select == 'shopping'"
        />
        <img src="../assets/icon/shopping1.png" slot="icon" v-else />
        <router-link to="/shoppingcart">购物车</router-link>
      </mt-tab-item>
      <mt-tab-item id="me">
        <img src="../assets/icon/me2.png" slot="icon" v-if="select == 'me'" />
        <img src="../assets/icon/me1.png" slot="icon" v-else />
        <router-link to="/mine">我的</router-link>
      </mt-tab-item>
    </mt-tabbar>
    <!-- 底部选项卡结束 -->
  </div>
</template>
<style scoped>
.h2 {
  margin: 0;
  padding: 10px 0;
  color: #333;
  font-size: 24px;
  font-weight: normal;
  text-align: center;
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
.all{
  width:100px;
  height:40px;
  line-height:40px;
  color:#000;
  text-align:center;
  font-size:20px;
  border:1px dashed #ddd;
  border-radius:10px;
  padding:5px 0;
}
#container {
  background-color: #ddd;
  padding: 5px 10px;
}
#search input {
  background: url(../assets/sort/search.png) no-repeat 1% center;
  padding: 8px 30px;
  margin: 10px;
  border: 1px solid #ccc;
}
#brand,
#people,
#flavour {
  background-color: #fff;
  border-radius: 20px;
  padding-top: 10px;
  margin: 15px 0;
  font-size: 14px;
}
#brand-list,
#flavour-list {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
.brand {
  width: 80px;
  height: 80px;
  line-height: 80px;
  font-size: 18px;
  font-weight: bold;
  font-style: italic;
  padding: 0 10px;
}
#brand-list > div img {
  width: 100px;
  padding: 10px 0;
}
#people-list-item {
  display: flex;
  justify-content: space-around;
  flex-wrap: wrap;
}
#people-list-item img {
  width: 100px;
}
#people-list-item p {
  text-align: center;
  color: #000;
  padding-bottom: 10px;
}
#flavour-list > div {
  padding: 10px 10px;
  text-align: center;
}
#flavour-list > div > img {
  width: 80px;
  height: 80px;
  border-radius: 50%;
  padding: 10px 0;
}
#flavour {
  margin-bottom: 65px;
}
/* 底部选项卡的样式 */
.myTabbar .mint-tabbar {
  background-color: #eaeaea;
}
.myTabbar a {
  color: #8a8a8a;
}
.myTabbar .mint-tabbar > .mint-tab-item.is-selected a {
  color: #ff6700;
}
.details_address{
      font-size: 10px;
      color: #666;
      height: 40px;
      width: 97px;
    }
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
      select: "sort",
      brand: [],
      flavour: [],
      province:'', 
      city:'',
      country:''
    };
  },
  methods: {
    brand_goto(bname) {
      this.$router.push({ path: "/Cakelist/" + bname });
    },
    flavour_goto(sname) {
      this.$router.push({ path: "/Cakelist/" + sname });
    },
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
          this.show = true;
          console.log("--------",this.show);
          this.overlay = true;
      }
  },
  mounted() {
    this.axios.get("/brand").then((res) => {
      let data = res.data.results;
      data.forEach((item) => {
        if (item.pic != null) {
          item.pic = require("../assets/brand/" + item.pic);
        }
        this.brand.push(item);
        //  console.log(item);
      });
      this.brand = res.data.results;
      console.log(this.brand);
    });
    this.axios.get("/sort").then((res) => {
      let data = res.data.results;
      data.forEach((item) => {
        if (item.pic != null) {
          item.pic = require("../assets/" + item.pic);
        }
        console.log(item);
        this.flavour.push(item);
        console.log(this.flavour);
      });
      this.flavour = res.data.results;
      console.log(this.flavour);
    });
  },
};
</script>
