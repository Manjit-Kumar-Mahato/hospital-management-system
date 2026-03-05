package com.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.entity.User;

public class UserDao {

	private Connection conn;

	public UserDao(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean register(User u) {

		boolean f = false;

		try {
			String sql = "INSERT INTO user_dtls(fullname, email, password) VALUES (?, ?, ?)";

			PreparedStatement ps = conn.prepareStatement(sql);

			ps.setString(1, u.getFullname());
			ps.setString(2, u.getEmail());
			ps.setString(3, u.getPassword());

			int i = ps.executeUpdate();

			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}

		return f;
	}
	
	public User login(String em, String ps) {

	    User u = null;

	    try {
	        String sql = "SELECT * FROM user_dtls WHERE email = ? AND password = ?";

	        PreparedStatement psmt = conn.prepareStatement(sql);
	        psmt.setString(1, em);
	        psmt.setString(2, ps);

	        ResultSet rs = psmt.executeQuery();

	        while (rs.next()) {
	            u = new User();
	            u.setId(rs.getInt("id"));
	            u.setFullname(rs.getString("fullname"));
	            u.setEmail(rs.getString("email"));
	            u.setPassword(rs.getString("password"));
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return u;
	}
	
	
	public List<User> getAllUsers() {

	    List<User> list = new ArrayList<>();
	    User u = null;

	    try {
	        String sql = "select * from user_dtls";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {

	            u = new User();

	            u.setId(rs.getInt(1));
	            u.setFullname(rs.getString(2));
	            u.setEmail(rs.getString(3));
	            u.setPassword(rs.getString(4));

	            list.add(u);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return list;
	}
	
	
	public int countUser() {

	    int count = 0;

	    try {
	        String sql = "select count(*) from user_dtls";
	        PreparedStatement ps = conn.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {
	            count = rs.getInt(1);
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return count;
	}
	
	
	
	
	public boolean changePassword(int uid, String oldPass, String newPass) {

	    boolean f = false;

	    try {

	        String sql = "select * from user_dtls where id=? and password=?";

	        PreparedStatement ps = conn.prepareStatement(sql);
	        ps.setInt(1, uid);
	        ps.setString(2, oldPass);

	        ResultSet rs = ps.executeQuery();

	        if (rs.next()) {

	            String update = "update user_dtls set password=? where id=?";

	            PreparedStatement ps2 = conn.prepareStatement(update);
	            ps2.setString(1, newPass);
	            ps2.setInt(2, uid);

	            int i = ps2.executeUpdate();

	            if (i == 1) {
	                f = true;
	            }
	        }

	    } catch (Exception e) {
	        e.printStackTrace();
	    }

	    return f;
	}
	

}
