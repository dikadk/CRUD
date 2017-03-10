package com.crud.dao;

import com.crud.model.User;
import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Projections;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import java.util.List;

/**
 * Created by home on 3/5/17.
 */
@Repository
public class UsersDAOImplHibernate implements UsersDAO {

    @Autowired
    private SessionFactory sessionFactory;


    @Override
    public void saveUser(User user) {
        getSession().save(user);
    }

    @Override
    public void updateUser(User user) {
        user.setId(user.getId());
        getSession().update(user);
    }

    @Override
    public User getUser(int id) {
        User user = (User) getSession().get(User.class, id);
        return user;
    }

    @Override
    public void deleteUser(int userId) {
        User user = getUser(userId);
        if (user != null) {
            getSession().delete(user);
        }
    }

    @Override
    public List<User> searchUser(String searchString) {
        List<User> searchResults = getSession().createQuery("from User where name like:searchString").setParameter("searchString","%"+searchString+"%").list();
        return searchResults;
    }

    @Override
    public List<User> getAllUser() {
        CriteriaBuilder criteriaBuilder = getSession().getCriteriaBuilder();
        CriteriaQuery<User> criteria = criteriaBuilder.createQuery(User.class);
        Root<User> userRoot = criteria.from(User.class);
        criteria.select(userRoot);

        List<User> userList = getSession().createQuery(criteria).getResultList();
        return userList;
    }

    @SuppressWarnings("unchecked")
    public List<User> getAllUsersWithPagination(int rowsPerPage, int page, String criterion) {
        Query query = getSession().createQuery("from User where name like :criterion");
        query.setString("criterion", "%" + criterion + "%");
        if (rowsPerPage > 0) {
            query.setFirstResult((page - 1) * rowsPerPage);
            query.setMaxResults(rowsPerPage);
        }
        List<User> listUsers = (List<User>) query.list();
        return listUsers;
    }

    @Override
    public int getAllUsersCount() {
        Criteria criteria = getSession().createCriteria(User.class);
        criteria.setProjection(Projections.rowCount());
        int count = ((Long) criteria.uniqueResult()).intValue();
        return count;
    }

    @Override
    public int getUsersCount(String criterion) {
        Query query = getSession().createQuery("from User where name like :criterion");
        query.setString("criterion", "%" + criterion + "%");
        return query.list().size();
    }

    private Session getSession() {
        Session session = getSessionFactory().getCurrentSession();
        if (session == null) {
            session = getSessionFactory().openSession();
        }
        return session;
    }

    private SessionFactory getSessionFactory() {
        return sessionFactory;
    }

    public void setSessionFactory(SessionFactory sessionFactory) {
        this.sessionFactory = sessionFactory;
    }
}
