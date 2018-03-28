package controller;


import dao.AdminDao;
import domain.Admin;
import helper.Util;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;

@Controller
public class AdminController {

    @Autowired
    private AdminDao adminDao;

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

    @RequestMapping(value = "/login", method = RequestMethod.POST)
    @ResponseBody
    public Object login(@RequestParam("username") String username,
                        @RequestParam("password") String password,
                        HttpSession session) {
        if (Util.isEmpty(username) || Util.isEmpty(password)) {
            return Util.constructResponse(Util.FAILED, "账户密码不能为空", "");
        }
        Admin admin = adminDao.selectAdmin(username);
        if (admin == null) {
            return Util.constructResponse(Util.FAILED, "该用户不存在！", "");
        }
        if (!admin.getPassword().equals(password)) {
            return Util.constructResponse(Util.FAILED, "密码不正确！", "");
        }
        session.setAttribute("user", username);
        return Util.constructResponse(Util.SUCCESS, "登陆成功！", "");
    }



}
