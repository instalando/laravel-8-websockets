import Vue from 'vue'
import App from './App.vue'
import router from './router'
import store from './store'
import Echo from 'laravel-echo'

Vue.config.productionTip = false

window.Pusher = require('pusher-js')

window.Echo = new Echo({
  broadcaster: 'pusher',
  key: process.env.VUE_APP_PUSHER_APP_KEY,
  cluster: process.env.VUE_APP_PUSHER_APP_CLUSTER,
  host: 'api.localhost',
  wsHost: window.location.hostname,
  wsPort: 6001,
  forceTLS: false,
  disableStats: true,
  authEndpoint: 'http://api.localhost/broadcasting/auth'
})

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app')
