package com.sages.proj.command;

import com.sages.proj.constants.Constants;
import com.sages.proj.dao.ItemDaoImpl;
import com.sages.proj.entity.Account;
import com.sages.proj.entity.Item;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class EnterCabinetCommand implements Command{
    @Override
    public Map<String, Object> execute(HttpServletRequest request, HttpServletResponse response) {
        Map<String,Object> map = new HashMap<>();
        Account account = (Account) request.getSession().getAttribute("user");
        if(account!= null){
           map = initCabinet(account);
        }else{
            request.getSession().invalidate();
            map.put(Constants.PAGE,Constants.INDEX_JSP);
        }
        return map;
    }

    private Map<String,Object> initCabinet(Account account){
        Map<String,Object> map = new HashMap<>();
        String role = account.getRole().toString().toLowerCase();
        map.put(Constants.PAGE,Constants.HOME + role + Constants.HOME_JSP);
        map.put(Constants.INVENTORY,getInventory(account));
        return map;
    }

    private List<Item> getInventory(Account acc){
        ItemDaoImpl itemDao = new ItemDaoImpl();
        return itemDao.getInventoryByAccountId(acc.getId());
    }

}
