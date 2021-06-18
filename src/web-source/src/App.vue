<template>
  <div>//</div>
</template>

<script>
export default {
  mounted () {
    window.Echo.channel('TestEvent').listen('.TestEvent', (res) => {
      console.log(res)
    })
  }
}
</script>
