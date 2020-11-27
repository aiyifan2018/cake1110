<template>
  <div>  
    <mt-header title="购物车">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
    <table border="1px" width="370px"  ></table>
    <div v-for="(cakeInfo,index) in cakeInfo" :key="cakeInfo.cid">
      <div id="title">{{cakeInfo.cname}}</div>
      <div id="item">
         <input type="checkbox" id="select" v-model="busy" @click="choose(cakeInfo.cid)"  data-key="number"/>
         <span>
            <img class="img" :src="require('../assets/'+cakeInfo.pic)">
         </span>
         <span id="content">
           <div>规格：{{cakeInfo.size}}寸</div>
           <div>数量：</div>
           <div class="abc001">
             <mt-button  @click="less(cakeInfo.cid)" class="abc002">-</mt-button>
             <span>{{count}}</span>
             <mt-button  @click="more(cakeInfo.cid)" class="abc002">+</mt-button>
           </div>
           <div v-if="busy==0" class="xiaoji">单价¥:{{cakeInfo.price}}</div>
           <div v-else class="xiaoji">小计¥:{{xiaoji}}</div>
         </span>
       </div>
      </div> 
      <div class="bottom-bar">
        <!-- 选项卡开始 -->
        <!--id仅在此父元素组件内唯一即可，整个页面内id可不唯一，表示对应变量,vue中特有-->
        <div class="heji" >合计：¥{{heji}}</div>
        <div class="jiesuan" ><div class="href"  @click="pay">去结算</div></div>       
      </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      cakeInfo:{},
      //price:179,
      // value:'0',
       checkAll:false,
       count:1,
       xiaoji:0,
       //sum:[],
      busy:0,
      heji:0,
      total:[],
    }
  },
    methods:{
      pay(){
       this.$router.push({ name: 'Pay', params: { price: this.heji }})
      },
      choose(e){
        var id=e.target.dataset.key;
        id=this.total.length;
        if(this.busy==0){
          //let key=this.getAttribute("data-aaa")
          //this.sum.length;
          this.busy=1;
          //this.sum.push(this.xiaoji);
          //console.log(this.sum[0]);
        }
      }
    }
 }
 </script>
          
    