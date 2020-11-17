import Vue from 'vue'
import VueRouter from 'vue-router'
import Cakeindex from '../views/Cakeindex.vue'
import CakeSort from '../views/CakeSort.vue'
import CakeList from '../views/CakeList.vue'


Vue.use(VueRouter)

const routes = [
  {
    path: '/',
    name: 'Cakeindex',
    component: Cakeindex
  },{
    path: '/cakesort',
    name: 'Cakesort',
    component: CakeSort
  },{
    path:'/cakelist',
    component:CakeList
  },
  
]

const router = new VueRouter({
  routes
})

export default router
