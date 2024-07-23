package com.final_project.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "CUSTOMER")
public class Customer {
    @Id
    @Column(name = "PersonID", nullable = false)
    private Integer id;

    @MapsId
    @OneToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "PersonID", nullable = false)
    private Customer person;

    @Size(max = 255)
    @Column(name = "MembershipStatus")
    private String membershipStatus;

    @OneToMany(mappedBy = "customerID")
    private Set<Payment> payments = new LinkedHashSet<>();

    @OneToMany(mappedBy = "customerID")
    private Set<ReserveSeat> reserveSeats = new LinkedHashSet<>();

    @OneToMany(mappedBy = "customerID")
    private Set<Ticket> tickets = new LinkedHashSet<>();

}