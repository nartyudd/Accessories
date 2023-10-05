/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tcd.repository.impl;

import com.tcd.pojo.Category;
import com.tcd.repository.CategoryRepository;
import java.util.List;
import javax.persistence.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author admin
 */
@Repository
@Transactional
public class CategoryRepositoryImpl implements CategoryRepository {

    @Autowired
    private LocalSessionFactoryBean factory;

    @Override
    public List<Category> getCates() {
        Session session = factory.getObject().getCurrentSession();
        try {
            Query query = session.createQuery("FROM Category");
            return query.getResultList();
        } catch (Exception e) {
            // Xử lý exception, có thể ném một custom exception hoặc ghi log
            throw new RuntimeException("Error retrieving categories", e);
        }
    }
}

