<template>
  <div>
    <mt-search
    v-model="value"
    palceholder="请搜索你喜欢的蛋糕"
    ></mt-search>
  </div>
</template>
<script>
export default {
  data(){
    return{
      value:''
    }
  }
}
</script>