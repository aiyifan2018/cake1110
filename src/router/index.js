import Vue from 'vue'
import VueRouter from 'vue-router'
import Cakeindex from '../views/Cakeindex.vue'
import Cakesort from '../views/Cakesort.vue'
import CakeCart from '../views/CakeCart.vue'
import Mine from '../views/Mine.vue'
import Me from '../views/Me.vue'
<<<<<<< HEAD
import Login from '../views/Login.vue'
import Reight from '../views/Reight.vue'
=======
import Search from '../components/Search.vue'

 
import Login from '../views/Login.vue'
import Reight from '../views/Reight.vue'

import CakeList from '../views/CakeList.vue'

>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46

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
    component: Me
  },{
    path: '/search',
    name: 'Search',
    component: Search
  },
  
  {
<<<<<<< HEAD
    path: '/me',
    component: Me
  },
  {
=======
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
    path: '/login',
    component: Login
  },
  {
    path: '/reight',
    component: Reight
<<<<<<< HEAD
=======

  },{
    path:'/cakelist',
    component:CakeList
>>>>>>> 8f85a24f514e7e33a97eeaee75edbfc3cac17c46
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
