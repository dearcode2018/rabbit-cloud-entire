<template>
  <div class="mod-config">
    <el-form :inline="true" :model="dataForm" @keyup.enter.native="getDataList()">
      <el-form-item>
        <el-input v-model="dataForm.key" placeholder="参数名" @input="getDataList()" clearable></el-input>
      </el-form-item>
      <el-form-item>
        <el-button @click="getDataList()" type="info">查询</el-button>
        <el-button v-if="isAuth('enterprise:accountinfo:save')" type="primary" @click="addOrUpdateHandle()">新增</el-button>
        <el-button v-if="isAuth('enterprise:accountinfo:delete')" type="danger" @click="deleteHandle()" :disabled="dataListSelections.length <= 0">批量删除</el-button>
      </el-form-item>
		<!-- @input 监听 输入框、下拉框的变化，调用搜索方法刷新视图即可 1-社交，2-电商，3-银行，4-证券，5-金融，6-网站，100-其他 -->
		<el-select v-model="dataForm.type" placeholder="请选择" @input="getDataList()">
			<!--参数为空不用定义 -->			
			<el-option label="类型" />			
			<el-option value="1" label="社交" />
			<el-option value="2" label="电商" />	
			<el-option value="3" label="银行" />			
			<el-option value="4" label="证券" />			
			<el-option value="5" label="金融" />		
			<el-option value="6" label="网站" />	
			<el-option value="100" label="其他" />				
		</el-select>		
		<el-select v-model="dataForm.status" placeholder="请选择" @input="getDataList()">
			<!--参数为空不用定义 -->			
			<el-option label="状态" />			
			<el-option value="1" label="有效" selected="true" />
			<el-option value="0" label="无效" />				
		</el-select>	  
    </el-form>
    <el-table
      :data="dataList"
      border
      v-loading="dataListLoading"
      @selection-change="selectionChangeHandle"
      style="width: 100%;">
      <el-table-column
        type="selection"
        header-align="center"
        align="center"
        width="50">
      </el-table-column>
      <el-table-column
        prop="name"
        header-align="center"
        align="center"
        label="名称">
      </el-table-column>
      <el-table-column
        prop="master"
        header-align="center"
        align="center"
        label="主账号" width="200">
      </el-table-column>
      <el-table-column
        prop="salve"
        header-align="center"
        align="center"
        label="从账号" width="400">
      </el-table-column>
      <el-table-column
        prop="validPeriod"
        header-align="center"
        align="center"
        label="有效期">
      </el-table-column>
      <el-table-column
        prop="type"
        header-align="center"
        align="center"
        label="类型" width="100">
      <template slot-scope="scope">
        <!-- 通过（scope.row）拿到当前行数据-->
		<div v-if="scope.row.type==1">社交</div>
		<div v-else-if="scope.row.type==2">电商</div>
		<div v-else-if="scope.row.type==3">银行</div>		
		<div v-else-if="scope.row.type==4">证券</div>		
		<div v-else-if="scope.row.type==5">金融</div>		
		<div v-else-if="scope.row.type==6">网站</div>		
		<div v-else-if="scope.row.type==100">其他</div>				
		<div v-else>未知</div>				
      </template>				
      </el-table-column>
      <el-table-column
        prop="status"
        header-align="center"
        align="center"
        label="状态" width="70">
      <template slot-scope="scope">
        <!-- 通过（scope.row）拿到当前行数据-->
		<div v-if="scope.row.status==1">有效</div>
		<div v-else-if="scope.row.status==0">无效</div>		
		<div v-else>未知</div>				
      </template>				
      </el-table-column>
      <el-table-column
        prop="updateGmt"
        header-align="center"
        align="center"
        label="更新时间">
      </el-table-column>
      <el-table-column
        prop="createGmt"
        header-align="center"
        align="center"
        label="创建时间">
      </el-table-column>
      <el-table-column
     	v-if="isAuth('enterprise:accountinfo:update') || isAuth('enterprise:accountinfo:delete')"
        fixed="right"
        header-align="center"
        align="center"
        width="150"
        label="操作">
        <template slot-scope="scope">
          <el-button v-if="isAuth('enterprise:accountinfo:update')" type="text" size="small" @click="addOrUpdateHandle(scope.row.id)">修改</el-button>
          <el-button v-if="isAuth('enterprise:accountinfo:delete')" type="text" size="small" @click="deleteHandle(scope.row.id)">删除</el-button>
        </template>
      </el-table-column>
    </el-table>
    <el-pagination
      @size-change="sizeChangeHandle"
      @current-change="currentChangeHandle"
      :current-page="pageIndex"
      :page-sizes="[10, 20, 50, 100]"
      :page-size="pageSize"
      :total="totalPage"
      layout="total, sizes, prev, pager, next, jumper">
    </el-pagination>
    <!-- 弹窗, 新增 / 修改 -->
    <add-or-update v-if="addOrUpdateVisible" ref="addOrUpdate" @refreshDataList="getDataList"></add-or-update>
  </div>
</template>

<script>
  import AddOrUpdate from './accountinfo-add-or-update'
  export default {
    data () {
      return {
        dataForm: {
          key: ''
        },
        dataList: [],
        pageIndex: 1,
        pageSize: 10,
        totalPage: 0,
        dataListLoading: false,
        dataListSelections: [],
        addOrUpdateVisible: false
      }
    },
    components: {
      AddOrUpdate
    },
    activated () {
      this.getDataList()
    },
    methods: {
      // 获取数据列表
      getDataList () {
        this.dataListLoading = true
        this.$http({
          url: this.$http.adornUrl('/enterprise/accountinfo/list'),
          method: 'get',
          params: this.$http.adornParams({
            'page': this.pageIndex,
            'limit': this.pageSize,
            'key': this.dataForm.key,
            'type': this.dataForm.type,			
            'status': this.dataForm.status			
          })
        }).then(({data}) => {
          if (data && data.code === 0) {
            this.dataList = data.page.list
            this.totalPage = data.page.totalCount
          } else {
            this.dataList = []
            this.totalPage = 0
          }
          this.dataListLoading = false
        })
      },
      // 每页数
      sizeChangeHandle (val) {
        this.pageSize = val
        this.pageIndex = 1
        this.getDataList()
      },
      // 当前页
      currentChangeHandle (val) {
        this.pageIndex = val
        this.getDataList()
      },
      // 多选
      selectionChangeHandle (val) {
        this.dataListSelections = val
      },
      // 新增 / 修改
      addOrUpdateHandle (id) {
        this.addOrUpdateVisible = true
        this.$nextTick(() => {
          this.$refs.addOrUpdate.init(id)
        })
      },
      // 删除
      deleteHandle (id) {
        var ids = id ? [id] : this.dataListSelections.map(item => {
          return item.id
        })
        this.$confirm(`确定对[id=${ids.join(',')}]进行[${id ? '删除' : '批量删除'}]操作?`, '提示', {
          confirmButtonText: '确定',
          cancelButtonText: '取消',
          type: 'warning'
        }).then(() => {
          this.$http({
            url: this.$http.adornUrl('/enterprise/accountinfo/delete'),
            method: 'post',
            data: this.$http.adornData(ids, false)
          }).then(({data}) => {
            if (data && data.code === 0) {
              this.$message({
                message: '操作成功',
                type: 'success',
                duration: 1500,
                onClose: () => {
                  this.getDataList()
                }
              })
            } else {
              this.$message.error(data.msg)
            }
          })
        })
      }
    }
  }
</script>
