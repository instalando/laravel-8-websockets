<template>
  <div>//</div>
</template>

<script>
export default {
  mounted () {
    setTimeout(() => {
      this.$echo
        .channel('test')
        .listen('.TestEvent', function (res) {
          console.log(res)
        })
    }, 3000)
  },
  beforeDestroy () {
    this.$echo.leave('test')
  }
}
</script>
