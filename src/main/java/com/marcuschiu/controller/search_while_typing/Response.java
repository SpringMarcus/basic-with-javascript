package com.marcuschiu.controller.search_while_typing;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

// JsonIgnoreProperties - when decoding a JSON string into this class,
// key-names that exist in the JSON string that does not exist in this class definition will be ignored
// without this JsonIgnoreProperties
@JsonIgnoreProperties(ignoreUnknown = true)
@Data
public class Response {

    private List<ResponseSub> response;

    public Response() {
        response = new ArrayList<>();
    }

    public void addResponseSub(ResponseSub responseSub) {
        response.add(responseSub);
    }
}
