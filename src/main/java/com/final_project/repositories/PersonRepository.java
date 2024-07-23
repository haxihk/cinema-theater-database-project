package com.final_project.repositories;

import com.final_project.model.Person;
import org.springframework.data.repository.CrudRepository;

public interface PersonRepository extends CrudRepository<Person, Integer> {
    public Long countById(Integer id);
}