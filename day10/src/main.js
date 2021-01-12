// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'

// 导入element-ui包，npm安装包 
// npm i element-ui -D
import ElementUI from 'element-ui'
// 导入element的css支持
import 'element-ui/lib/theme-chalk/index.css'

//引用这个element-ui
Vue.use(ElementUI)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})
