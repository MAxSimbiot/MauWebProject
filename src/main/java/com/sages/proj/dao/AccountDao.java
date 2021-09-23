package com.sages.proj.dao;

import com.sages.proj.entity.Account;

public interface AccountDao {
    Account getAccountByLogin(String login);
}
