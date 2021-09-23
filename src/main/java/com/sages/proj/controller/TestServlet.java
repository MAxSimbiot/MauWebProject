package com.sages.proj.controller;

import com.sages.proj.command.*;
import com.sages.proj.constants.Constants;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/Servlet")
public class TestServlet extends HttpServlet {
    private Map<String, Command> commands;

    @Override
    public void init() {
        commands = new HashMap<>();
        commands.put(Constants.CHANGE_LANGUAGE,new ChangeLanguageCommand());
        commands.put(Constants.LOGIN,new LogInCommand());
        commands.put(Constants.LOG_OUT,new LogOutCommand());
        commands.put(Constants.REGISTER,new RegisterCommand());
        commands.put(Constants.ENTER_CABINET,new EnterCabinetCommand());
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        process(req,resp);
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws IOException, ServletException {
        process(req,resp);
    }


    private void process(HttpServletRequest request,HttpServletResponse response) throws ServletException, IOException {
        Command command = commands.get(request.getParameter(Constants.COMMAND));
        Map<String,Object> map = command.execute(request,response);
        for(Map.Entry<String,Object> entry : map.entrySet()){
            request.setAttribute(entry.getKey(),entry.getValue());
        }
        getServletContext().getRequestDispatcher((String) map.get(Constants.PAGE)).forward(request,response);
    }



}
