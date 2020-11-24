<template>
  <div>
<<<<<<< HEAD
     
    <router-link to="/" class="return"> 
      <img src="../../public/img/icons/return.png" >
    </router-link>
    

=======
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
    <div class="title">
      蛋糕来了
    </div>
    <mt-field 
<<<<<<< HEAD
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
=======
      type="text"
      placeholder="请输入手机号">
    </mt-field>
    <hr class="hr"/>
    <!-- :attr="{maxlength:16}"
    v-model="username"
    @blur.native.capture="checkUsername"
    :state="usernameState" -->
    <mt-field 
      type="password"
      placeholder="请输入短信验证码">
      <router-link to="/">
        获取验证码
      </router-link>
    </mt-field>
    <hr class="hr"/>
      <!-- :attr="{maxlength:16,autocomplete:'off'}"
      v-model="password"
      @blur.native.capture="checkPasssword"
      :state="passwordState" -->
    <!-- <mt-field 
      type="text"
      placeholder="请输入邮箱或手机号"
      :attr="{maxlength:16}"
      v-model="username"
      @blur.native.capture="checkUsername"
      :state="usernameState">
    </mt-field>
    <mt-field 
      type="password"
      placeholder="请输入登录密码"
      :attr="{maxlength:16,autocomplete:'off'}"
      v-model="password"
      @blur.native.capture="checkPasssword"
      :state="passwordState">
    </mt-field> -->

      <button @click="handel">手机登录/注册</button>
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
      <router-link to="/login">账号密码登录</router-link>
  </div>
</template>
<style scoped>
<<<<<<< HEAD
  .return{
    display: inline;
    margin-left: 2px;
  }
=======
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
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
<<<<<<< HEAD
  .code{
    color: salmon;
    background: #fff;
    border: 0px;
=======
  input a{
    color: salmon;
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
  }
  .hr{
    width: 95%;

    border: 0.0.5px solid #000;
  }
<<<<<<< HEAD
  .btn{
=======
  button{
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
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
<<<<<<< HEAD
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
=======

// export default {
//   data(){
//     return {
//       username:"",
//       password:"",
//       usernameState:"",
//       passwordState:""
//     }
//   },

//   methods:{
//     checkUsername(){
//       let usernameRegExp=/^[\u4e00-\u9fa50-9a-zA-Z]{6,16}$/;
//       if(usernameRegExp.test(this.username)){
//         this.usernameState="success";
//         return true;
//       }else{
//         this.usernameState="error";
//         this.$toast({
//           message:"用户名为必填项",
//           position:"top",
//           duration:"3000"
//         });
//         return false;
//       }
//     },
//     checkPasssword(){
//       let passwordRegExp=/^[\u4e00-\u9fa50-9a-zA-Z]{6,16}$/;
//       if(passwordRegExp.test(this.password)){
//         this.passwordState="success";
//         return true;
//       }else{
//         this.passwordState="error";
//         this.$toast({
//           message:"密码为数字、字母的组合体",
//           position:"top",
//           duration:"3000"
//         });
//         return false;
//       }
//     },
    // handel(){
      
    //   if(this.checkUsername()&&this.checkPasssword()){
    //     // let str="username="+this.username+"&password="+this.password
    //     let obj={
    //       username:this.username,
    //       password:this.password
    //     };
    //     let str=this.qs.stringify(obj);
    //     this.$store.dispatch("login_action",str)
    //     // this.axios.post("/login",this.qs.stringify(obj)).then(res=>{
    //     //   if(res.data.code==200){
             
    //     //     this.$store.commit("logined_mutations",res.data.userinfo)
    //     //     this.$router.push("/");
    //     //   }else{
    //     //     this.$messagebox("登录提示","用户名或密码错误")
    //     //   }
    //     // })
    //   }
    // }
  //}
//}
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
</script>