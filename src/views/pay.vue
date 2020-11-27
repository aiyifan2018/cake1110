<template>
  <div>
    <mt-header title="填写订单">
        <router-link slot="left" to="/shoppingcart">
            <mt-button  icon="back"></mt-button>
        </router-link>
    </mt-header>
    <div class="top">
          <div class="top-name">姓名：杜兰特</div>
          <div class="top-tel">电话：13912365478</div>
          <div class="top-address">地址：美国纽约州布鲁克林区</div>
    </div>
    <div>
        <p class="datacom">选择送达时间：
        <input type="date" placeholder="请输入送达时间" ></p>
       <!-- <mt-field  placeholder="请输入" type="date" v-model="day">
            <mt-picker :slots="slots" @change="onValuesChange"></mt-picker>
        </mt-field> -->
        <mt-field label="订购人姓名" placeholder="请输入姓名" v-model="username"></mt-field>
        <mt-field label="留言" placeholder="选填" type="textarea" rows="4" v-model="introduction"></mt-field>
    </div>
    <div class="bottom-bar">
        <!-- 选项卡开始 -->
        <!--id仅在此父元素组件内唯一即可，整个页面内id可不唯一，表示对应变量,vue中特有-->
        <div class="heji" >合计：¥{{this.$route.params.price}}</div>
        <div class="jiesuan" ><router-link to="ok" class="jiesuana">去结算</router-link></div>       
    </div>
  </div>

</template>
<script>
export default {
    methods: {
      onValuesChange(picker, values) {
        if (values[0] > values[1]) {
          picker.setSlotValue(1, values[0]);
        }
      }
    },
    data() {
      return {
        day:"请选择",
        username:"Kevin Durant",
        introduction:"",
        slots: [
          {
            flex: 1,
            values: ['2020-01', '2020-02', '2020-03', '2020-04', '2020-05', '2020-06', '2020-07', '2020-08', '2020-09', '2020-10', '2020-11', '2020-12'],
            className: 'slot1',
            textAlign: 'right'
          }, {
            divider: true,
            content: '-',
            className: 'slot2'
          }, {
            flex: 1,
            values: ['2020-01', '2020-02', '2020-03', '2020-04', '2020-05', '2020-06', '2020-07', '2020-08', '2020-09', '2020-10', '2020-11', '2020-12'],
            className: 'slot3',
            textAlign: 'left'
          }
        ]
      };
    }
  }
</script>
<style scoped>
.href{
  text-decoration: none;
}
.datacom{
  margin:10px;
  font-size:16px;
}
  .top div{
    /* padding-top: -55px; */
    margin-bottom: 0px;
    margin-left: 10px;
    align-items: center;
    text-align: left;
    margin-top: 15px;
  }
   .bottom-bar{
    text-align: center;
    display: flex;
  }
  .heji{
    background: #e8e8e8;
    font-size: 20px;
    width: 66%;
    padding:10px;
  }
  .jiesuan{
    /* display: block; */
    font-size: 20px;
    background-color: green;
    border-radius:5px;
    padding:10px;
    width: 30%;
    text-align:center;
  }
  .jiesuana{
    color:#fff;
  }
</style>