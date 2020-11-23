<template>
  <div>
     
    <router-link to="/" class="return"> 
      <img src="../../public/img/icons/return.png" >
    </router-link>
    

    <div class="title">
      蛋糕来了
    </div>
    <mt-field 
      type="tel"
      placeholder="请输入手机号"
      :attr="{maxlength:11}"
      v-model="phone"
      @blur.native.capture="checkPhone">
    </mt-field>
    <hr class="hr"/>
    
    <mt-field 
      type="text"
      placeholder="请输入短信验证码"
      v-model="code"
      :attr="{maxlength:5}"
      @blur.native.capture="checkCode">
        <mt-button  class="code">
          获取验证码
        </mt-button> 
    </mt-field>
    <hr class="hr"/>
     
      <button class="btn" @click="handel">手机登录/注册</button>
      <router-link to="/login">账号密码登录</router-link>
  </div>
</template>
<style scoped>
  .return{
    display: inline;
    margin-left: 2px;
  }
  .title{
    width: 100%;
    height: 140px;
    font-size: 32px;
    font-weight: 800;
    display: flex;
    justify-content: space-around;
    align-items: center;
    color: salmon;
  }
  input{
    display: block;
    width: 95%;
    margin: auto;
    padding: 10px 0;
    background-color: #fff !important;
    border: none;
  }
  .code{
    color: salmon;
    background: #fff;
    border: 0px;
  }
  .hr{
    width: 95%;

    border: 0.0.5px solid #000;
  }
  .btn{
    width: 90%;
    margin: 30px auto;
    margin-left: 15px;
    background-color: salmon;
    color: #fff;
    padding: 15px 0;
    border: 0px;
    border-radius: 22px;
    font-size: 18px;
  }
  a{
    text-decoration: none;
    color: #000;
    font-size: 16px;
    display: block;
    text-align: center;
  }
</style>
<script>
export default {
  data(){
    return {
      phone:'',
      code:'',
      phoneState:'',
      codeState:''
    }
  },
  methods:{
    
    checkPhone(){
      let phoneRegExp=/^[\u4e00-\u9fa50-9a-zA-Z]{6,16}$/;
      if(phoneRegExp.test(this.phone)){
        this.phoneState="success"
        return true
      }else{
        this.phoneState="error"
        this.$stoast({
          message:"手机号码格式不正确",
          position:"top",
          duration:"3000"
        })
        return false
      }
    },
    checkCode(){
      let codeRegExp=/^[0-9a-zA-Z]{4,5}$/;
      if(codeRegExp.test(this.code)){
        this.codeState="success"
        return true
      }else{
        this.codeState="error"
        this.$stoast({
          message:"验证码错误",
          position:"top",
          duration:"3000"
        })
        return false
      }
    },
    handel(){
      
    }
  }
  
}
</script>