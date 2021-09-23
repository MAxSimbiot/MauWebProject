package com.sages.proj.command;

import com.sages.proj.constants.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class LogOutCommand implements Command {
    @Override
    public Map<String, Object> execute(HttpServletRequest request, HttpServletResponse response) {
        request.getSession().invalidate();
        Map<String,Object> map = new HashMap<>();
        map.put(Constants.PAGE,Constants.INDEX_JSP);
        return map;
    }
}
