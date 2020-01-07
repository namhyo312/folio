package evaluation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import util.DatabaseUtil;

public class EvaluationDAO {
	private Connection conn=null;
	private PreparedStatement pstmt = null;
	private ResultSet rs=null;
	
	
	public int write(EvaluationDTO evaluationDTO) {
		String SQL = "INSERT into evaluation VALUES (null, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?,?);";
		String user=evaluationDTO.getUserName();
		String number=evaluationDTO.getEmployee();
		String []array=user.split(" ");
		String []arr=number.split(" ");
		String userName=null;
		String teamName=null;
		String employee=null;
		PreparedStatement pstmt = null;
		
		try {	
			 conn=DatabaseUtil.getConnection();
			 pstmt=conn.prepareStatement(SQL);
		   for(int i=0; i<arr.length; i++) {
			   
		   teamName=arr[i].substring(7);
		   userName=array[i];
		   employee=arr[i].substring(0,7);
		   
			pstmt.setString(1, evaluationDTO.getUserID());
			pstmt.setString(2, evaluationDTO.getTaskName() );
			pstmt.setString(3, teamName);
			pstmt.setString(4, evaluationDTO.getLeaderName());
			pstmt.setString(5, userName);
			pstmt.setString(6, employee);
			pstmt.setString(7, evaluationDTO.getStartDate());
			pstmt.setString(8, evaluationDTO.getEndDate());
			pstmt.setInt(9, evaluationDTO.getOperationRatio());
			pstmt.setInt(10, evaluationDTO.getHoliday());
			pstmt.setString(11, evaluationDTO.getEvaluationContent());
			pstmt.addBatch();
			pstmt.clearParameters();
		   }
		   pstmt.executeBatch();

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return -1;
	}
	
	public ArrayList<EvaluationDTO> getList(String teamName, String searchType, String search, int pageNumber) {
	if(teamName.equals("부서")) {
		teamName="";
	}
	if(searchType.equals("날짜")) {
		searchType="";
	}
		ArrayList<EvaluationDTO> evaluationList = null;
		PreparedStatement pstmt = null;
		String SQL = "";
		try {
			
			if(searchType.equals("날짜")) {
				SQL="SELECT * from evaluation WHERE teamName LIKE ? and startDate LIKE ? and CONCAT(taskName,teamName,leaderName,userName) LIKE ? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}else {
				SQL="SELECT * from evaluation WHERE teamName LIKE ? and startDate LIKE ? and CONCAT(taskName,teamName,leaderName,userName) LIKE ? ORDER BY evaluationID DESC LIMIT " + pageNumber * 5 + ", " + pageNumber * 5 + 6;
			}
			conn=DatabaseUtil.getConnection();
			pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, "%" + teamName + "%");
			pstmt.setString(2, "%" + searchType + "%");
			pstmt.setString(3, "%" + search + "%");
			rs = pstmt.executeQuery();
			evaluationList=new ArrayList<EvaluationDTO>();
					
			while(rs.next()) {
				EvaluationDTO evaluation = new EvaluationDTO(
					rs.getInt(1),
					rs.getString(2),
					rs.getString(3),
					rs.getString(4),
					rs.getString(5),
					rs.getString(6),
					rs.getString(7),
					rs.getString(8),
					rs.getString(9),
					rs.getInt(10),
					rs.getInt(11),
					rs.getString(12)
				);
				evaluationList.add(evaluation);
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {

			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return evaluationList;
	}

	public int delete (String evaluationID) {
		PreparedStatement pstmt = null;
		try {
			String SQL="DELETE FROM evaluation WHERE evaluationID=?";
			conn=DatabaseUtil.getConnection();
			pstmt=conn.prepareStatement(SQL);
			pstmt.setInt(1, Integer.parseInt(evaluationID));
			return pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}catch(Exception e) {
	        }
		}
         return -1;
      }
	
		public int update(String taskName,String leaderName, String userName, String employee, String startDate, String endDate, int operationRatio,int holiday,String evaluationContent, String evaluationID) {
			
			try {
				conn=DatabaseUtil.getConnection();
				String SQL="UPDATE evaluation SET taskName=?, leaderName=?, userName=?, employee=?, startDate=?, endDate=?, operationRatio=?, holiday=?, evaluationContent=?  WHERE evaluationID=?";
				pstmt=conn.prepareStatement(SQL);
				pstmt.setString(1, taskName);
				pstmt.setString(2, leaderName);
				pstmt.setString(3, userName);
				pstmt.setString(4, employee);
				pstmt.setString(5, startDate);
				pstmt.setString(6, endDate);
				pstmt.setInt(7, operationRatio);
				pstmt.setInt(8, holiday);
				pstmt.setString(9, evaluationContent);
				pstmt.setInt(10,Integer.parseInt(evaluationID));
				return pstmt.executeUpdate();
			}catch(Exception e) {
				e.printStackTrace();
			}finally {
				try {
					if(pstmt != null) pstmt.close();
					if(conn != null) conn.close();
				}catch(Exception e) {
		        }
			}
	         return -1;
	      }
}
