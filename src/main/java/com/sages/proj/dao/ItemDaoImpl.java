package com.sages.proj.dao;

import com.sages.proj.constants.SQLconstants;
import com.sages.proj.entity.Account;
import com.sages.proj.entity.Category;
import com.sages.proj.entity.Item;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class ItemDaoImpl {

    public List<Item> getInventoryByAccountId(Long accountId) {
        List<Item> items = null;
        Connection con = null;
        try{
            con = DBManager.getConnection();
            PreparedStatement ps = con.prepareStatement(SQLconstants.GET_INVENTORY_AS_ITEMS_AND_DESCRIPTIONS);
            ps.setString(1,accountId.toString());
            items = initInventory(ps);
        }catch (SQLException ex){

        }finally {
            DBManager.closeConnection(con);
        }
        return items;
    }

    private List<Item> initInventory(PreparedStatement ps) throws SQLException {
        ResultSet res = ps.executeQuery();
        List<Item> items = new ArrayList<>();
        while (res.next()){
            Item item = new Item();
            item.setId(res.getLong("id"));
            item.setCount(res.getInt("count"));
            item.setName(res.getString("name"));
            item.setDescription(res.getString("description"));
            item.setImage_url(res.getString("image_url"));
            item.setRarity(res.getString("rarity"));

            Category category = new Category();
            category.setName(res.getString("category"));
            category.setDescription(res.getString("cat_desc"));
            item.setCategory(category);

            items.add(item);
        }

        for(Item i:items){
            System.out.println(i.getName());
        }
        return items;
    }
}
