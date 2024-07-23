package com.final_project.services;

import com.final_project.model.Person;
import com.final_project.repositories.PersonRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class PersonService {

    public PersonRepository personRepository;


    public List<Person> getAllPersons() {
        return (List<Person>) personRepository.findAll();
    }

    public void savePerson(Person person) {
        personRepository.save(person);
    }

    public Person getPersonById(int id) {
        return personRepository.findById(id)
                .orElseThrow(() -> new RuntimeException("Person not found for id: " + id));
    }

    public void updatePerson(Person person) {
        if (personRepository.existsById(person.getId())) {
            personRepository.save(person);
        } else {
            throw new RuntimeException("Cannot update. Person not found for id: " + person.getId());
        }
    }

    public void deletePersonById(int id) {
        personRepository.deleteById(id);
    }
}
