<template>
  <div>
    <router-link to="/" class="return">
      <img src="../../public/img/icons/return.png" >
    </router-link>
    <div class="title">
      蛋糕来了
    </div>
    <!-- <mt-field
      type="text"
      placeholder="请输入邮箱或手机号"
      :attr="{maxlength:16}"
      v-model="uname"
      @blur.native.capture="checkUname"
      :state="uState">   
    </mt-field>
    <hr class="hr"/>
    
    <mt-field 
      :type="types" 
      placeholder="请输入登录密码"
      :attr="{maxlength:16,autocomplete:'off'}"
      v-model="password"
      @blur.native.capture="checkPassword"
      :state="pState">  
      <img :src="this.types==passwors?'../../public/img/icons/hide.png':'../../public/img/icons/display.png'">
      | 忘记密码 ？
    </mt-field> -->


    <mt-field 
        type="text"
        placeholder="请输入用户名"
        :attr="{maxlength:16}"
        v-model="username"
        @blur.native.capture="checkUsername"
        :state="usernameState">
      </mt-field>
      <mt-field 
        type="password"
        placeholder="请输入密码"
        :attr="{maxlength:16,autocomplete:'off'}"
        v-model="password"
        @blur.native.capture="checkPasssword"
        :state="passwordState">
      </mt-field>
    <hr class="hr"/>
      <button @click="handel">登录</button>
      <router-link to="/register">手机短信登录/注册</router-link>
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
  .hr{
    width: 95%;

    border: 0.0.5px solid #000;
  }
  button{
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
      username:"",
      password:"",
      usernameState:"",
      passwordState:""
    }
  },
   methods:{
    checkUsername(){
      let usernameRegExp=/^[\u4e00-\u9fa50-9a-zA-Z]{6,16}$/;
      if(usernameRegExp.test(this.username)){
        this.usernameState="success";
        return true;
      }else{
        this.usernameState="error";
        this.$toast({
          message:"用户名为必填项",
          position:"top",
          duration:"3000"
        });
        return false;
      }
    },
    checkPasssword(){
      let passwordRegExp=/^[\u4e00-\u9fa50-9a-zA-Z]{6,16}$/;
      if(passwordRegExp.test(this.password)){
        this.passwordState="success";
        return true;
      }else{
        this.passwordState="error";
        this.$toast({
          message:"密码为数字、字母的组合体",
          position:"top",
          duration:"3000"
        });
        return false;
      }
    },
    handel(){
      
      if(this.checkUsername()&&this.checkPasssword()){
        
        let obj={
          username:this.username,
          password:this.password
        };
        let str=this.qs.stringify(obj);
        this.$store.dispatch("login_action",str)
        
      }
    }
  }
}
</script>