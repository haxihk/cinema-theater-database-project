package com.final_project.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "TICKET")
public class Ticket {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "TicketID", nullable = false)
    private Integer id;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "ShowID")
    private Show showID;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "CustomerID")
    private Customer customerID;

    @Size(max = 255)
    @NotNull
    @Column(name = "TicketType", nullable = false)
    private String ticketType;

}