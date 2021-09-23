package com.sages.proj.constants;

public class SQLconstants {

    public static final String GET_ACCOUNT_BY_LOGIN = "SELECT * FROM account WHERE login =?;";
    public static final String INSERT_ACCOUNT = "INSERT INTO account (login,password,zno_score,email,mind_fuel,lvl,role,location_id) " +
            "VALUES (?,?,?,?,?,?,?,?);";

    public static final String GET_INVENTORY_AS_ITEMS_AND_DESCRIPTIONS = "" +
            "SELECT " +
            "     relict.id, count, relict.name, rarity, relict.description,relict.image_url, category.name category, category.description cat_desc " +
            "FROM " +
            "     relict, category, inventory_has_relict " +
            "WHERE " +
            "     inventory_id = ? AND relict_id = relict.id " +
            "GROUP BY " +
            "      relict.id " +
            "ORDER BY " +
            "      relict.id;";
}
