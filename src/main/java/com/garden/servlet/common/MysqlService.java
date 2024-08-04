package com.garden.servlet.common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class MysqlService {
	
	private Connection connection;
	
	// 클래스를 설계 하는 입장에서 
	// 객체를 하나만 만들어서 공용으로 사용하도록 설계 
	// Singleton (Design pattern)
	private static MysqlService mysqlService = null;
	
	
	// singleton 객체를 돌려주는 메소드
	// static: 객체 생성 없이 사용 가능한 메소드, 멤버 변수 
	// static 메소드 에서는 static 멤버변수만 사용 가능 
	public static MysqlService getInstance() {
		
		if(mysqlService == null) {
			mysqlService = new MysqlService();
		}
		
		return mysqlService;
	}
	
	// 접속 
	public void connect() {
		// 데이터 베이스 접속 
		try {
			DriverManager.registerDriver(new com.mysql.jdbc.Driver());
			
			// 접속주소, 포트, id, password
			String url = "jdbc:mysql://localhost:3306/garden";
			String id = "root";
			String password = "root";
			
			connection = DriverManager.getConnection(url, id, password);
			
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
		
	}
	
	// select 쿼리 수행
	public List<Map<String, Object>> select(String query) {
		
		try {
			Statement statement = connection.createStatement();
			ResultSet resultSet = statement.executeQuery(query);
			
			List<Map<String, Object>> resultList = new ArrayList<>(); 
			
			ResultSetMetaData rsmd = resultSet.getMetaData();
			int columnCount = rsmd.getColumnCount();
			
			List<String> columnNames = new ArrayList<>();
			
			for(int i = 1; i <= columnCount; i++) {
				columnNames.add(rsmd.getColumnName(i));
			}
			
			while(resultSet.next()) {
				Map<String, Object> resultMap = new HashMap<>();
				
				// 컬럼 이름을 통해 값을 하나씩 얻어 와서 
				// 한 행의 정보를 컬럼 단위로 맵에 추가 
				for(String name:columnNames) {
					Object value = resultSet.getObject(name);
					
					resultMap.put(name, value);
				}
				resultList.add(resultMap);
			}
			
			return resultList;
			
		} catch (SQLException e) {
			
			return null;
		}
	}
	
	
	// insert, update, delete  쿼리 수행
	public int update(String query) {
		try {
			Statement statement = connection.createStatement();
			// 실행된 행의 개수 return 
			return statement.executeUpdate(query);
			
		} catch (SQLException e) {
			
			return -1;
		}
	}
	
	
	// 접속 끊기 
	public void disconnect() {
		try {
			connection.close();
		} catch (SQLException e) {
			
			e.printStackTrace();
		}
	}
	

}