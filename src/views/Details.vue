<template>
    <div class="details">
        <mt-header title="美丽家蛋糕" fixed>
            <router-link to="/cakesort" slot="left">
              <mt-button icon="back"></mt-button>
            </router-link>
            <mt-button icon="more" slot="right"></mt-button>
          </mt-header>
        <!-- 上部轮播图开始 -->
        <div class="details_cake">
          <mt-swipe :show-indicators="false">
             <mt-swipe-item><img src="../assets/img/006.jpg" alt=""></mt-swipe-item>
             <mt-swipe-item><img src="../assets/img/007.jpg" alt=""></mt-swipe-item>
             <mt-swipe-item><img src="../assets/img/010.jpg" alt=""></mt-swipe-item>
             <mt-swipe-item><img src="../assets/img/008.jpg" alt=""></mt-swipe-item>
            </mt-swipe>
        </div>
        <!-- 下部详情 -->
        <div id="topleft">
            <!-- 标题开始 -->
            <div class="details_name">
                {{category.bname}}/{{category.dname}}
            </div>
            <div class="details_price">
                ￥{{category.price}}
            </div>
            <div class="details_nid">
                已售{{category.sales_count}}件
            </div>
        </div>
        <div class="details_use">
            <div>
                <span>适合{{category.many_people}}分享</span>
                <span>{{category.tableware}}</span>
            </div>
            <div>
                <span>{{category.gift}}</span>
                <span>最快{{category.arrival_time}}送达</span>
            </div>
        </div>
        <div class="details_cookie">
            <div>
                <span>食材</span>
                <span>{{category.ingredients}}</span>
            </div>
            <div>
                <span>保鲜</span>
                <span>{{category.freshtime}}</span>
            </div>
        </div>
        <div class="details_chose">
            <div @click="handler">
                <span>已选</span>
                <span>{{category.size}}寸</span>
                <span>. . .</span>
            </div>
            <mt-popup v-model="popupVisible" position="bottom" >
                <div class="details_list">
                    <div class="popup" v-if="category.mini_pic">
                        <img  :src="require('../assets/img/'+category.mini_pic)" alt="">
                    </div>
                    <div class="list">
                        <ul>
                            <li>适合{{category.many_people}}分享</li>
                            <li>{{category.tableware}}</li>
                            <li>{{category.gift}}</li>
                            <li>最快{{category.arrival_time}}送达</li>
                        </ul>
                        <div class="details_name">
                            {{category.bname}}/{{category.dname}}
                        </div>
                        <div class="details_price">
                            ￥{{category.price}}
                        </div>
                    </div>
                </div>
                <div class="details_shopping">
                    <ul>
                        <li>选择</li>
                        <li><span  class="inf" @click="showSize($event,item)" v-for="(item,index)　of series" :key="index" >{{item.size}}</span></li>
                        <li>数量</li>
                    </ul>
                    <div>
                        <button @click="minute">-</button>
                        <span>{{n}}</span>
                        <button @click="add">+</button>
                    </div>
                </div>
                <van-goods-action v-show=" isShow">
                    <van-goods-action-icon icon="chat-o" text="客服"  dot />
                    <van-goods-action-icon icon="cart-o" text="购物车" to="/cakecart" dot/>
                    <van-goods-action-button  text="加入购物车" to="/cakecart" />
                    <van-goods-action-button   type="danger" text="立即购买" to="/shoppingcart"/>
                  </van-goods-action>
            </mt-popup>  
        </div>
         <van-cell is-link @click="showPopup" class="details_address">配送至 ---{{province}} {{city}}  {{country}}</van-cell>
       <van-popup v-model="show" position="bottom" :style="{ height: '50%' }">
            <van-area :area-list="areaList" :columns-num="3" ref="myArea"
            @confirm="onConfirm" @cancel="onCancel"  @change="onChange" title="配送至"  />  
        </van-popup> 
        <div class="details_speak">
           <!-- 评价区域 -->
            <!-- 实验代码开始 -->
            <section class="panel">
                <div class="panel-head">
                    <div class="panel-head-title">订单评价</div>
                    <div class="panel-head-link">
                        <a href="../../src/assets/picture/welcome_avatar.png">最近已有295条评价<i class="iconfont iconfont-arrow-right"></i></a>
                    </div>
                </div>
                <div class="panel-body comments">
                    <div class="comments-item">
                        <div class="comments-item-head">
                            <div class="comments-item-head-left">
                                <img class="comments-item-head-pic" src="../../src/assets/picture/PTF01照片.jpg" alt="宁*" />
                                <span class="comments-item-head-name">宁*</span>
                            </div>
                                <!--Dev::Star1-5 新增classs Star1-5-->
                            <div class="comments-item-head-right">
                                <span class="comments-item-head-star star5">
                                </span>
                            </div>
                        </div>
                        <div class="comments-item-content">口感相当不错</div>
                            <div class="comments-item-imglist">
                                <div class="comments-item-imglist-item" style="background-image: url('../../src/assets/picture/1be705129e1443f180e334d297c32027.jpeg');">
                                </div>
                            </div>
                            <div class="comments-item-address">
                                <i class="iconfont iconfont-address">
                                </i>北京朝阳区
                            </div>
                        </div>
                </div>
                    <div class="panel-body comments">
                         <div class="comments-item">
                            <div class="comments-item-head">
                                <div class="comments-item-head-left">
                                    <img class="comments-item-head-pic" src="../../src/assets/picture/avatar_default_06.jpg" alt="潇*生" />
                                    <span class="comments-item-head-name">潇*生</span>
                                </div>
                                <div class="comments-item-head-right"><span class="comments-item-head-star star5"></span></div>
                            </div>
                            <div class="comments-item-content">已经第二次下你们的订单、非常喜欢的一环是当天订当天就送到了、据收方了解、蛋糕非常好吃！搞得我也想订一盒来新加坡！哈哈哈！谢谢和加油各位工作人员！</div>
                            <div class="comments-item-imglist">
                                <div class="comments-item-imglist-item" style="background-image: url('../../src/assets/picture/041.jpg');">
                                </div>
                            </div>
                            <div class="comments-item-address"><i class="iconfont iconfont-address"></i>广东深圳市宝安区</div>
                        </div>
                    </div>
                    <div class="panel-body comments">
                         <div class="comments-item">
                            <div class="comments-item-head">
                                <div class="comments-item-head-left">
                                    <img class="comments-item-head-pic" src="../../src/assets/picture/041.jpg" alt="谯*" />
                                    <span class="comments-item-head-name">谯*</span>
                                </div>
                                <div class="comments-item-head-right"><span class="comments-item-head-star star5"></span></div>
                            </div>
                            <div class="comments-item-content">很好哦，口味多多</div>
                            <div class="comments-item-imglist">
                                 <div class="comments-item-imglist-item" style="background-image: url('../../src/assets/picture/041.jpg');">
                                </div>
                            </div>
                            <div class="comments-item-address"><i class="iconfont iconfont-address"></i>广东深圳市宝安区</div>
                        </div>
                    </div>
                    <div class="panel-footer">
                        <div class="comments-more">
                            <a href="" title="查看更多评价">查看更多评价</a>
                        </div>
                    </div>
        </section>
    </div>
            <!--   实验代码结束 -->
     <!-- <div class="details_image">
        <img v-for="img in imageList" v-lazy="img" :key="img"/>
     </div> -->
     <div class="details_end">
        <van-goods-action v-show=" isShow">
            <van-goods-action-icon icon="chat-o" text="客服"  to="/kefu" dot />
            <van-goods-action-icon icon="cart-o" text="购物车" to="/shoppingcart"  dot/>
            <van-goods-action-button @click="onClickBigBtn" text="加入购物车" />
            <van-goods-action-button to="/cakecart"  type="danger" text="立即购买" />
          </van-goods-action>
     </div>
    </div>  
