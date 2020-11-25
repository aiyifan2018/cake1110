import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import router from '../router'
import {MessageBox} from 'mint-ui'

Vue.use(Vuex)

export default new Vuex.Store({
  //个页面中共享的状态
  state: {
    isLogined:localStorage.getItem("isLogined") || 0,
    //存储用户登录的信息
    userinfo:JSON.parse(localStorage.getItem("userinfo")) || {},
    //标识用户是否已经登录
    // isLogined:localStorage.getItem("isLogined") ? localStorage.getItem("isLogined") : 0,
    // username:localStorage.getItem("username") ? localStorage.getItem("username") : "",
  },
  mutations: {
    //state代表store中的所有stare
    logined_mutations(state,payload){
    //   state.age++
      //修改登录状态
       
      state.isLogined=1,
      //修改用户的登录信息
      state.userinfo=payload
      // localStorage.setItem("username",payload.username)
    },
    logout_mutations(state){
      state.isLogined=0;
      state.userinfo={};
    //   localStorage.removeItem("isLogined");
     }
  },
  actions: {
    login_action(context,payload){ 
      axios.post("/login",payload).then(res=>{
        //用户登录成功
        if(res.data.code==1){
          //提交
          context.commit("logined_mutations",res.data.userinfo)
          localStorage.setItem("isLogined",1)
          localStorage.setItem("userinfo",JSON.stringify(res.data.userinfo))
          router.push("/")
        }else{
          MessageBox("登录提示","用户名或密码错误")
        }
      })
    }
  },
  modules: {
  }
})
