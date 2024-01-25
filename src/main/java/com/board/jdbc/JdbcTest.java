package com.board.jdbc;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.slf4j.Slf4j;

@Slf4j
public class JdbcTest {

	static {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@Test
	public void TestConnection() {
		try (Connection conn = 
            	DriverManager.getConnection(
                    "jdbc:oracle:thin:@localhost:1521:orcl", 
                    "$JUNG",
                    "$1111")) {
        	log.info("conn " + conn);
        	
		} catch (Exception e) {
			fail(e.getMessage());
		}
	}

}