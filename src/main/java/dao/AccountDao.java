package dao;

import entity.Account;

public interface AccountDao {
    Account getAccountByLogin(String login);
}
