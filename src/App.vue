<template>
  <div id="app">
<<<<<<< HEAD
    <router-view/>
  </div>
</template>
<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
}
=======
    <!-- <div id="nav">
      <router-link to="/">Home</router-link> |
      <router-link to="/about">About</router-link>
    </div>
    <router-view/> -->
    <!-- <Cakeindex></Cakeindex> -->
    <router-view/>
      <mt-tabbar v-model="selected" fixed>
      <mt-tab-item id="index">首页
        <img
          src="./assets/image/index_enabled.png"
          v-if="selected == 'index'"
          slot="icon"
        />
        <img src="./assets/image/index_disabled.png" v-else slot="icon" />
      </mt-tab-item>
      <mt-tab-item id="sort">分类
         <img
          src="./assets/image/sort_enabled.png"
          v-if="selected == 'sort'"
          slot="icon"
        />
        <img src="./assets/image/sort_disabled.png" v-else slot="icon" />
      </mt-tab-item>
      <mt-tab-item id="cart">购物车
        <img
          src="./assets/image/cart_enabled.png"
          v-if="selected == 'cart'"
          slot="icon"
        />
        <img src="./assets/image/cart_disabled.png" v-else slot="icon" />
      </mt-tab-item>
      <mt-tab-item id="me">我的
         <img
          src="./assets/image/me_enabled.png"
          v-if="selected == 'me'"
          slot="icon"
        />
        <img src="./assets/image/me_disabled.png" v-else slot="icon" />
      </mt-tab-item>
    </mt-tabbar>
  </div>
</template>
<script>
  export default{
    data(){
      return {
        selected: "index"
      }
    },
    watch:{
      selected(newV){
        if(newV=='sort'){
          this.$router.push('/cakesort')
        }else if(newV=='cart'){
          this.$router.push('/cakecart')
        }else if(newV=='me'){
          this.$router.push('/mine')
        }else{
          this.$router.push('/cakeindex')
        }
      }
    }
  }
</script>
<style>
#app {
  text-align: center;
  color: #2c3e50;
}
body{
  margin: 0;
  padding: 0;
}
.mint-tab-item-icon img{
  width: 24px;
  height: 24px;
}
>>>>>>> d13900916c285b685f87ceda9e03058087538ffa
</style>
