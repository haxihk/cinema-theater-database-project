package com.final_project.model;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity
@Immutable
@Table(name = "viewtask52")
public class User {
    @Id
    @NotNull
    @Column(name = "ID", nullable = false)
    private Integer id;

    @Size(max = 256)
    @Column(name = "username", length = 256)
    private String username;

    @Size(max = 256)
    @Column(name = "decrypted_password", length = 256)
    private String decryptedPassword;

    public String getPassword() {
        return decryptedPassword;
    }

    public @NotNull Integer getId() {
        return id;
    }

    public void setId(@NotNull Integer id) {
        this.id = id;
    }

    public @Size(max = 256) String getUsername() {
        return username;
    }

    public void setUsername(@Size(max = 256) String username) {
        this.username = username;
    }

    public @Size(max = 256) String getDecryptedPassword() {
        return decryptedPassword;
    }

    public void setDecryptedPassword(@Size(max = 256) String decryptedPassword) {
        this.decryptedPassword = decryptedPassword;
    }
}