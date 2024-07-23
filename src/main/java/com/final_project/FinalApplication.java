package com.final_project;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@SpringBootApplication(scanBasePackages = "com.final_project")
public class FinalApplication {
	public static void main(String[] args) {
		SpringApplication.run(FinalApplication.class, args);
	}
}