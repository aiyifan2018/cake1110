<template>
	<div id="app">
		<router-view />
	</div>
</template>
<script>
	export default {
		data() {
			return {
				isShow:true
			}
		},
		watch: {
			$route(to, from) {
				if (this.$route.path ==="/kefu") {
					this.isShow = false;
				} else {
					this.isShow = true;
				}				 
			},
		}
	}
</script>
 