package com.sages.proj.service;

import com.sages.proj.dao.AccountDaoImpl;
import com.sages.proj.entity.Account;

public class LoginService {

    public Account logIn(Account acc){
        AccountDaoImpl accountDao = new AccountDaoImpl();
        Account account = accountDao.getAccountByLogin(acc.getLogin());
        if(acc == null){
            return null;
        }else {
            if(acc.getPass().equals(account.getPass())){
                return account;
            }
        }
        return null;
    }

}
