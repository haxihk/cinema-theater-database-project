package com.final_project.model;

import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
@Entity
@Table(name = "PERSON")
public class Person {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "PersonID", nullable = false)
    private Integer id;

    @Size(max = 255)
    @NotNull
    @Column(name = "Name", nullable = false)
    private String name;

    @Size(max = 10)
    @Column(name = "Gender", length = 10)
    private String gender;

    @Column(name = "DateOfBirth")
    private LocalDate dateOfBirth;

    @Size(max = 255)
    @Column(name = "ContactInfo")
    private String contactInfo;

    @Size(max = 255)
    @Column(name = "Nationality")
    private String nationality;

}