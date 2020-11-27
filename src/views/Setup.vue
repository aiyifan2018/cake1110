<template>
  <div class="main">
    <mt-header title="设置" class="set">
      <router-link to="/mine" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <div v-if="this.$store.state.isLogined==1">
      <ul>
        <li><router-link to="/">修改密码</router-link></li>
        <li><router-link to="/">清除本地缓存</router-link></li>
        <li  >
          <router-link class="adout" to="/">
          <span>关于App</span> 
          <span>版本号 : v1.7</span>
        </router-link></li>
        <li><router-link to="/">关于用户协议与隐私政策</router-link></li>
      </ul>
      <routerr-link to="/login">
         <button  @click="logout">退出</button>
      </routerr-link>
     
    </div>
    <div v-else>
      <ul>
        <li><router-link to="/">清除本地缓存</router-link></li>
        <li class="adout"><router-link to="/">
          关于App
          <p>版本号 : v1.7</p>
        </router-link></li>
        <li><router-link to="/">关于用户协议与隐私政策</router-link></li>
      </ul>
    </div>
  </div>
</template>
<style scoped>
  .set{
    background-color: #fff;
    color: #000;
  }
  .main{
    height: 1000px;
    background-color: #eee;
    font-size: 16px;
    font-weight: 300;
  }
  a{
    color: #555;
    
  }
  ul{

    width: 100%;
  
    background-color: #eee;
  }
  ul>li{
    
    background-color: #fff;
    border: 0 solid #000;
    border-radius: 5px;
    margin:10px 10px 10px 10px;
    padding: 20px 20px;
  }
  .adout{
    display: flex;
    justify-content: space-between;
    
     
  }
  /* span{
    margin-right: 0px;
  } */
  button{
    margin: 20px auto;
    border: 0;
    width: 35%;
    color: #fff;
    background-color: #000;
    padding: 8px 20px;
    display: flex;
    justify-content: center;
    
  }
</style>
<script>
export default {
  methods:{
    logout(){
      this.$store.commit("logout_mutations")
      localStorage.clear()
   
    }
  }
}
</script>