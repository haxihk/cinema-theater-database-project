package com.final_project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import jakarta.validation.constraints.NotNull;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;

import java.util.Objects;

@Getter
@Setter
@Embeddable
public class ReserveSeatId implements java.io.Serializable {
    private static final long serialVersionUID = -4347346552984070802L;
    @NotNull
    @Column(name = "CustomerID", nullable = false)
    private Integer customerID;

    @NotNull
    @Column(name = "ShowID", nullable = false)
    private Integer showID;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        ReserveSeatId entity = (ReserveSeatId) o;
        return Objects.equals(this.showID, entity.showID) &&
                Objects.equals(this.customerID, entity.customerID);
    }

    @Override
    public int hashCode() {
        return Objects.hash(showID, customerID);
    }

}