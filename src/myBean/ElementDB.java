package myBean;

import java.sql.*;

import javax.naming.NamingException;

public class ElementDB {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	public ElementDB() throws SQLException, NamingException {
		con = DsCon.getConnection();
	}
	public void modifyElement(DataContainer dc) throws SQLException {
		String sql = "UPDATE Element SET videolink = ?, thumbnaillink = ?, author = ?, title = ?, detail = ? WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dc.getVideolink());
		pstmt.setString(2, dc.getThumbnaillink());
		pstmt.setString(3, dc.getAuthor());
		pstmt.setString(4, dc.getTitle());
		pstmt.setString(5, dc.getDetail());
		pstmt.setInt(6, dc.getIdx());
		pstmt.executeUpdate();
	}
	public void createElement(DataContainer dc) throws SQLException {
		String sql = "INSERT INTO Element(videolink,thumbnaillink,author,title,time,detail) VALUES(?,?,?,?,?,?)";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, dc.getVideolink());
		pstmt.setString(2, dc.getThumbnaillink());
		pstmt.setString(3, dc.getAuthor());
		pstmt.setString(4, dc.getTitle());
		pstmt.setString(5,dc.getTime());
		pstmt.setString(6, dc.getDetail());
		pstmt.executeUpdate();
	}
	public DataContainer getElement(int idx) throws SQLException {
		String sql = "SELECT * from Element WHERE idx = ?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		rs = pstmt.executeQuery();
		DataContainer dc = new DataContainer();
		rs.next();
		dc.setIdx(Integer.parseInt(rs.getString("idx")));
		dc.setVideolink(rs.getString("videolink"));
		dc.setThumbnaillink(rs.getString("thumbnaillink"));
		dc.setAuthor(rs.getString("author"));
		dc.setTitle(rs.getString("title"));
		dc.setTime(rs.getString("time"));
		dc.setDetail(rs.getString("detail"));
		return dc;
	}
	public void deleteElement(int idx) throws SQLException {
		String sql = "DELETE FROM Element WHERE idx=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setInt(1, idx);
		pstmt.executeUpdate();
	}
	public void close() throws SQLException {
		if(rs != null) rs.close();
		if(pstmt != null) pstmt.close();
	}
}
