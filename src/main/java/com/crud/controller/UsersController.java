package com.crud.controller;

import com.crud.model.User;
import com.crud.service.UsersService;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.io.IOException;
import java.util.List;

/**
 * Created by home on 2/28/17.
 */
@Controller
public class UsersController {

    @Autowired
    private UsersService usersService;

    @RequestMapping(value = {"/users", "/"}, method = RequestMethod.GET)
    public String getAllUsers(Model model) {
        model.addAttribute("users", usersService.getAllUser());
        return "redirect:/users/1";
    }

    @RequestMapping(value = "/users/{id}/delete")
    public String deleteUser(@PathVariable("id") int id) {
        usersService.deleteUser(id);
        return "redirect:/users";
    }

    @RequestMapping(value = "/users/add", method = RequestMethod.GET)
    public String showAddUserForm(Model model) {
        model.addAttribute("command", new User());
        return "userForm";
    }

    @RequestMapping(value = "/users/submit", method = RequestMethod.POST)
    public String addUser(@ModelAttribute("User") User user) {
        if (user.getId() == null) {
            usersService.saveUser(user);
        } else {
            usersService.updateUser(user);
        }
        return "redirect:/users";
    }

    @RequestMapping(value = "/users/{id}/edit", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") int id, Model model) {
        model.addAttribute("command", usersService.getUser(id));
        return "userForm";
    }

    @RequestMapping(value = "/search/")
    public String searchUsers(@RequestParam("searchString") String searchString, Model model) {
        model.addAttribute("user", new User());
        model.addAttribute("users", usersService.searchUser(searchString));
        model.addAttribute("usersCount", usersService.getUsersCount(searchString));
        return "search";
    }

    @RequestMapping(value = "/users/{page}")
    public String pageUsers(@PathVariable("page") int page, Model model) {
        int rowsPerPage = 10;
        model.addAttribute("user", new User());
        model.addAttribute("users", usersService.getAllUsersWithPagination(rowsPerPage, page, ""));
        model.addAttribute("usersCount", usersService.getAllUsersCount());
        model.addAttribute("page", page);
        model.addAttribute("rowsPerPage", rowsPerPage);
        return "users";
    }

    @RequestMapping(value = "/error")
    @ExceptionHandler({Exception.class})
    public String handleIOException(Exception exception, Model model) {
        model.addAttribute("exception", exception);
        return "error";
    }
}
