<template>
  <div>
    <ul>
      <li><router-link to="/">修改密码</router-link></li>
      <li><router-link to="/">清除本地缓存</router-link></li>
      <li class="adout"><router-link to="/">
        关于App
        <p>版本号 : v1.7</p>
      </router-link></li>
      <li><router-link to="/">关于用户协议与隐私政策</router-link></li>
    </ul>
  </div>
</template>
<style scoped>

  a{
    color: #555;
    font-size: 16px;
    font-weight: 300;
  }
  ul{

    width: 100%;
    height: 1000px;
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
    
    align-items: center;
  }
 
</style>