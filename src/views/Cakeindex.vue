<template>
<<<<<<< HEAD
    <div>
       <mt-tabbar>
           <mt-tab-item id="index">
               <router-link to="/">首页</router-link>
           </mt-tab-item>
           <mt-tab-item id="sort">
            <router-link to="/cakesort">分类</router-link>
            </mt-tab-item>
            <mt-tab-item id="shopping">
                <router-link to="/">购物车</router-link>
            </mt-tab-item>
            <mt-tab-item id="me">
                <router-link to="/">我的</router-link>
            </mt-tab-item>
        </mt-tabbar>
=======
  <div class="cakeIndex">
    <mt-header fixed title="蛋糕来了">
        <span slot="left" class="left">
            西安市雁塔区<img src="../assets/image/down.svg" alt="" srcset="">
        </span>
      <span class="search" slot="right">
          <img src="../assets/image/search.svg" >
      </span>
    </mt-header>
    <mt-swipe :auto="2000">
      <mt-swipe-item>
        <img src="../assets/image/lunbo1.jpg" />
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="../assets/image/lunbo2.jpg" />
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="../assets/image/lunbo3.jpg" />
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="../assets/image/lunbo4.jpg" />
      </mt-swipe-item>
      <mt-swipe-item>
        <img src="../assets/image/lunbo5.jpg" />
      </mt-swipe-item>
    </mt-swipe>
    <div class="indexSort">
        <div>
            <div>
                热门蛋糕
            </div>
            <img src="../assets/image/ad1.jpg" >
        </div>
        <div>
            <div>
                当日达
            </div>
            <img src="../assets/image/ad2.jpg" >
        </div>
        <div>
            <div>
                全部
            </div>
            <img src="../assets/image/ad3.jpg" >
        </div>
>>>>>>> d13900916c285b685f87ceda9e03058087538ffa
    </div>
    <div class="gap">  

    </div>

  </div>
</template>
<script>
  export default{
    data(){
      return {
        selected: "index"
      }
    }
  }
</script>
<style>
.cakeIndex .mint-header {
  background: #fff;
  color: #ca5c3a;
  font-size: 20px;
}
.cakeIndex .left{
    color: #666;
    font-size: 12px;
    position: relative;
}
.cakeIndex .left img{
    color: #666;
    width: 12px;
    height: 12px;
    position: absolute;
    top: 3px;
}
.cakeIndex .mint-swipe{
    height: 300px;
}
.cakeIndex .search img{
    width: 24px;
    height: 24px;
}
.cakeIndex .indexSort{
    display: flex;
    justify-content: space-between;
    padding: 20px;
}
.cakeIndex .indexSort>div{
    width: 30%;
    box-sizing: border-box;
    height: 100px;
    display: flex;
    flex-direction: column;
    align-items: center;
    font-size: 12px;
    padding: 10px;
    font-weight: 700;
    color: #000;
}
.cakeIndex .indexSort>div:nth-child(1){
  background: #FFEFDB;
}
.cakeIndex .indexSort>div:nth-child(2){
  background: #FFEFD5;
}
.cakeIndex .indexSort>div:nth-child(3){
  background: #DBDBDB;
}
.cakeIndex .indexSort div img{
    width: 60px;
    height: 60px;
    margin-top: 4px;
}
.cakeIndex .gap{
  height: 10px;
  background: #EBEBEB;
}
</style>