package br.com.pesquisa.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import br.com.pesquisa.util.*;
import br.com.pesquisa.model.Cep;

public class CepDAO {
	
	/*private static Connection connection;
	
	public CepDAO() {
		connection = Conexao.getConnection();
	}*/
	
	public static List<Cep> getAllCep() {
	    List<Cep> lista = new ArrayList<>();
	    
	    String query = "SELECT * FROM produto";
	    try (Connection conn = Conexao.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query);
	         ResultSet rs = ps.executeQuery()) {
	        
	        while (rs.next()) {
	            Cep cep = new Cep();
	            cep.setIdCep(rs.getInt("idCep"));
	            cep.setCep(rs.getInt("cep"));
	            cep.setLogradouro(rs.getString("logradouro"));
	            lista.add(cep);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    
	    return lista;
	}
	
	public static List<Cep> buscarCep(String cepValor) {
	    List<Cep> listaCep = new ArrayList<>();
	    String query = "SELECT * FROM produto WHERE cep LIKE ?";
	    try (Connection conn = Conexao.getConnection();
	         PreparedStatement ps = conn.prepareStatement(query)) {
	        //ps.setString(1, "%" + cepValor + "%");
	        ps.setString(1, cepValor);
	        ResultSet rs = ps.executeQuery();
	        while (rs.next()) {
	            Cep cep = new Cep();
	            cep.setIdCep(rs.getInt("idCep"));
	            cep.setCep(rs.getInt("cep"));
	            cep.setLogradouro(rs.getString("logradouro"));
	            listaCep.add(cep);
	        }
	    } catch (Exception ex) {
	        ex.printStackTrace();
	    }
	    return listaCep;
	}

}
