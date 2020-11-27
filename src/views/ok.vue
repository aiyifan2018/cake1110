<template>
  <div class="ok">
    <img class="img" src="../assets/ok.jpg" >
    <!-- <mt-header title="">   -->
      <!-- <div slot="left"> -->
          <router-link  to="/shoppingcart">
            <button class="btn">返回购物车</button>
          </router-link>
          <p class="text">3秒后返回首页</p>
      <!-- </div>          -->
    <!-- </mt-header> -->
  </div>
</template>
<script>
export default {
  methods:{
    // back(){
    //   console.log(this.$router)
    // },
  },
  mounted(){
    setTimeout("self.location='/'", 30000);
  }
}
</script>
<style scoped>
  .img{
     position:fixed;
    top: 100px;
    left: 40px;
    width: 300px;
    height: 270px;
  }
  .btn{
    position:absolute;
    width: 100px;
    height: 30px;
    top: 240px;
    left: 140px;
    background-color: rgb(3, 170, 236);
    color:white;
  }
  .text{
    margin: 10px;
    position:absolute;
    top: 280px;
    left: 126px;
  }
</style>