package com.final_project.controller.pub;


import com.final_project.services.UserManagementService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class UserManagementController {


    private UserManagementService userManagementService;

    @PostMapping("/addUser")
    public String addUser(@RequestParam("username") String username, @RequestParam("password") String password) {
        userManagementService.addUser(username, password);
        return "redirect:/login";
    }

    @PostMapping("/deleteUser")
    public String deleteUser(@RequestParam("username") String username) {
        userManagementService.deleteUser(username);
        return "redirect:/login";
    }
}
