package com.marcuschiu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class DefaultController {

    @RequestMapping(value={"/",""})
    public String home() {
        return "home";
    }

    @RequestMapping(value={"/get"})
    public String get() {
        return "get";
    }

    @RequestMapping(value={"/get/clicked"})
    public String getClicked() {
        return "get_clicked";
    }

    @RequestMapping(value={"/post"})
    public String post() {
        return "post";
    }

    @RequestMapping(value={"/post"}, method = RequestMethod.POST)
    public String post(@ModelAttribute Greeting greeting) {
        return "post";
    }
}
