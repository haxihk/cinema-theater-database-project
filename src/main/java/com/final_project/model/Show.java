package com.final_project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalTime;

@Getter
@Setter
@Entity
@Table(name = "SHOW")
public class Show {
    @Id
    @Column(name = "ShowID", nullable = false)
    private Integer id;

    @NotNull
    @Column(name = "TheaterNumber", nullable = false)
    private Integer theaterNumber;

    @NotNull
    @Column(name = "ShowTime", nullable = false)
    private LocalTime showTime;

}