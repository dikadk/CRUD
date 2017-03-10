package com.crud.service;

import com.crud.dao.UsersDAO;
import com.crud.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

/**
 * Created by home on 3/5/17.
 */
@Service
public class UsersServiceImpl implements UsersService {

    @Autowired
    private UsersDAO usersDAO;

    @Transactional
    public void saveUser(User user) {
        usersDAO.saveUser(user);
    }

    @Transactional
    public void updateUser(User user){
        usersDAO.updateUser(user);
    }

    @Transactional
    public User getUser(int id) {
        return usersDAO.getUser(id);
    }

    @Transactional
    public void deleteUser(int userId) {
        usersDAO.deleteUser(userId);
    }

    @Transactional
    public List<User> searchUser(String searchString) {
        return usersDAO.searchUser(searchString);
    }

    @Transactional
    public List<User> getAllUser() {
        return usersDAO.getAllUser();
    }

    @Transactional
    public List<User> getAllUsersWithPagination(int rowsPerPage, int page, String criterion) {
        return usersDAO.getAllUsersWithPagination(rowsPerPage,page,criterion);
    }

    @Transactional
    public int getUsersCount(String criterion){
        return usersDAO.getUsersCount(criterion);
    }
    @Transactional
    public int getAllUsersCount(){
        return usersDAO.getAllUsersCount();
    }

    public void setUsersDao(UsersDAO usersDao) {
        this.usersDAO = usersDao;
    }
}
