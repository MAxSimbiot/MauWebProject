package dao;

import Constants.Constants;
import Constants.SQLConstants;
import entity.Account;

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
            PreparedStatement ps = con.prepareStatement(SQLConstants.GET_ACCOUNT_BY_LOGIN);
            ps.setString(1,login);
            acc = initAccount(ps);
        }catch (SQLException ex){

        }finally {
            DBManager.closeConnection(con);
        }
        return acc;
    }

     private Account initAccount(PreparedStatement ps) throws SQLException {
        ResultSet  rs = ps.executeQuery();
        if(rs.next()){
            Account res = new Account();
            res.setLogin(rs.getString(Constants.LOGIN));
            res.setPass(rs.getString(Constants.PASSWORD));
            res.setLvl(rs.getInt(Constants.LVL));
            return res;
        }
       return null;
    }


}