</template>
<script>
    import areaList from '../assets/area/area.js';
    import { Toast } from 'vant';
    // import VDistpicker from 'v-distpicker'
    export default {
        data() {
            return {
                // components: { VDistpicker },
                popupVisible: false,
                modal: false,
                n: '1',
                show: false,
                overlay: false,
                areaList,
                province:'',
                city:"",
                country:'',
                isShow:true,
                category:[],
                series:{},
                active:false
            }
        },
        mounted () {
            let id = this.$route.params.id;
            this.axios.get('/cakeDetails?id='+id).then(res=>{
                this.category = res.data.results[0];
                console.log("-",this.category);
                let cid=this.category.series_id;
                console.log(cid)
                this.axios.get('/cakeDetails_series?cid='+cid).then(res=>{
               this.series=res.data.results;
                console.log(this.series);
                console.log(cid)
                })
            })
        },
        methods: {
        onClickBigBtn(){
            let id = this.$route.params.id;
            this.axios.get('/addcart?id='+id).then(res=>{
                let cart = res.data;
                console.log(cart)
                if(cart.code==1){
                    Toast(cart.message)
                }else{
                    Toast(cart.message)
                }
            })
        },
         
            showSize(e,item){
                let id=item.did;
                this.axios.get('/cakeDetails?id='+id).then(res=>{
                    this.category = res.data.results[0];
                });   
                let infos = document.querySelectorAll('.inf');
                infos.forEach((item)=>{
                   item.className = "";
                })
               e.className="active";
            },
            handler() {
                this.closeOnClickModal = true;
                this.popupVisible = true;
            },
            add() {
                this.n++
            },
            minute() {
                if (this.n > 1) {
                    this.n--
                }
            },
            popup() {
                //如果v-show的值是false,则点击div 使selected的值为true,反之如果为true,则让他变为false
                if (this.selected) {
                    this.selected = false;
                } else {
                    this.selected = true;
                }
            },
            showPopup() {
                this.show = true;
                this.overlay = true;
            },

            // 点击取消时，关闭弹窗，并且重置数据
            onCancel() {
                this.show = false;
                this.$refs.myArea.reset()
            },
            //当弹窗页面发生改变时
            onChange(picker) {
                let val = picker.getValues();
                return val;
            },
            //点击确定时，弹窗关闭，且选中的数据，通过传参，显示在页面上
            onConfirm(val) {
                this.province= val[0].name,
                this.city=val[1].name,
                this.country=val[2].name;
                this.show = false;
             }
            }
    }

