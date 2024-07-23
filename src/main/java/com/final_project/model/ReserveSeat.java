package com.final_project.model;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "RESERVE_SEAT")
public class ReserveSeat {
    @EmbeddedId
    private ReserveSeatId id;

    @MapsId("customerID")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "CustomerID", nullable = false)
    private Customer customerID;

}