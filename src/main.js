import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MintUi from 'mint-ui'



import vuesocketio from 'vue-socket.io'
import SocketIO from 'socket.io-client';
console.log(vuesocketio)
Vue.use(new vuesocketio({ 
	debug: true,
	connection: SocketIO('http://127.0.0.1:3000', {
		transports: ['websocket', 'polling', 'flashsocket']
	})
}));

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
