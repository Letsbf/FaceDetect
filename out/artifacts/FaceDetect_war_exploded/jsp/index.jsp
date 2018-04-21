<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>登陆</title>
    <link rel="stylesheet" href="../css/index.css">
</head>
<body>
    <div class="login-container">
        <div class="aside-container">
            <img src="../images/aside.jpg">
        </div>
        <div class="form-container">
            <form action="" method="POST">
                <input type="text" name="username" id="username" placeholder="用户名/邮箱/手机号" class="input-class">
                <input type="password" name="password" id="password" placeholder="密码" class="input-class">
                <input type="button" id="submit" value="登陆" class="submit-class" onclick="mySubmit()">
            </form>
        </div>
    </div>
    <script>
        function postJSON(url, data) {
            return new Promise((resolve, reject) => {
                var xhr = new XMLHttpRequest()
                xhr.open("POST", url, true)
                xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");

                xhr.onreadystatechange = function () {
                    if (this.readyState === 4) {
                        if (this.status === 200) {
                            resolve(JSON.parse(this.responseText), this)
                        } else {
                            var resJson = { code: this.status, response: this.response }
                            reject(resJson, this)
                        }
                    }
                }

                xhr.send(JSON.stringify(data))
            })
        }
        function mySubmit() {

            let username = document.getElementById('username');
            username = username.value || undefined;

            let password = document.getElementById('password');
            password = password.value || undefined;

            let data = {
                'username': username,
                'password': password,
            };

            let url = '/login';
            postJSON(url, data).then(value => console.log(value)).catch( error => console.log(error));

        }
    </script>
</body>
</html>