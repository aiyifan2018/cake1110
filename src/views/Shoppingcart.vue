<template>
  <div>
      
    <mt-header title="购物车">
      <router-link to="/" slot="left">
        <mt-button icon="back"></mt-button>
      </router-link>
    </mt-header>
  <table border="1px" width="370px"  >
	</table>
      <div>
        <div id="title">{{cakeInfo.cname}}</div>
        <div id="item">
          <input type="checkbox" id="select" v-model="busy" @click="choose"  data-key="number"/>
          <span>
            <!-- <img src="../assets/11.jpg"> -->
            <img class="img" :src="require('../assets/'+cakeInfo.pic)">
          </span>
          <span id="content">
            <div>规格：{{cakeInfo.size}}寸</div>
            <div>数量：</div>
            <div class="abc001">
              <mt-button  @click="less" class="abc002">-</mt-button>
              <span>{{count}}</span>
              <mt-button  @click="more" class="abc002">+</mt-button>
            </div>
            <div v-if="busy==0" class="xiaoji">单价¥:{{cakeInfo.price}}</div>
            <div v-else class="xiaoji">小计¥:{{xiaoji}}</div>
          </span>
        </div>
      </div> 

      <div class="bottom-bar">
        <!-- 选项卡开始 -->
        <!--id仅在此父元素组件内唯一即可，整个页面内id可不唯一，表示对应变量,vue中特有-->
        <div class="heji" >合计：¥{{heji}}</div>
        <div class="jiesuan" ><div class="href"  @click="pay">去结算</div></div>       
      </div>
  </div>
</template>
<script>
export default {
  data(){
    return{
      cakeInfo:{},
      //price:179,
      // value:'0',
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
       this.$router.push({ name: 'Pay', params: { price: this.heji }})
      },
      choose(e){
        var id=e.target.dataset.key;
        id=this.total.length;
        if(this.busy==0){
          //let key=this.getAttribute("data-aaa")
          //this.sum.length;
          this.busy=1;
          //this.sum.push(this.xiaoji);
          //console.log(this.sum[0]);
          
          this.total.push(this.xiaoji);  
          //console.log(this.heji)
        }else{
          this.busy=0;
          //this.sum=[0];
          this.total=this.total.splice(id,1)
        }
          if(this.busy==1){
          for (let i = 0; i < this.total.length; i++) {
            this.heji += this.total[i];
            this.heji=parseFloat(this.heji);
          }
          }else{
            this.heji=0;
          }
       },
      more(){
        let price=this.cakeInfo.price
        this.count+=1;
        this.xiaoji=this.count*price;
        this.xiaoji=this.xiaoji.toFixed(2)
        console.log(this.cakeInfo)
      },
      less(){
        let price=this.cakeInfo.price
        if(this.count>1){
          this.count-=1
        }
        this.xiaoji=this.count*price;
        this.xiaoji=this.xiaoji.toFixed(2)
      }
    },
    watch:{
      count(val){
        this.xiaoji=val*this.cakeInfo.price;
        this.xiaoji=this.xiaoji.toFixed(2);
        if(this.busy==1){
        this.heji=this.xiaoji;
        }
      },
      // xiaoji(){
      //   if(this.busy==1){

      //   }
      // }
    },
    mounted(){
      //let adr={{cakeInfo.pic}}
      let cid=this.$route.query.cake;
      //console.log(cid)
      this.axios.get('/cake?cid='+cid).then(res=>{
        this.cakeInfo=res.data.cakeInfo;
      })
    }
}

</script>
<style scoped>
.href{
  text-decoration: none;
}
  .bottom-bar{
    text-align: center;
    /* display:  */
    display: flex;
    position: relative;
    bottom: -345px;
  }
  .heji{
    background: #e8e8e8;
    /* display: block; */
    font-size: 25px;
    width: 66%;
  }
  .jiesuan{
    /* display: block; */
    font-size: 25px;
    background-color: lightblue;
    width: 34%;
  }
  .abc001{
    border: 1px solid #000;
    text-align: center;
  }
  .abc002{
    background-color: #e8e8e8;
    margin: 0;
    padding: 10px 0;
    text-align: center;
    width: 25px;
  }
  #title{
    text-align: center;
  }
  #item{
    display: flex;
  }
  #content{
    position: relative;
    left: 15px;
  }
  #content>div{
    margin: 5px;
    padding: 5px;
  }
  .img{
    width: 150px;
    height: 150px;
  }
</style>