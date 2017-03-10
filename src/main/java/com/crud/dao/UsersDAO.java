package com.crud.dao;

import com.crud.model.User;

import java.util.Date;
import java.util.List;

/**
 * Created by home on 2/27/17.
 */
public interface UsersDAO {
    void saveUser(User user);
    void updateUser(User user);
    User getUser(int id);
    void deleteUser(int userId);
    List<User> searchUser(String searchString);
    List<User> getAllUser();
    List<User> getAllUsersWithPagination(int rowsPerPage, int page, String criterion);
    int getUsersCount(String criterion);
    int getAllUsersCount();

}
