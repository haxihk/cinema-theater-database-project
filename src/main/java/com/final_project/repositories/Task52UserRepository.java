package com.final_project.repositories;


import com.final_project.model.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface Task52UserRepository extends JpaRepository<User, Integer> {
    User findByUsername(String username);
}
