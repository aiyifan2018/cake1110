import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import MintUi from 'mint-ui'
<<<<<<< HEAD



import vuesocketio from 'vue-socket.io'
import SocketIO from 'socket.io-client';
console.log(vuesocketio)
Vue.use(new vuesocketio({ 
	debug: true,
	connection: SocketIO('http://127.0.0.1:3000', {
		transports: ['websocket', 'polling', 'flashsocket']
	})
}));

=======
import axios from 'axios'
import qs from 'qs'
import moment from 'moment'
>>>>>>> 0281fc83663fbb08fec2ad9ea178d67919d06bb2
import 'mint-ui/lib/style.css'
Vue.use(MintUi)

// import Vant from 'vant';
// import 'vant/lib/index.css';
// import 'mint-ui/lib/style.css'
Vue.use(MintUi)
//Vue.use(Vant)

axios.defaults.baseURL = 'http://127.0.0.1:3000'
Vue.prototype.axios = axios;

Vue.config.productionTip = false
Vue.prototype.moment=moment
Vue.prototype.qs=qs
new Vue({
	router,
	store,
	render: h => h(App)
}).$mount('#app')
