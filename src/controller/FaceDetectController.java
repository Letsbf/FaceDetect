package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping("/facedetect")
public class FaceDetectController {

    @ResponseBody
    @RequestMapping("/test")
    public Object test() {
        return "test";
    }
}
