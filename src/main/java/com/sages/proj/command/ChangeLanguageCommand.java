package com.sages.proj.command;

import com.sages.proj.constants.Constants;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

public class ChangeLanguageCommand implements Command {
    @Override
    public Map<String, Object> execute(HttpServletRequest request, HttpServletResponse response) {
        String language = request.getParameter("language");
        request.getSession().setAttribute("language",language);
        Map<String,Object> res = new HashMap<>();
        res.put(Constants.PAGE,Constants.INDEX_JSP);
        return res;
    }
}