</script>
<style scoped>
    .active{
        background-color: red !important;
    }
    .body {
        font-size: 24rpx;
    }
   .mint-header{
    background-color:coral
    }
    body,p,h1,h2,h3,h4,h5,h6,ul,ol,li,tr,td,th,div,span {
        padding: 0;
        margin: 0;
        box-sizing: border-box
    }

    .details_cake {
        height: 400px;
    }
    .details_cake img{
        width:100%;
        overflow: hidden;
    }
    .details_name{
        padding-left:1rem;
        padding-top:0.5rem;
    }
    .details_price {
        padding-top: 0.8rem;
        padding-left:1rem;
        padding-bottom:1rem;
        color: rgb(255, 0, 0);
    }

    .details_name+.details_price {
        text-align: left;
       
    }
    #topleft {
        position: relative;
        height: 38%;
        border-bottom: 5px solid #ccc;
    }

    #topleft .details_nid {
        position: absolute;
        top: 48%;
        left: 69%;
    }

    .details_use {
        margin-left: 0.8rem;
        margin-top: 0.5rem;
        font-size: 14px;
        border-bottom: 1px solid #ccc;
    }

    .details_use div {
        padding: 0.6rem;
    }

    .details_use div:nth-child(1) span:nth-child(2) {
        padding-left: 3rem;
    }

    .details_use div:nth-child(2) span:nth-child(2) {
        padding-left: 3rem;
    }

    .details_use div:nth-child(2) {
        padding-bottom: 1rem;
    }

    .details_cookie {
        margin-left: 0.1rem;
        font-size: 13px;
        border-bottom: 5px solid #bbb;
        position: relative;
    }

    .details_cookie div {
        padding: 0.8rem;
    }

    .details_cookie div span:nth-child(2) {
        padding-left: 2rem;
    }

    .details_cookie div:nth-child(1) span:nth-child(2) {
        display: inline-block;
        position:absolute;
        top: 0.5rem
    }
    .details_chose {
        padding:1.8rem 0 2rem 1rem;
        border-bottom: 1px solid #ccc;
    }

    .details_chose>span {
        padding-left: 1rem;
    }

    .details_chose span:nth-child(3) {
        padding-left: 14rem;

    }

    .details ul {
        font-size: 12px;
        list-style: none;
    }

    .popup img {
        padding-left: 2rem;
        padding-top: 1rem;
        padding-bottom: 2rem;
        height: 100px;
    }

    .mint-popup-bottom {
        width: 100%
    }

    .list ul {
        position: absolute;
        top: -8rem;
        left: 13rem
    }

    .list ul li {
        padding: 0.2rem
    }

    .list {
        position: relative;
    }

    .details_list {
        border-bottom: 1px solid #000;
    }

    .list .details_price {
        position: relative;
        top: -2.5rem;
        left: 19rem
    }

    .details_shopping {
        padding-bottom: 5rem;
        padding-left: 1rem;
        padding-top: 1rem;
        position: relative;

    }

    .details_shopping ul li {
        padding: 0.5rem;
    }

    .details_shopping ul>li:nth-child(2) span {
        border: 1px solid #000;
        padding:0.5rem 1rem;
        margin-right:1rem
    }
    .details_shopping ul>li>span:nth-child(2) :active{
        border: 1px solid rgb(250, 0, 0);
    }
    .details_shopping div {
        position: relative;
        top: -1rem;
        left: 16rem;
    }

    .details_shopping div span {
        padding: 0.3rem;
        text-align: center;
    }

    .details_address {
        padding:1rem 0rem 2rem 1rem;
        border-bottom:5px solid #bbb;
    }
    /* .details_end{
        z-index: 99;
        position: absolute;
    } */
    /* 。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。。 */
    .panel {
  background-color: #fff;
  margin-top: 0.57142857rem;
}
.panel-head {
  display: flex;
  align-items: center;
  padding: 0.85714286rem 1.14285714rem;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.panel-head-title {
  flex: 1;
  font-size: 1.14285714rem;
}
.panel-head-link {
  flex: 1;
  font-size: 0.85714286rem;
  color: #71797F;
  text-align: right;
}
.panel-body {
  border-top: 1pactivex solid #E9ECF0;
}
.comments-item {
  padding: 0.85714286rem 1.14285714rem;
  background-color: #fff;
}
.comments-item + .comments-item {
  border-top: 1px solid #E9ECF0;
}
.comments-item-head {
  display: flex;
  align-items: center;
}
.comments-item-head-left {
  flex: 1;
}
.comments-item-head-right {
  width: 4.28571429rem;
  max-width: 4.28571429rem;
  min-width: 4.28571429rem;
  height: 0.64285714rem;
  overflow: hidden;
  text-align: right;
}
.comments-item-head-pic {
  width: 1.42857143rem;
  height: 1.42857143rem;
  border-radius: 50%;
  overflow: hidden;
}
.comments-item-head-name {
  font-size: 0.85714286rem;
  margin-left: 0.57142857rem;
}
.comments-item-head-star {
  display: block;
  width: 4.28571429rem;
  max-width: 4.28571429rem;
  min-width: 4.28571429rem;
  height: 0.64285714rem;
  background-repeat: no-repeat;
  background-size: contain;
  background-position: center center;
}
.comments-item-head-star.star1 {
  background-image: url("../../src/assets/picture/star5.png");
}
.comments-item-head-star.star2 {
  background-image: url("../../src/assets/picture/star5.png");
}
.comments-item-head-star.star3 {
  background-image: url("../../src/assets/picture/star5.png");
}
.comments-item-head-star.star4 {
  background-image: url("../../src/assets/picture/star5.png");
}
.comments-item-head-star.star5 {
  background-image: url("../../src/assets/picture/star5.png");
}
.comments-item-content {
  margin-top: 0.85714286rem;
  font-size: 0.92857143rem;
}
.comments-item-imglist {
  margin-top: 1rem;
  display: flex;
  position: relative;
}
.comments-item-imglist-item {
  flex: 1;
  max-width: 5.71428571rem;
  height: 5.71428571rem;
  background-repeat: no-repeat;
  background-size: cover;
  background-position: center center;
}
.comments-item-imglist-item > a {
  display: block;
  width: 5.71428571rem;
  height: 5.71428571rem;
}
.comments-item-imglist-item + .comments-item-imglist-item {
  margin-left: 0.57142857rem;
}
.comments-item-imglist-item:nth-child(4) ~ .comments-item-imglist-item {
  display: none;
}
.comments-item-imglist-num {
  position: absolute;
  right: 0.28571429rem;
  bottom: 0.28571429rem;
  color: #fff;
  background-color: rgba(73, 73, 73, 0.8);
  border-radius: 2em;
  font-size: 0.71428571rem;
  padding: 0 0.42857143rem;
}
.comments-item-address {
  margin-top: 0.57142857rem;
  color: #B4BABF;
  font-size: 0.78571429rem;
  overflow: hidden;
  text-overflow: ellipsis;
  white-space: nowrap;
}
.comments-item-address .iconfont-address {
  margin-right: 0.14285714rem;
}
.comments-more {
  text-align: center;
  padding: 0.57142857rem 0 1.71428571rem;
}
.comments-more:after {
  content: "";
  display: block;
  height: 0;
  clear: both;
}
.comments-more > img{
  display: inline-block;
  font-size: 0.85714286rem;
  border: 1px solid #232628;
  padding: 0.28571429rem 0.57142857rem;
  border-radius: 0.14285714rem;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
.comments-more > a {
  display: inline-block;
  font-size: 0.85714286rem;
  border: 1px solid #232628;
  padding: 0.28571429rem 0.57142857rem;
  border-radius: 0.14285714rem;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}
 .comments-more > a{
  background-color: #F7F9FA;
} 
.details_speak{
    padding:0.5rem 0.5rem 2rem 0.5rem
}
body{
    box-sizing: border-box;
}

</style>