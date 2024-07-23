package com.final_project.controller.pub;

import com.final_project.model.Person;
import com.final_project.services.PersonService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
public class PersonController {



    @Autowired
    public PersonController(PersonService personService) {
        this.personService = personService;
    }
    private final PersonService personService;
    @GetMapping("/index.html")
    public String viewHomePage(Model model) {
        model.addAttribute("listPersons", personService.getAllPersons());
        return "index";
    }

    @GetMapping("/add.html")
    public String showAddPersonForm(Model model) {
        Person person = new Person();
        model.addAttribute("person", person);
        return "add";
    }
    @PostMapping("/index")
    public String savePerson(@ModelAttribute("person") Person person) {
       personService.savePerson(person);
      return "redirect:/";
   }

    @GetMapping("/update")
    public String showUpdateForm(@RequestParam("id") int id, Model model) {
        Person person = personService.getPersonById(id);
        model.addAttribute("person", person);
        return "update";
    }

    @PostMapping("/update")
    public String updatePerson(@ModelAttribute("person") Person person) {
    personService.updatePerson(person);
        return "redirect:/";
   }

    @GetMapping("/delete/{id}")
    public String deletePerson(@PathVariable("id") int id) {
        personService.deletePersonById(id);
        return "redirect:/";
    }
}
