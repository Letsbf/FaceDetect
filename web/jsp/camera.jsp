<%@page language="java" contentType="text/html;charset=UTF-8" pageEncoding="UTF-8" %>
<html>

<head lang="en">
    <meta charset="UTF-8">
    <title></title>
    <link rel="stylesheet" href="../css/camera.css">
    <script src="https://cdn.bootcss.com/jquery/3.3.1/jquery.min.js"></script>
</head>

<body>
    <div class="camera-container">
        <div id="support"></div>
        <div class="img-container">
            <video id="video" width="320" height="320" autoplay></video>
            <canvas style="" id="canvas" width="320" height="180"></canvas>
        </div>
        <div class="button-container">
            <input type="button" id="snap" class="take-button" value="拍 照" />
            <input type="button" id="upload-button" class="take-button" value="上 传">
            <input type="button" id="reset" class="take-button" value="清 空">
            <input type="file" id="upload" name="img" value="上 传" accept=" image/* " hidden>
        </div>
    </div>

    <script>
        //判断浏览器是否支持HTML5 Canvas
        window.onload = function () {
            try {
                //动态创建一个canvas元 ，并获取他2Dcontext。如果出现异常则表示不支持 
                document.createElement("canvas").getContext("2d");
                document.getElementById("support").style.display = 'none';
            }
            catch (e) {
                document.getElementById("support").innerHTML = "浏览器不支持HTML5 CANVAS";
            }
        };
        //这段代 主要是获取摄像头的视频流并显示在Video 签中
        window.addEventListener("DOMContentLoaded", function () {
            var rest = document.getElementById('reset');
            var upload = document.getElementById('upload');
            var uploadButton = document.getElementById('upload-button');
            var snap = document.getElementById('snap');
            var canvas = document.getElementById("canvas"),
                context = canvas.getContext("2d"),
                video = document.getElementById("video"),
                videoObj = { "video": true },
                errBack = function (error) {
                    console.log("Video capture error: ", error.code);
                };

            snap.addEventListener('click', function () {
                context.drawImage(video, 0, 0, 320, 180);
                upload.value = "";
            });
            upload.addEventListener('change', function(){
                var file = this.files[0];//获取input输入的图片
                if (!/image\/\w+/.test(file.type)) {
                    alert("请确保文件为图像类型");
                    return false;
                }//判断是否图片，在移动端由于浏览器对调用file类型处理不同，虽然加了accept = 'image/*'，但是还要再次判断
                var reader = new FileReader();
                reader.readAsDataURL(file);//转化成base64数据类型
                reader.onload = function (e) {
                    var img = new Image;
                    img.src = this.result;
                    img.onload = function(){
                        context.drawImage(img, 0, 0, 320, 180);
                    }
                }
            });
            uploadButton.addEventListener('click', function () {
                upload.click();
            })
            reset.addEventListener('click', function(){
                upload.value = "";
                canvas.height = canvas.height;
            })
            //navigator.getUserMedia这个写法在Opera中好像是navigator.getUserMedianow
            if (navigator.getUserMedia) {
                navigator.getUserMedia(videoObj, function (stream) {
                    video.srcObject = stream;
                    video.play();
                }, errBack);
            } else if (navigator.webkitGetUserMedia) {
                navigator.webkitGetUserMedia(videoObj, function (stream) {
                    video.srcObject = window.webkitURL.createObjectURL(stream);
                    video.play();
                }, errBack);
            }

        }, false);

        //上传服务器
        // function CatchCode() {
        //     var canvans = document.getElementById("canvas");
        //     //获取浏览器页面的画布对象
        //     //以下开始编 数据
        //     var imgData = canvans.toDataURL();
        //     //将图像转换为base64数据
        //     var base64Data = imgData.substr(22);
        //     //在前端截取22位之后的字符串作为图像数据
        //     //开始异步上
        //     $.post("uploadImgCode.ashx", { "img": base64Data }, function (data, status) {
        //         if (status == "success") {
        //             if (data == "OK") {
        //                 alert("二维 已经解析");
        //             }
        //             else {
        //                 // alert(data);
        //             }
        //         }
        //         else {
        //             alert("数据上 失败");
        //         }
        //     }, "text");
        // }
    </script>
</body>

</html>