import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Time;
import java.sql.Date;
import java.sql.ResultSet;

public class StudySessionDao {
  private String dburl = dbConnectorInfo.dburl();
  private String dbuname = dbConnectorInfo.dbuname();
  private String dbpassword = dbConnectorInfo.dbpassword();
  private String dbdriver = dbConnectorInfo.dbdriver();
  
  // Load driver method (same as other DAOs)
  public void loadDriver(String dbdriver) {
      try {
          Class.forName(dbdriver);
      } catch (ClassNotFoundException e) {
          e.printStackTrace();
      }
  }
  
  // Get connection method (same as other DAOs)
  public Connection getConnection() {
      Connection con = null;
      try {
          con = DriverManager.getConnection(dburl, dbuname, dbpassword);
      } catch (SQLException e) {
          e.printStackTrace();
      }
      return con;
  }
  
  // Record a new study session
  public int recordSession(StudySession session, String userId) {
      loadDriver(dbdriver);
      Connection con = getConnection();
      int sessionId = -1;
      
      String insertSessionSql = "INSERT INTO studysession (start_time, end_time, date_recorded) VALUES (?, ?, ?)";
      String insertStudiesSql = "INSERT INTO studies (user_id, session_id) VALUES (?, ?)";
      
      try {
          // Insert into studysession table
          PreparedStatement psSession = con.prepareStatement(insertSessionSql, PreparedStatement.RETURN_GENERATED_KEYS);
          psSession.setTime(1, Time.valueOf(session.getStartTime()));
          psSession.setTime(2, Time.valueOf(session.getEndTime()));
          psSession.setDate(3, Date.valueOf(session.getDateRecorded()));
          
          psSession.executeUpdate();
          
          // Get generated session_id
          ResultSet rs = psSession.getGeneratedKeys();
          if (rs.next()) {
              sessionId = rs.getInt(1);
              
              // Insert into studies table
              PreparedStatement psStudies = con.prepareStatement(insertStudiesSql);
              psStudies.setString(1, userId);
              psStudies.setInt(2, sessionId);
              psStudies.executeUpdate();
          }
      } catch (SQLException e) {
          e.printStackTrace();
      } finally {
          try {
              if (con != null) con.close();
          } catch (SQLException e) {
              e.printStackTrace();
          }
      }
      return sessionId;
  }
}