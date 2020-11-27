<template>
	<div>
		<div class="user-list">
			<div @click="goback" style="font-size: 12px;padding: 10px;color: #888;">返回上一级</div>
			<!-- 聊天主窗口 -->
			<div class="box">
				<!-- 显示群聊的人数 -->
				<div class="box-hd">
					<h3 id="chatName" style="font-size: 10px;text-align: center;padding: 10px;">欢迎咨询大东亚客服<span id="userCount"></span></h3>
				</div>
				<!-- 聊天内容 -->
				<div class="box-bd" style="width: 90%;margin: auto;">
					<!-- 22 -->
				</div>
				<!-- 聊天窗口底部 -->
				<div class="box-ft">
					<!-- 工具栏 -->
					<div class="toolbar">
						<a href="javascript:;" title="图片" class="file">
							<label for="file"></label><input type="file" @change="filechange" id="file" style="display:none;">
						</a>
					</div>
					<!-- 内容输入区 -->
					<div @keydown.enter="ctrlEnter" class="content" style="padding: 10px;border: 1px solid #fff;width: 90%;margin-left: 5px;">
						<!-- div添加contenteditable即可编辑，像输入框 -->
						<div name="" id="content" class="text" contenteditable></div>
					</div>
					<!-- 发送按钮 -->
					<div class="action">
						ctrl+Enter  <a @click="clickButton" style="padding: 7px 10px;margin-right: 10px;border-radius: 5px;" class="btn-send" id="btn-send" href="javascript:;">发送</a>
					</div>
				</div>
			</div>
		</div>
	</div>
