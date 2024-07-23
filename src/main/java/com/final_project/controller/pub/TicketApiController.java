package com.final_project.controller.pub;

import com.final_project.model.Ticket;
import com.final_project.services.TicketService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.http.ResponseEntity;

import java.util.List;

@RestController
@RequestMapping("/api/v1/public")
public class TicketApiController {

    @Autowired
    private TicketService ticketService;

    @GetMapping("/run_sp")
    public ResponseEntity<?> runStoredProcedure(@RequestParam int id) {
        try {
            List<Ticket> tickets = ticketService.getTicketsById(id);
            return ResponseEntity.ok(tickets);
        } catch (Exception e) {
            return ResponseEntity.status(500).body("Error executing stored procedure");
        }
    }
}
