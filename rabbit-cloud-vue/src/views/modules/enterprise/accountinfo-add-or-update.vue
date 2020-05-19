<template>
  <el-dialog
    :title="!dataForm.id ? '新增' : '修改'"
    :close-on-click-modal="false"
    :visible.sync="visible">
    <el-form :model="dataForm" :rules="dataRule" ref="dataForm" @keyup.enter.native="dataFormSubmit()" label-width="80px">
    <el-form-item label="名称" prop="name">
      <el-input v-model="dataForm.name" placeholder="名称，平台名称等"></el-input>
    </el-form-item>
    <el-form-item label="主账号" prop="master">
      <el-input v-model="dataForm.master" placeholder="主账号"></el-input>
    </el-form-item>
    <el-form-item label="从账号" prop="salve">
      <el-input v-model="dataForm.salve" placeholder="从账号，多个用|隔开"></el-input>
    </el-form-item>
    <el-form-item label="登录密码" prop="loginPassword">
      <el-input v-model="dataForm.loginPassword" placeholder="登录密码"></el-input>
    </el-form-item>
    <el-form-item label="交易密码" prop="tradePassword">
      <el-input v-model="dataForm.tradePassword" placeholder="交易密码"></el-input>
    </el-form-item>
    <el-form-item label="有效期" prop="validPeriod">
      <el-input v-model="dataForm.validPeriod" placeholder="有效期，长期或区间"></el-input>
    </el-form-item>
    <el-form-item label="类型" prop="type">
		<el-radio-group v-model="dataForm.type">
			<el-radio :label="1">社交</el-radio>
			<el-radio :label="2">电商</el-radio>
			<el-radio :label="3">银行</el-radio>
			<el-radio :label="4">证券</el-radio>
			<el-radio :label="5">金融</el-radio>
			<el-radio :label="6">网站</el-radio>
			<el-radio :label="100">其他</el-radio>			
		</el-radio-group>	  
    </el-form-item>
    <el-form-item label="链接" prop="linker">
      <el-input v-model="dataForm.linker" placeholder="链接"></el-input>
    </el-form-item>
    <el-form-item label="状态" prop="status">
		<el-radio-group v-model="dataForm.status">
			<el-radio :label="1">有效</el-radio>
			<el-radio :label="0">无效</el-radio>			
		</el-radio-group>
    </el-form-item>
    <el-form-item label="备注" prop="remark">
      <el-input v-model="dataForm.remark" placeholder="备注"></el-input>
    </el-form-item>
    </el-form>
    <span slot="footer" class="dialog-footer">
      <el-button @click="visible = false">取消</el-button>
      <el-button type="primary" @click="dataFormSubmit()">确定</el-button>
    </span>
  </el-dialog>
</template>

<script>
  export default {
    data () {
      return {
        visible: false,
        dataForm: {
          id: 0,
          name: null,
          master: null,
          salve: null,
          loginPassword: null,
          tradePassword: null,
          validPeriod: null,
          type: 100,
          linker: null,
          status: 1,
          remark: null
        },
        dataRule: {
          name: [
            { required: true, message: '名称，平台名称等不能为空', trigger: 'blur' }
          ],
          master: [
            { required: true, message: '主账号不能为空', trigger: 'blur' }
          ],
          salve: [
            { required: false, message: '从账号，多个用|隔开不能为空', trigger: 'blur' }
          ],
          loginPassword: [
            { required: false, message: '登录密码不能为空', trigger: 'blur' }
          ],
          tradePassword: [
            { required: false, message: '交易密码不能为空', trigger: 'blur' }
          ],
          validPeriod: [
            { required: false, message: '有效期，长期或区间不能为空', trigger: 'blur' }
          ],
          type: [
            { required: true, message: '类型，1-社交，2-电商，3-银行，4-证券，5-金融，6-网站，100-其他不能为空', trigger: 'blur' }
          ],
          linker: [
            { required: false, message: '链接不能为空', trigger: 'blur' }
          ],
          status: [
            { required: true, message: '状态，1-有效，0-无效不能为空', trigger: 'blur' }
          ],
          remark: [
            { required: false, message: '备注不能为空', trigger: 'blur' }
          ]
        }
      }
    },
    methods: {
      init (id) {
        this.dataForm.id = id || 0
        this.visible = true
        this.$nextTick(() => {
          this.$refs['dataForm'].resetFields()
          if (this.dataForm.id) {
            this.$http({
              url: this.$http.adornUrl(`/enterprise/accountinfo/info/${this.dataForm.id}`),
              method: 'get',
              params: this.$http.adornParams()
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.dataForm.name = data.accountinfo.name
                this.dataForm.master = data.accountinfo.master
                this.dataForm.salve = data.accountinfo.salve
                this.dataForm.loginPassword = data.accountinfo.loginPassword
                this.dataForm.tradePassword = data.accountinfo.tradePassword
                this.dataForm.validPeriod = data.accountinfo.validPeriod
                this.dataForm.type = data.accountinfo.type
                this.dataForm.linker = data.accountinfo.linker
                this.dataForm.status = data.accountinfo.status
                this.dataForm.remark = data.accountinfo.remark
              }
            })
          }
        })
      },
      // 表单提交
      dataFormSubmit () {
        this.$refs['dataForm'].validate((valid) => {
          if (valid) {
            this.$http({
              url: this.$http.adornUrl(`/enterprise/accountinfo/${!this.dataForm.id ? 'save' : 'update'}`),
              method: 'post',
              data: this.$http.adornData({
                'id': this.dataForm.id || undefined,
                'name': this.dataForm.name,
                'master': this.dataForm.master,
                'salve': this.dataForm.salve,
                'loginPassword': this.dataForm.loginPassword,
                'tradePassword': this.dataForm.tradePassword,
                'validPeriod': this.dataForm.validPeriod,
                'type': this.dataForm.type,
                'linker': this.dataForm.linker,
                'status': this.dataForm.status,
                'remark': this.dataForm.remark
              })
            }).then(({data}) => {
              if (data && data.code === 0) {
                this.$message({
                  message: '操作成功',
                  type: 'success',
                  duration: 1500,
                  onClose: () => {
                    this.visible = false
                    this.$emit('refreshDataList')
                  }
                })
              } else {
                this.$message.error(data.msg)
              }
            })
          }
        })
      }
    }
  }
</script>
