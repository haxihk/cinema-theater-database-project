package com.final_project.controller.pub;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.test.web.reactive.server.WebTestClient;


@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Execution(ExecutionMode.CONCURRENT)
@AutoConfigureMockMvc
public class TestVersionController {
	@LocalServerPort
	private int port;

	@Autowired
	WebTestClient webClient;

	@Test
	void testGetVersion() throws Exception {
		var address = "http://localhost:" + port +"/api/v1/public/version";

		webClient.get().uri(address)
				.exchange()
				.expectStatus().isOk()
				.expectBody(String.class).isEqualTo("1.0.0");
	}
}
