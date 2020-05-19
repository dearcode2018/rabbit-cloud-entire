package com.hua;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
@MapperScan("com.hua.dao")
public class ApplicationStarter {

	public static void main(String[] args) {
		SpringApplication.run(ApplicationStarter.class, args);
	}
}
