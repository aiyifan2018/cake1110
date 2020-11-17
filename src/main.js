import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
<<<<<<< HEAD
import MintUI from 'mint-ui'
import 'mint-ui/lib/style.min.css'
import axios from 'axios'

Vue.use(MintUI)
axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.axios = axios;
=======
import MintUi from 'mint-ui'

import 'mint-ui/lib/style.css'
Vue.use(MintUi)
>>>>>>> d13900916c285b685f87ceda9e03058087538ffa

Vue.config.productionTip = false

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
