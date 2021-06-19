import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Echo from 'laravel-echo'

Vue.config.productionTip = false

window.Pusher = require('pusher-js')

Vue.prototype.$echo = new Echo({
  broadcaster: 'pusher',
  key: process.env.VUE_APP_PUSHER_APP_KEY,
  cluster: process.env.VUE_APP_PUSHER_APP_CLUSTER,
  host: 'localhost',
  wsHost: window.location.hostname,
  wsPort: 6001,
  forceTLS: false,
  disableStats: true,
  authEndpoint: 'http://api.localhost/broadcasting/auth'
  // auth: {
  //   headers: {
  //     Authorization: 'Bearer ' + ''
  //   }
  // }
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
