package com.chysk5.persistence;

import static org.junit.Assert.fail;

import java.sql.Connection;
import java.sql.DriverManager;

import org.junit.Test;

import lombok.extern.log4j.Log4j;

@Log4j
public class JDBCTests {
   
   static {
      try {
         Class.forName("oracle.jdbc.driver.OracleDriver");
      } catch(Exception e) {
         e.printStackTrace();
      }
   }
   
   @Test
   public void testConnection() {
      
      try(Connection con = DriverManager.getConnection(
            "jdbc:oracle:thin:@edudb_high?TNS_ADMIN=C:/dev64/OracleWallet",
            "CHYSK5",
            "HyundaiDB123"
            )){
         
         log.info(con);
      } catch (Exception e) {
         fail(e.getMessage());
      }
   }
}