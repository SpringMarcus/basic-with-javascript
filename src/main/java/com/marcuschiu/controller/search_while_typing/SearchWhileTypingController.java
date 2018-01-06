package com.marcuschiu.controller.search_while_typing;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.marcuschiu.controller.Greeting;
import com.sun.tools.doclets.formats.html.SourceToHTMLConverter;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SearchWhileTypingController {

    @RequestMapping(value={"/search_while_typing_keyup"})
    public String searchWhileTypingKeyup() {
        return "search_while_typing_keyup";
    }

    @RequestMapping(value={"/search_while_typing_keyup"}, method = RequestMethod.POST)
    @ResponseBody
    public String searchWhileTypingKeyup(@ModelAttribute Greeting greeting) {

        System.out.println(greeting.getId() + " - " + greeting.getContent());

        Response response = new Response();

        ResponseSub responseSub1 = new ResponseSub();
        responseSub1.setHref("/");
        responseSub1.setDisplay("Home Page");
        response.addResponseSub(responseSub1);

        ResponseSub responseSub2 = new ResponseSub();
        responseSub2.setHref("http://www.google.com");
        responseSub2.setDisplay("Google!");
        response.addResponseSub(responseSub2);

        for (int i = 0; i < greeting.getContent().length(); i++) {
            ResponseSub responseSub3 = new ResponseSub();
            responseSub3.setHref(greeting.getContent());
            responseSub3.setDisplay(greeting.getContent());
            response.addResponseSub(responseSub3);
        }

        return encode(response);
    }

    private static String encode(Response example) {
        String s = "";

        try {
            ObjectMapper mapper = new ObjectMapper();
            s = mapper.writeValueAsString(example);
        } catch (JsonProcessingException e) {
            e.printStackTrace();
        }

        return s;
    }
}
