import Vue from 'vue'
import VueRouter from 'vue-router'
import Cakeindex from '../views/Cakeindex.vue'
import Cakesort from '../views/Cakesort.vue'
import CakeCart from '../views/CakeCart.vue'
import Mine from '../views/Mine.vue'

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
  }
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
