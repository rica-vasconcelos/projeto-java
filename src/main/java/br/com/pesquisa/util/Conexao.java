package br.com.pesquisa.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class Conexao {
	public static Connection getConnection() {
		Connection con = null;
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection("jdbc:mysql://localhost:3306/crud_mvc", "root", "1719");
		} catch(Exception e) {
			System.out.println(e);
		}
		
		return con;
	}
}