</template>
<script>
	export default {
		data() {
			return {
				data: "",
				avatar: '',
				username: '',
				uname:''
			};
		},
		mounted() {
			console.log("222222222")
			console.log(localStorage.getItem("userinfo"))
			if(localStorage.getItem("userinfo")===undefined){
				this.uname = "1234"
			}else{ 
			
					this.uname = JSON.parse(localStorage.getItem("userinfo"))[0].uname;
						console.log(this.uname);
			}
			 
			 
		},
		sockets: {
			// 接受图片
			reciveImage(data) {
					
				if(!data.roomName){
					roomname="";
				}else{
					console.log(typeof data);
					console.log(data);
           var roomname = data.roomName;
				}	
				if (roomname!=this.uname) {
					console.log("99999")
					document.querySelector(".box-bd").innerHTML +=
						`
					 <div class="message-box" style="display: flex;align-items: center;justify-content: flex-end">
					   <div class="my message">
					  <img width="40px" src="https://img.alicdn.com/bao/uploaded/i1/4165136336/O1CN011gMh9e1wfw5J12RXN_!!4165136336-0-lubanu-s.jpg" alt="" class="avatar">
				 	     <div class="content">
					       <div class="bubble">
					         <div class="bubble_cont"><img width="100px" src="${data.img}" ></div>
					       </div>
							 </div>
							  
					  
					   </div>
					 </div>
					 `
				} else {
					document.querySelector(".box-bd").innerHTML +=
						`
					 <div class="message-box">
					   <div class="other message" style="display: flex;align-items: center;justify-content: flex-end">
					 <img width="40px" src="https://img.alicdn.com/bao/uploaded/i1/4165136336/O1CN011gMh9e1wfw5J12RXN_!!4165136336-0-lubanu-s.jpg" alt="" class="avatar">
					 
					     
					     <div class="content">
					       <div class="bubble">
					         <div class="bubble_cont" style="margin-left: 15px;">
							  <img width="100px"  src="${data.img}" ></div>
					       </div>
					     </div>
					   </div>
					 </div> 
					 `
				}
			},
			// 接受数据
			reciveMessgae(data) { //'chaTmessage'事件返回值
				var content = document.getElementById("content");
				content.innerHTML = ""
				console.log("33333333"+this.uname)
				var roomname = "";
				console.log(data);
				
				if(!data.roomName){
					roomname="";
				}else{
					console.log(typeof data);
					console.log(data);
           var roomname = data.roomName;
				}		
				

				console.log(data)
				if (roomname!=this.uname) {
					
					document.querySelector(".box-bd").innerHTML +=
						`
						 <div class="message-box" style="margin-bottom: 10px;">
							 <div class="mymessage" style="display: flex;align-items: center;justify-content: flex-end;">
							 <div class="content" style="margin-left: 11px;">
						       <div class="bubble">
						         <div class="bubble_cont">${data.message}</div>
						       </div>
						     </div>
								 <img width="40px" src="${data.roomName=='111111'?'https://www.baidu.com/cache/ala_atom/app/ms_company_number/icon-kefu_88cd7fa.png':
								 'https://img.alicdn.com/bao/uploaded/i1/4165136336/O1CN011gMh9e1wfw5J12RXN_!!4165136336-0-lubanu-s.jpg'}" alt="" class="avatar">
						     
						   </div>
						 </div>
						 `
				} else { 
					document.querySelector(".box-bd").innerHTML +=
						`
						 <div class="message-box" style="margin-bottom: 10px;">
						   <div class="othermessage" style="display: flex;align-items: center;">
						     <img width="40px" class="othermessageimg" src="${this.uname=='111111'?'https://www.baidu.com/cache/ala_atom/app/ms_company_number/icon-kefu_88cd7fa.png':
								 'https://img.alicdn.com/bao/uploaded/i1/4165136336/O1CN011gMh9e1wfw5J12RXN_!!4165136336-0-lubanu-s.jpg'}" alt="" class="avatar">						
						     <div class="content" style="margin-left: 10px; " > 
						       <div class="bubble">
						         <div class="bubble_cont">${data.message}</div>
						       </div>
						     </div>
						   </div>
						 </div> 
						 `
				}
			}

		},
		methods: {
			// 返回上一级
			goback() {
				this.$router.go(-1);

			},
			// 上传图片
			filechange: function(e) {
				var thiss = e.target;
				var file = thiss.files[0];
				var fr = new FileReader();
				fr.readAsDataURL(file);
				console.log("333333333")
				fr.onload = () => {
					console.log(this.$socket)
					this.$socket.emit('sendImage', {
						username: "aaa",
						avatar: "https://img.alicdn.com/bao/uploaded/i1/4165136336/O1CN011gMh9e1wfw5J12RXN_!!4165136336-0-lubanu-s.jpg",
						img: fr.result
					})
				}
			},
			// ctrl加回车事件
			ctrlEnter:function(e) {
				var content = document.getElementById("content").innerHTML;		 
				if (e.ctrlKey && e.keyCode == 13 && content) { //用户点击了ctrl+enter触发
					this.clickButton();
				}
			},
			// 发送消息
			clickButton: function(e) {
				var content = document.getElementById("content").innerHTML;
				console.log(content);
				if (!content.trim()) {
					return;
				}
			 
				this.$socket.emit("sendMessage", {
					roomName: this.uname,
					message: content
				}); //发送信息到后台hello事件
			}
		}
	};
