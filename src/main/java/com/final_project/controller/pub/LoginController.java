package com.final_project.controller.pub;

import com.final_project.model.User;
import com.final_project.services.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class LoginController {

    private boolean validateUser(String username, String password) {
        // منطق بررسی کاربر را اینجا پیاده‌سازی کنید
        // اطمینان حاصل کنید که پسورد به صورت رمزنگاری شده ذخیره شده است.
        return "admin".equals(username) && "password".equals(password); // اینجا باید منطق واقعی را پیاده کنید
    }
    @Autowired
    private UserService userService;

    @GetMapping("/login.html")
    public String loginPage() {
        return "login"; // نام فایل login.html
    }

    @PostMapping("/login")
    public String login(@RequestParam String username, @RequestParam String password) {
        User user = userService.findUserByUsername(username);

        if (user != null && user.getDecryptedPassword().equals(password)) {
            return "redirect:/"; // به صفحه اصلی بروید
        }
        return "redirect:/login.html"; // در صورت خطا به صفحه ورود برگردید
    }
}
