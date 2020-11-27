<template>
  <div id="cate">
    <div id="cate_main">
      <mt-header title="购物车">
        <router-link to="/" slot="left">
          <mt-button icon="back"></mt-button>
        </router-link>
      </mt-header>
      <div class="checkbox">
        <input type="checkbox" v-model="checkAll" /> 全选
      </div>
      <div v-for="(cakeInfo, index) in cakeInfo" :key="index" class="main">
        <div id="title">{{ cakeInfo.cname }}</div>
        <div id="item">
          <input type="checkbox" id="select" v-model="cakeInfo.checked" />
          <span>
            <img
              class="img"
              :src="require('../assets/picture/' + cakeInfo.pic)"
            />
          </span>
          <span id="content">
            <div>规格：{{ cakeInfo.size }}寸</div>
            <div>数量:</div>
            <div class="abc001">
              <mt-button
                @click="cakeInfo.count > 1 ? (cakeInfo.count -= 1) : 1"
                class="abc002"
                >-</mt-button
              >
              <span>{{ cakeInfo.count == 0 ? 1 : cakeInfo.count }}</span>
              <mt-button @click="cakeInfo.count += 1" class="abc002"
                >+</mt-button
              >
            </div>
            <p class="xiaoji">
              <b>单价¥:</b>{{ cakeInfo.price }}&nbsp;&nbsp;&nbsp;
            </p>
            <p class="xiaoji">
              <b>小计¥:</b>{{ (cakeInfo.count * cakeInfo.price).toFixed(2) }}
            </p>
          </span>
          <button class="del" @click="del(cakeInfo.cid)">X</button>
        </div>
        <hr width="95%" />
      </div>
    </div>
    <div class="bottom-bar">
      <span class="heji">合计：¥{{ sumPrice.toFixed(2) }} </span> &nbsp;&nbsp;
      <span class="jiesuan" @click="pay(sumPrice.toFixed(2))"> 结 算</span>
    </div>
  </div>
</template>
<script>
import { Toast, Dialog } from "vant";
export default {
  data() {
    return {
      cakeInfo: [],
      count: 1,
    };
  },
  components: {
    [Dialog.name]: Dialog,
  },
  methods: {
    pay(price) {
      if(price>0){
        this.$router.push({ name: "Pay", params: { price:price} });
      }else{
        Toast("请选择你要购买的蛋糕");
      }
    },
    del(index) {
      Dialog.confirm({
        title: "提示",
        message: "是否确定删除商品?",
      })
        .then(() => {
          this.axios.get("/del?cid=" + index).then((res) => {
            console.log(res.data.code);
            if (res.data.code == 1) {
              Toast(res.data.message);
              this.cartList();
            } else {
              Toast(res.data.message);
            }
          });
        })
        .catch((err) => {
          console.log(err);
        });
    },
    cartList() {
      this.axios.get("/shopCake").then((res) => {
        this.cakeInfo = res.data.results;
        console.log(this.cakeInfo);
      });
    },
  },
  computed: {
    checkAll: {
      //设置值，当点击全选按钮的时候触发
      set(v) {
        console.log(v);
        this.cakeInfo.forEach((cakeInfo) => (cakeInfo.checked = v));
      },
      //取值，当列表中的值改变之后触发，需要return
      get() {
        return (
          this.cakeInfo.length ===
          this.cakeInfo.filter((cakeInfo) => cakeInfo.checked).length
        );
      },
    },
    //计算总价，选择被选中的元素
    sumPrice() {
      return this.cakeInfo
        .filter((cakeInfo) => cakeInfo.checked)
        .reduce((pre, cur) => {
          console.log(pre, cur);
          return pre + cur.price * cur.count;
        }, 0);
    },
  },
  mounted() {
    this.cartList();
  },
};
</script>
<style scoped>
.mint-header{
  background: #fff;
  color: #ff6700;
  font-size: 20px;
}
#cate {
  width: 100%;
  position: relative;
}
#cate_main{
  height: 580px;
  overflow-y:auto;
}
.main {
  width: 100%;
}
.checkbox {
  padding: 5px;
  font-size: 16px;
}
.checkbox input {
  width: 16px;
  height: 16px;
}
#select {
  margin: 10px;
  width: 16px;
  height: 16px;
  margin-top: 55px;
}
.heji {
  background: #e8e8e8;
  display: inline-block;
  padding: 10px;
  font-size: 20px;
  margin-left: 45px;
  color: #666;
}
.jiesuan {
  display: inline-block;
  font-size: 20px;
  background-color: green;
  border-radius: 5px;
  padding: 10px;
  width: 30%;
  text-align: center;
  color: #fff;
}
.abc001 {
  text-align: center;
}
.abc001 > span {
  padding: 0 10px;
}
/* 删除按钮 */
.del {
  height: 20px;
  width: 20px;
  border-radius: 50%;
  background: red;
  color: #fff;
  border: none;
  margin-top: 55px;
  margin-right: 5px;
  z-index: 1000;
}
.bottom-bar {
  position: fixed;
  bottom: 5px;
  margin: 0 auto;
  display: flex;
  width: 100%;
}
.abc002 {
  background-color: #e8e8e8;
  margin: 0;
  padding: 5px 0;
  text-align: center;
  width: 30px;
}
#title {
  padding: 5px;
  font-size: 16px;
  text-align: center;
}
#item {
  display: flex;
}
#content {
  position: relative;
  left: 15px;
  width: 50%;
}
#content > div,
#content > p {
  padding: 5px;
  width: 87px;
}
.img {
  width: 120px;
  height: 120px;
  border-radius: 10px;
}
</style>