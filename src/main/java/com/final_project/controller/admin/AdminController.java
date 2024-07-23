package com.final_project.controller.admin;
import com.final_project.model.Person;
import com.final_project.services.PersonService;
import org.springframework.http.ResponseEntity;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("/api/v1/admin.html")
public class AdminController {
    private PersonService personService;
    private JdbcTemplate jdbcTemplate;
    @GetMapping("/index")
    public String viewPersons(Model model) {
        List<Person> listPersons = personService.getAllPersons();
        model.addAttribute("listPersons", listPersons);
        return "index"; // The name of your Thymeleaf template
    }
    @DeleteMapping("/deltbl/{api_id}")
    public ResponseEntity<String> deleteTicketById(@PathVariable int api_id) {
        try {
            String sql = "DELETE FROM Ticket WHERE TicketID = ?";
            int result = jdbcTemplate.update(sql, api_id);
            if (result > 0) {
                return ResponseEntity.ok("Ticket with ID " + api_id + " deleted successfully.");
            } else {
                return ResponseEntity.status(404).body("Ticket with ID " + api_id + " not found.");
            }
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Internal Server Error: " + e.getMessage());
        }
    }

    @PostMapping("/update_view")
    public ResponseEntity<String> updateView() {
        try {
            String createViewSql = "CREATE OR ALTER VIEW final_view_1 AS " +
                    "SELECT T.TicketID, M.Title, S.TheaterNumber as Seat_no" +
                    "FROM TICKET T " +
                    "JOIN SHOW S ON T.ShowID = S.ShowID" +
                    "JOIN MOVIE M ON S.MovieID = M.MovieID;";
            jdbcTemplate.execute(createViewSql);
            return ResponseEntity.ok("View 'final_view_1' created/updated successfully.");
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error creating/updating view: " + e.getMessage());
        }
    }
}
