<template>
  <div>
    <h1><i class="el-icon-s-tools"></i>&nbsp;{{sysname}}</h1>
    <el-row>
      <el-button type="primary"
       @click="toadd()"
       icon="el-icon-share">新增</el-button>
    </el-row>
    <el-row>
      <el-table :data="list">
        <el-table-column prop="name" label="书名" width="120">

        </el-table-column>
        <el-table-column prop="author" label="作者" width="130">

        </el-table-column>
        <el-table-column prop="price" label="价格" width="70">

        </el-table-column>
        <el-table-column prop="intro"label="介绍">

        </el-table-column>
        <el-table-column label="功能">
          <template slot-scope="s">
            <el-button type="warning"
             @click="toupdate(s.$index, s.row)"
             icon="el-icon-edit">修改</el-button>

            <el-button type="danger" icon="el-icon-delete"
             @click="del(s.$index)">删除</el-button>
          </template>
        </el-table-column>
      </el-table>

      <el-dialog title="提示信息" :visible.sync="dialogVisible"
          width="30%">
        <div>
          <el-form :model="m" label-width="40px">
            <el-form-item label="书名">
              <el-input v-model="m.name" placeholder="请输入书名..."></el-input>
            </el-form-item>
            <el-form-item label="作者">
              <el-input v-model="m.author" placeholder="请输入作者..."></el-input>
            </el-form-item>
            <el-form-item label="价格">
              <el-input v-model="m.price" placeholder="请输入价格..."></el-input>
            </el-form-item>
            <el-form-item label="介绍">
              <el-input v-model="m.intro" placeholder="请输入介绍..." type="textarea"></el-input>
            </el-form-item>
          </el-form>
        </div>
        <div slot="footer" class="dialog-footer">
          <el-button @click="dialogVisible=false">取消</el-button>
          <el-button @click="save">确定</el-button>
        </div>
      </el-dialog>
    </el-row>


  </div>
</template>

<script>
export default {
  name:"Book",
  data(){
    return {
      sysname: "京淘图书管理系统",
      dialogVisible: false,
      isUpdate: false,
      index: null,
      m: {
        name:null,
        author:null,
        price:null,
        intro:null
      },
      list: [
        {name:"java核心技术卷", author:"凯·S.霍斯特曼", price:"109.30", intro:"伴随着Java的成长“《Java核心技术》从第1版到第10版一路走来，得到了广大Java程序设计人员的青睐，成为一本畅销不衰的Java经典图书。"},
        {name:"Java编程思想（第4版）", author:"[美] Bruce Eckel", price: "79.20", intro:"设计模式贯穿于众多示例中：适配器、桥接器、职责链、命令、装饰器、外观、工厂方法、享元、点名、数据传输对象、空对象、代理、单例、状态、策略、模板方法以及访问者。"}
      ]
    }
  },
  methods:{
    toadd: function(){
      this.isUpdate = false
      this.dialogVisible = true
    },
    toupdate: function(index, row){
      this.isUpdate = true
      this.dialogVisible = true
      this.m = this.copy(row)

      //this.index代表，data中数据，index代表函数参数
      this.index = index
    },
    save: function(){
      if(this.isUpdate){
        console.log("全局：index："+this.index)
        this.list.splice(this.index, 1, this.m)     //修改
      }else{
        //参数1：0 新增的元素放在第一行，参数2：0代表不删除
        //在最后面加 this.list.splice( this.list.length, 0, this.m)
        this.list.splice(0, 0, this.m)
      }
      this.dialogVisible = false //对话框关闭
      this.m = {}   //把模型m的属性值置空
    },
    del: function(index){
      //删除这个当前行元素，参数1：删除位置，参数2：删除个数
      this.list.splice(index, 1)
    },
    copy: function(oldObj){ //复制对象
      var newObj = {}
      for(var o in oldObj){   //for循环遍历，o代表下标
        newObj[o] = oldObj[o]
      }
      return newObj;
    }
  }
}
</script>

<style>
  textarea{
    font-family: 微软雅黑;
  }
</style>
