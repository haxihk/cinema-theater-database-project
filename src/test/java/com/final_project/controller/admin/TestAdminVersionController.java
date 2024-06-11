package com.final_project.controller.admin;


import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.parallel.Execution;
import org.junit.jupiter.api.parallel.ExecutionMode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.web.server.LocalServerPort;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.web.reactive.server.WebTestClient;

@SpringBootTest(webEnvironment = SpringBootTest.WebEnvironment.RANDOM_PORT)
@Execution(ExecutionMode.CONCURRENT)
@AutoConfigureMockMvc
public class TestAdminVersionController {
	@LocalServerPort
	private int port;

	@Autowired
	WebTestClient webClient;

	@Autowired
	PasswordEncoder passwordEncoder;

	@Test
	public void TestUnauthorizedAdmin() {
		var address = "http://localhost:" + port + "/api/v1/admin/version";

		webClient.get().uri(address)
				.exchange()
				.expectStatus().isUnauthorized();
	}

	@Test
	public void TestGetVersionByAdmin() throws Exception {
		var address = "http://localhost:" + port + "/api/v1/admin/version";
		var encodedPassword = passwordEncoder.encode("<your password>");

		String sessionId = webClient.post()
				.uri("/login")
				.contentType(MediaType.APPLICATION_FORM_URLENCODED)
				.bodyValue("username=admin&password=" + encodedPassword)
				.exchange()
				.expectStatus().isFound()
				.expectHeader().exists(HttpHeaders.SET_COOKIE)
				.expectBody()
				.returnResult()
				.getRequestHeaders()
				.getFirst(HttpHeaders.SET_COOKIE);


		webClient.get()
				.uri(address)
				.header(HttpHeaders.COOKIE, sessionId)
				.exchange()
				.expectStatus().isOk()
				.expectBody(String.class).isEqualTo("2.0.0");
	}
}
