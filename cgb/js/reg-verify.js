//声明常量
const form = document.getElementById('form');
const username = document.getElementById('username');

//form后期绑定submit表单提交事件
form.addEventListener('submit', e => {
	//通知 Web 浏览器不要执行与事件关联的默认动作
	e.preventDefault();	//阻止系统默认的submit事件
	check();	//取而代之成自己定义的方法
})

//对页面的输入框进行校验
function check(){
	const usernameValue = username.value.trim();
	const emailValue = email.value.trim();
	const passwordValue = password.value.trim();
	const password2Value = password2.value.trim();
	
	if(usernameValue === ''){	//三个等号判断是否相等
		setErrorFor(username, '用户名不能为空');
	}else{
		setSuccessFor(username);
	}
	
	if(emailValue === ''){
		setErrorFor(email, '邮箱不能为空');
	}else if(!isEmail(emailValue)){
		setErrorFor(email, '邮箱格式不正确');
	}else{
		setSuccessFor(email);
	}
	
	if(passwordValue === ''){
		setErrorFor(password, '密码不能为空');
	}else{
		setSuccessFor(password);
	}
	
	if(password2Value === ''){
		setErrorFor(password2, '确认密码不能为空');
	}else if(passwordValue != password2Value){
		setErrorFor(password2, '两次密码不一致');
	}else{
		setSuccessFor(password2);
	}
}

//错误处理函数
function setErrorFor(input, message){
	//获取当前元素的父元素
	const formControl = input.parentElement;
	//找到同级的small标签
	const small = formControl.querySelector('small');
	
	formControl.className = 'form-control error';	//改变样式
	small.innerText = message;
}

//成功处理函数
function setSuccessFor(input){
	const formControl = input.parentElement; //获取父元素
	formControl.className = 'form-control success'; //改变样式
}

//正则表达式判断邮箱格式，这些都不是自己来写的，百度，拿来应用
function isEmail(email){
	return /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/.test(email);
}