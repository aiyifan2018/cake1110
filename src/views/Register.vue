<template>
  <div>
     
    <router-link to="/" class="return"> 
      <img src="../../public/img/icons/return.png" >
    </router-link>
    

    <div class="title">
      蛋糕来了
    </div>
    <!-- <mt-field 
      type="tel"
      placeholder="请输入手机号"
      :attr="{maxlength:11}"
      v-model="phone"
      @blur.native.capture="checkPhone"
      :state="phoneState">
    </mt-field>
    <hr class="hr"/> -->
    
    <!-- <mt-field 
      type="text"
      placeholder="请输入短信验证码"
      v-model="code"
      :attr="{maxlength:5}"
      @blur.native.capture="checkCode"
      :state="codeState">
        <mt-button  class="code">
          获取验证码
        </mt-button> 
    </mt-field>
    <hr class="hr"/> -->

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

      <mt-field 
        type="password"
        placeholder="请再次输入密码"
        :attr="{maxlength:16,autocomplete:'off'}"
        v-model="conpassword"
        @blur.native.capture="checkConpasssword"
        :state="conpasswordState">
      </mt-field>
     
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
      username:"",
      password:"",
      conpassword:"",
      usernameState:"",
      passwordState:"",
      conpasswordState:""
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
    checkConpasssword(){
      if(this.conpassword!==this.password){
        this.conpasswordState="error";
        this.$toast({
          message:"两次密码不一致",
          position:"top",
          duration:"3000"
        });
        return false;
      }else{
        this.conpasswordState="success";
        return true;
      }
    },
    handel(){
       console.log(this.username,this.password);
        if(this.checkUsername()&&this.checkPasssword()&&this.checkConpasssword()){
        this.axios.post("/register","username="+this.username+"&password="+this.password).then(res=>{
          if(res.data.code==1){
            this.$router.push("/login");
          }else{
            this.$messagebox("注册提示","用户名已占用")
          }
      })
        }
    }
  }
}
</script>