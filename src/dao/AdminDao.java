package dao;

import domain.Admin;

public interface AdminDao {

    Admin selectAdmin(String username);

}
