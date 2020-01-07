package team;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import team.TeamDTO;
import util.DatabaseUtil;

public class TeamDAO {
	private Connection conn = null;
	private PreparedStatement pstmt = null;
	private ResultSet rs = null;

	public int write(TeamDTO teamDTO) {
		String SQL = "INSERT into team VALUES (null, ?, ?, ?, ?);";

		try {
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, teamDTO.getTeamName());
			pstmt.setString(2, teamDTO.getUserName());
			pstmt.setString(3, teamDTO.getEmployee());
			pstmt.setString(4, teamDTO.getUserEmail());
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}



	public ArrayList<TeamDTO> getList() {
		String SQL = "SELECT * FROM team order by teamID desc";
		ArrayList<TeamDTO> list = new ArrayList<TeamDTO>();
		try {
			conn = DatabaseUtil.getConnection();
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				TeamDTO team = new TeamDTO();
				team.setTeamID(rs.getInt(1));
				team.setTeamName(rs.getString(2));
				team.setUserName(rs.getString(3));
				team.setEmployee(rs.getString(4));
				team.setUserEmail(rs.getString(5));
				list.add(team);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}

	public int delete(String teamID) {
		PreparedStatement pstmt = null;
		try {
			String SQL = "DELETE FROM team WHERE teamID=?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(teamID));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return -1;
	}

	public TeamDTO get(String teamID) {
		PreparedStatement pstmt = null;
		
		try {
			String SQL = "SELECT * FROM team WHERE teamID=?";
			conn = DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(teamID));
			rs=pstmt.executeQuery();
			if(rs.next()) {
				TeamDTO team = new TeamDTO();
				team.setTeamID(rs.getInt(1));
				team.setTeamName(rs.getString(2));
				team.setUserName(rs.getString(3));
				team.setEmployee(rs.getString(4));
				team.setUserEmail(rs.getString(5));
			return team;	
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
		}
		return null;
	}
	
	public int update(String teamName,String userName, String employee, String userEmail, String teamID) {
		PreparedStatement pstmt=null;
		try {
			conn=DatabaseUtil.getConnection();
			String SQL="UPDATE team SET teamName=?, userName=?, employee=?, userEmail =? WHERE teamID=?";
			pstmt=conn.prepareStatement(SQL);
			pstmt.setString(1, teamName);
			pstmt.setString(2, userName);
			pstmt.setString(3, employee);
			pstmt.setString(4, userEmail);
			pstmt.setInt(5, Integer.parseInt(teamID));
			return pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
				if (rs != null)
					rs.close();
			} catch (Exception e) {
			}
		}
		return -1;
	}
	
}
