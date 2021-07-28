package entity;

import java.sql.Timestamp;

public class Account {

    private long id;
    private String login;
    private String pass;
    private int zno_score;
    private String email;
    private int mind_fuel;
    private int lvl;
    private int role_id;
    private int location_id;

    public Timestamp getCreation_time() {
        return creation_time;
    }

    public void setCreation_time(Timestamp creation_time) {
        this.creation_time = creation_time;
    }

    private Timestamp creation_time;


    public Account createAccount(String login, String pass) {
        Account u = new Account();
        u.setLogin(login);
        u.setPass(pass);
        return u;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getLogin() {
        return login;
    }

    public void setLogin(String login) {
        this.login = login;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }

    public int getZno_score() {
        return zno_score;
    }

    public void setZno_score(int zno_score) {
        this.zno_score = zno_score;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getMind_fuel() {
        return mind_fuel;
    }

    public void setMind_fuel(int mind_fuel) {
        this.mind_fuel = mind_fuel;
    }

    public int getLvl() {
        return lvl;
    }

    public void setLvl(int lvl) {
        this.lvl = lvl;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }

    public int getLocation_id() {
        return location_id;
    }

    public void setLocation_id(int location_id) {
        this.location_id = location_id;
    }


}
