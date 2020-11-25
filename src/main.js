import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MintUi from 'mint-ui'
import bus from './bus'

Vue.prototype.bus=bus

import 'mint-ui/lib/style.css'
Vue.use(MintUi)
import axios from 'axios'

axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.axios = axios;

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
