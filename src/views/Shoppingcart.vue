<template>
  <div id="cate">  
    <mt-header title="购物车">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <div class="checkbox">
      <input type="checkbox" v-model="checkAll"> 全选
    </div>
    <div v-for="(cakeInfo,index) in cakeInfo" :key="index" class="main">
      <div id="title">{{cakeInfo.cname}}</div>
      <div id="item">
         <input type="checkbox" id="select" v-model="cakeInfo.checked"/>
         <span>
            <img class="img" :src="require('../assets/picture/'+cakeInfo.pic)">
         </span>
         <span id="content">
           <div>规格：{{cakeInfo.size}}寸</div>
           <div>数量:</div>
           <div class="abc001">
             <mt-button @click="cakeInfo.count>1?cakeInfo.count-=1:1" class="abc002">-</mt-button>
             <span>{{cakeInfo.count==0?1:cakeInfo.count}}</span>
             <mt-button  @click="cakeInfo.count+=1" class="abc002">+</mt-button>
           </div>
           <p class="xiaoji"><b>单价¥:</b>{{cakeInfo.price}}&nbsp;&nbsp;&nbsp; </p> 
           <p  class="xiaoji"> <b>小计¥:</b>{{(cakeInfo.count*cakeInfo.price).toFixed(2)}}</p>
         </span>
       </div>
       <hr width="95%">
      </div> 
      <div class="bottom-bar">
        <div class="heji" >合计：¥{{sumPrice.toFixed(2)}}</div>
        <div class="jiesuan" ><div class="href"  @click="pay">去结算</div></div>       
      </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      cakeInfo:[],
      count:1,
    }
  },
   methods:{
      pay(){
       this.$router.push({ name: 'Pay', params: { price: this.heji }})
      },
    },
    computed:{
      checkAll: {
          //设置值，当点击全选按钮的时候触发
          set(v) {
            console.log(v);
              this.cakeInfo.forEach((cakeInfo) => (cakeInfo.checked = v))
          },
          //取值，当列表中的值改变之后触发，需要return
          get() {
              return (
                  this.cakeInfo.length ===
                  this.cakeInfo.filter((cakeInfo) => cakeInfo.checked).length
              )
          }
      },
       //计算总价，选择被选中的元素
      sumPrice() {
        return this.cakeInfo.filter((cakeInfo) => cakeInfo.checked).reduce((pre, cur) => {
          console.log(pre,cur);
            return pre + cur.price * cur.count
        }, 0)
      }
    },
    mounted(){
      // let id=this.$route.query.cake;
      // console.log(id)
      this.axios.get('/shopCake').then(res=>{
        this.cakeInfo=res.data.results;
        console.log(this.cakeInfo);
      })
    }
}
</script>
<style scoped>
#cate{
  width:100%;
}
.main{
   width:100%;
}
.checkbox{
  padding:5px;
  font-size:16px;
}
.checkbox input{
  width:16px;
  height:16px;
}
  #select{
    margin:10px;
    width:16px;
    height:16px;
    margin-top:55px;
  }
  .heji{
    background: #e8e8e8;
    display: block;
    padding:10px;
    font-size: 20px;
    width: 100%;
  }
  .jiesuan{
    display: block;
    font-size: 20px;
    background-color: green;
    border-radius:5px;
    padding:10px;
    width: 30%;
    text-align:center;
    color:#fff;
    margin:10px auto;
  }
  .abc001{
    text-align: center;
  }
  .abc001>span{
    padding:0 10px;
  }
  .abc002{
    background-color: #e8e8e8;
    margin: 0;
    padding: 5px 0;
    text-align: center;
    width: 30px;
  }
  #title{
    padding:5px;
    font-size:16px;
    text-align: center;
  }
  #item{
    display: flex;
  }
  #content{
    position: relative;
    left: 15px;
    width:50%;
  }
  #content>div,#content>p{
    padding: 5px;
  }
  .img{
    width:120px;
    height:120px;
    border-radius:10px;
  }
</style>