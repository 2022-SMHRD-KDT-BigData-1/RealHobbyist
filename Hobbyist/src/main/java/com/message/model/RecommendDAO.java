package com.message.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RecommendDAO {
	private Connection conn;
	private PreparedStatement psmt;
	private ResultSet rs;
	private int cnt;
	private String sql;
	
	public void connect() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			
			String url = "jdbc:oracle:thin:@project-db-stu.ddns.net:1524:xe";
			String user = "campus_f_5_0115";
	        String password = "smhrd5";
			
			conn= DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {		
			e.printStackTrace();
		}
		
	}
	
	public void close() {
		try {
			if(rs !=null) {
				rs.close();
			}
			if(psmt !=null) {
				psmt.close();
			}
			if(conn !=null) {
				conn.close();
			}
		} catch (SQLException e) {		
			e.printStackTrace();
		}
	}
	
//	public ArrayList<AcademyDTO>recSelect(AcademyDTO Recommend) {
//		ArrayList<AcademyDTO> list = new ArrayList<AcademyDTO>();
//		
//		connect();
//		sql="select * from academy where a_L_category = ? and a_m_category = ? and a_city = ?";
//		
//		try {
//			psmt=conn.prepareStatement(sql);
//			psmt.setString(1, Recommend.getA_L_category());
//			psmt.setString(2, Recommend.getA_m_category());
//			psmt.setString(3, Recommend.getA_city());
//			
//			rs=psmt.executeQuery();
//			
//			
//			while(rs.next()) {
//				list.add(new AcademyDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7)));
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		
//		return list;
//	}
	public ArrayList<AddrDTO>recSelect(AddrDTO Recommend) {
		ArrayList<AddrDTO> list = new ArrayList<AddrDTO>();
		
		connect();
		sql="select * from addr where ac_si = ? and ac_category = ?";
		
		try {
			psmt=conn.prepareStatement(sql);
			psmt.setString(1, Recommend.getAc_si());
			psmt.setString(2, Recommend.getAc_category());
			
			rs=psmt.executeQuery();
			
			
			while(rs.next()) {
				list.add(new AddrDTO(rs.getString(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5), rs.getString(6), rs.getString(7), rs.getString(8), rs.getString(9), rs.getString(10), rs.getString(11), rs.getString(12)));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		
		return list;
	}
	public int getCount(AddrDTO Recommend) {
		int count = 0;
		connect();
		sql="select count(*) from addr where ac_si = ? and ac_category = ?";
		
		try {
			psmt=conn.prepareStatement(sql);
			
			psmt.setString(1, Recommend.getAc_si());
			psmt.setString(2, Recommend.getAc_category());
			rs=psmt.executeQuery();
			if(rs.next()) {
				count = rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			close();
		}
		System.out.println("RecommendDAO �� ��� : "+count);
		
		return count; // �� ���ڵ� �� ����
	}
//	public int getCount(AcademyDTO Recommend) {
//		int count = 0;
//		connect();
//		sql="select count(*) from academy where a_L_category = ? and a_m_category = ? and a_city = ?";
//		
//		try {
//			psmt=conn.prepareStatement(sql);
//			
//			psmt.setString(1, Recommend.getA_L_category());
//			psmt.setString(2, Recommend.getA_m_category());
//			psmt.setString(3, Recommend.getA_city());
//			rs=psmt.executeQuery();
//			if(rs.next()) {
//				count = rs.getInt(1);
//			}
//			
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			close();
//		}
//		System.out.println("RecommendDAO �� ��� : "+count);
//		
//		return count; // �� ���ڵ� �� ����
//	}
	
	
}