</script>
<style scoped>
	.info,
	.user .name {
		float: right;
		width: 190px;
		height: 40px;
		line-height: 40px;
		text-overflow: ellipsis;
		white-space: nowrap;
		overflow: hidden;
		justify-content: right;
	}

	.box-bd {
		width: 100%;
		height: 400px;
		overflow: auto;
		padding: 10px 0px;
	}

	/* 设置滚动条样式 */
	/* 滚动条整体样式 */
	.user-list ul::-webkit-scrollbar,
	.container .box .box-bd::-webkit-scrollbar,
	.box-ft #content::-webkit-scrollbar {
		width: 5px;
		height: 1px;
	}

	/* 滚动条里面的小方块 */
	.user-list ul::-webkit-scrollbar-thumb,
	.container .box .box-bd::-webkit-scrollbar-thumb,
	.box-ft #content::-webkit-scrollbar-thumb {
		border-radius: 4px;
		box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
		background: #f2f2f2;
	}

	/* 滚动条里面的轨道 */
	.user-list ul::-webkit-scrollbar-track,
	.container .box .box-bd::-webkit-scrollbar-track,
	.box-ft #content::-webkit-scrollbar-track {
		box-shadow: inset 0 0 5px rgba(0, 0, 0, 0.2);
		border-radius: 4px;
		background: #fff;
	}

	.box-ft {
		border-top: 1px solid #d6d6d6;
		width: 100%;
		height: 180px;
		/* overflow: hidden; */
	}

	.box-ft .toolbar {
		width: 100%;
		height: 40px;
		padding: 5px;
		box-sizing: border-box;
	}

	.box-ft .toolbar label {
		display: inline-block;
		width: 30px;
		height: 30px;
		cursor: pointer;
	}

	.box-ft .action {
		float: right;
		height: 40px;

		font-size: 12px;
		color: #9b9b9b;
	}

	.box-ft .action .btn-send {
		/* width: 40px; */
		display: inline-block;
		padding: 2px 25px;
		background: #fcfcfd;
		color: black;
		text-decoration: none;
		border: 1px solid #9b9b9b;
		font-size: 16px;
		border-radius: 3px;
	}

	.box-ft .action .btn-send:hover {
		background: #f8f8f8;
	}

	.box-ft .content,
	.box-ft #content {
		height: 80px;
		border: 0px solid black;
		background: #eeeeee;
		outline: none;
		width: 100%;
		font-size: 18px;
		overflow: auto;
	}

	.box-ft .toolbar a {
		display: inline-block;
		width: 30px;
		height: 30px;
		background: url(../images/icon.png);
		background-size: 487px 462px;
	}

	.box-ft .toolbar a.face {
		background-position: -404px -398px;
	}

	.box-ft .toolbar a.screen-cut {
		background-position: -30px -432px;
	}

	.box-ft .toolbar a.file {
		/* background-size: 487px 462px; */
		background-position: -120px -432px;
	}

	.box-bd .message-box {
		padding: 10px;
		position: relative;
	}

	.box-bd .message-box .content {
		max-width: 400px;
		display: inline-block;
		padding: 5px 10px;
		box-sizing: border-box;
		line-height: 30px;
		vertical-align: top;
		background: #fff;
		border-radius: 4px;
		position: relative;
	}

	/* 添加消息框中的小三角 */
	.box-bd .message-box .other .content::before {
		position: absolute;
		top: 14px;
		border: 6px solid transparent;
		content: "";
		left: -10px;
		border-right-color: #fff;
		border-right-width: 4px
	}

	.box-bd .message-box .my .content::after {
		position: absolute;
		left: 100%;
		top: 14px;
		border: 6px solid transparent;
		content: "";
		border-left-color: #b2e281;
		border-left-width: 4px
	}


	.box-bd .message-box .my .avatar,
	.box-bd .message-box .my .content {
		float: right;
		margin-right: 10px;
		background: #b2e281;
	}

	.box-bd .message-box .my::after {
		content: "";
		display: block;
		clear: both;
	}

	.nickname {
		position: absolute;
		top: -10px;
		color: #b7b7b7;
		font-size: 12px;
	}

	.system {
		text-align: center;
		color: #b7b7b7;
		font-size: 12px;
	}

	.system.leave {
		color: #cc3322;
	}

	.bubble_cont img {
		max-width: 300px;
	}

	ul .user {
		border-bottom: 1px solid #26292e;
	}

	.container .user-list .active {
		background: #3a3f45;
	}

	.bubble_toName {
		position: absolute;
		font-size: 12px;
		color: gray;
		top: 0;
		left: 100%;
		width: 30px;
		height: 40px;
		line-height: 40px;
		margin-left: 10px;
	}

	.my .bubble_toName {
		left: -40px;
	}

	.content {
		display: inline-block !important;
	}
</style>
