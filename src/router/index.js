import Vue from 'vue'
import VueRouter from 'vue-router'
import Cakeindex from '../views/Cakeindex.vue'
import Cakesort from '../views/Cakesort.vue'
import CakeCart from '../views/CakeCart.vue'
import Mine from '../views/Mine.vue'
import Details from '../views/Details.vue'
import Kefu from '../views/Kefu.vue'
import Login from '../views/Login.vue'
import Register from '../views/Register.vue'
import CakeList from '../views/CakeList.vue'
import Setup from '../views/Setup.vue'
import Shoppingcart from '../views/Shoppingcart.vue'
import Pay from '../views/pay.vue'
import ok from '../views/ok.vue'
import cakesearch from '../views/CakeSearch.vue'
import cakenofound from '../views/CakeNofound.vue'

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Cakeindex',
    component: Cakeindex
  },{
    path: '/cakeindex',
    name: 'Cakeindex',
    component: Cakeindex
  },{
    path: '/cakesort',
    name: 'Cakesort',
    component: Cakesort
  },{
    path: '/cakecart',
    name: 'CakeCart',
    component: CakeCart
  },{
    path: '/mine',
    name: 'Mine',
    component: Mine
  },{
    path: '/login',
    component: Login
  },
  {
    path: '/register',
    component: Register


  },{
    path:'/cakelist/:kw',
    component:CakeList
  },{
    path:'/cakeDetails/:id',
    component:Details
  },
  {
    path:'/setup',
    component:Setup

  },

   {
     path:'/shoppingcart/:cake',
     name:'Shoppingcart',
     component:Shoppingcart
  },{
    path:'/ok',
    name:'ok',
    component:ok
  },{
    path:'/Pay',
    name:'Pay',
    component:Pay
  },{
    path:'/kefu',
    component:Kefu
  },{
    path:'/cakesearch',
    component:cakesearch
  },{
    path:'/cakenofound',
    component:cakenofound
  }

  
  // {
  //   path:'/details',
  //   component:Details
  // }
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
]

const router = new VueRouter({
  routes
})
 
export default router
