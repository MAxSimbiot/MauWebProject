package com.sages.proj.dao;



import com.sages.proj.entity.Account;
import com.sages.proj.constants.*;
import com.sages.proj.entity.Role;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class AccountDaoImpl implements AccountDao {
    @Override
    public Account getAccountByLogin(String login) {
        Connection con = null;
        Account acc = null;
        try{
            con = DBManager.getConnection();
            PreparedStatement ps = con.prepareStatement(SQLconstants.GET_ACCOUNT_BY_LOGIN);
            ps.setString(1,login);
            acc = initAccount(ps);
        }catch (SQLException ex){

        }finally {
            DBManager.closeConnection(con);
        }
        return acc;
    }

    public Boolean insertAccount(Account account) throws SQLException {
        Connection con = null;
        try {
            con = DBManager.getConnection();
            con.setAutoCommit(false);
            PreparedStatement insertAccount = con.prepareStatement(SQLconstants.INSERT_ACCOUNT);
            initInsertStatement(account,insertAccount);
            insertAccount.executeUpdate();
            con.commit();
        }catch (SQLException ex){
            if (con != null) {
                con.rollback();
            }
            return false;
        }finally {
            DBManager.closeConnection(con);
            System.out.println("finally closed");
        }
        return true;
    }

    private void initInsertStatement(Account acc,PreparedStatement statement) throws SQLException {
      //  statement.setLong(1,acc.getId());
        statement.setString(1, acc.getLogin());
        statement.setString(2, acc.getPass());
        statement.setInt(3,acc.getZno_score());
        statement.setString(4,acc.getEmail());
        statement.setInt(5,acc.getMind_fuel());
        statement.setInt(6,acc.getLvl());
        statement.setString(7,acc.getRole().toString().toLowerCase());
        statement.setLong(8,acc.getLocation_id());
    }

    public boolean userExists(String login,String password){
        Account acc = getAccountByLogin(login);
        return (acc!=null&&acc.getPass().equals(password));
    }

    public Role getRoleByLoginPassword(String login,String password){
        if(userExists(login,password)){
            Account account = getAccountByLogin(login);
            return account.getRole();
        }
        return Role.UNKNOWN;
    }

     private Account initAccount(PreparedStatement ps) throws SQLException {
        ResultSet  rs = ps.executeQuery();
        if(rs.next()){
            Account res = new Account();
            res.setId(rs.getLong(Constants.ID));
            res.setLogin(rs.getString(Constants.LOGIN));
            res.setPass(rs.getString(Constants.PASSWORD));
            res.setZno_score(rs.getInt(Constants.ZNO_SCORE));
            res.setEmail(rs.getString(Constants.EMAIL));
            res.setMind_fuel(rs.getInt(Constants.MIND_FUEL));
            res.setLvl(rs.getInt(Constants.LVL));

            String role = rs.getString(Constants.ROLE);
            res.setRole(Role.valueOf(role.toUpperCase()));
            res.setLocation_id(rs.getInt(Constants.LOCATION_ID));

            return res;
        }
       return null;
    }


}
