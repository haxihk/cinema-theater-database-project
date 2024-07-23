package com.final_project.services;

import com.final_project.model.Customer;
import com.final_project.model.Ticket;
import com.final_project.model.Show;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Service;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

@Service
public class TicketService {

    private final JdbcTemplate jdbcTemplate;

    public TicketService(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public List<Ticket> getTicketsById(int id) {
        String sql = "EXEC sp_final_1 @id = ?";
        return jdbcTemplate.query(sql, new Object[]{id}, new RowMapper<Ticket>() {
            @Override
            public Ticket mapRow(ResultSet rs, int rowNum) throws SQLException {
                Ticket ticket = new Ticket();
                ticket.setId(rs.getInt("TicketID"));

                Show show = new Show();
                show.setId(rs.getInt("ShowID"));
                ticket.setShowID(show);

                Customer customer = new Customer();
                customer.setId(rs.getInt("CustomerID"));
                ticket.setCustomerID(customer);

                ticket.setTicketType(rs.getString("TicketType"));
                return ticket;
            }
        });
    }
}
