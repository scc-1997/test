<template>
  <div id="app">
    <Book></Book>
  </div>
</template>

<script>
  /*
export default {
  name: 'App'
} */

/* 注册
 import 导入子组件
 components代表声明子组件集合，就调用子组件
 ./components/Book.vue 这个./必须写，不写报错
 */
import Book from './components/Book.vue'
export default {
  components:{
    Book
  }
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
