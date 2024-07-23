package com.final_project.services;

import lombok.Setter;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;

@Setter
@Service
public class UserManagementService {


    private JdbcTemplate jdbcTemplate;

    public void addUser(String username, String password) {
        String sql = "INSERT INTO Task52User (username, password) VALUES (?, ENCRYPT_PASSWORD(?))";
        jdbcTemplate.update(sql, username, password);
    }

    public void deleteUser(String username) {
        String sql = "DELETE FROM Task52User WHERE username = ?";
        jdbcTemplate.update(sql, username);
    }

    public UserManagementService(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

}
