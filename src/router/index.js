import Vue from 'vue'
import VueRouter from 'vue-router'
import Cakeindex from '../views/Cakeindex.vue'
<<<<<<< HEAD
import CakeSort from '../views/CakeSort.vue'
import CakeList from '../views/CakeList.vue'

=======
import Cakesort from '../views/Cakesort.vue'
import CakeCart from '../views/CakeCart.vue'
import Mine from '../views/Mine.vue'
import Search from '../components/Search.vue'
>>>>>>> d13900916c285b685f87ceda9e03058087538ffa

Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Cakeindex',
    component: Cakeindex
  },{
<<<<<<< HEAD
    path: '/cakesort',
    name: 'Cakesort',
    component: CakeSort
  },{
    path:'/cakelist',
    component:CakeList
  },
  
=======
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
    path: '/search',
    name: 'Search',
    component: Search
  }
  // {
  //   path: '/about',
  //   name: 'About',
  //   // route level code-splitting
  //   // this generates a separate chunk (about.[hash].js) for this route
  //   // which is lazy-loaded when the route is visited.
  //   component: () => import(/* webpackChunkName: "about" */ '../views/About.vue')
  // }
>>>>>>> d13900916c285b685f87ceda9e03058087538ffa
]

const router = new VueRouter({
  routes
})

export default router
