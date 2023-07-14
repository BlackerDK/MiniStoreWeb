/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ministore.web.DAO;

import com.ministore.web.DTO.TimekeepingDTO;
import com.mycompany.ministorewebmoblie.Utils.DBUtil;
import java.io.Serializable;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.naming.NamingException;

/**
 *
 * @author DUY KHANH
 */
public class WorkSheetDAO implements Serializable {

    public ArrayList<TimekeepingDTO> ShowHistory() throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<TimekeepingDTO> dto = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select ws.IdWorkSheet,e.FullNameEmp,ws.Date,ws.Sheet,ws.TimeCheckIn,ws.TimeCheckOut,ws.Status,ws.Total_working_hours "
                        + "from Employee e inner join WorkSheet ws "
                        + "on e.IdEmp =ws.IdEmp";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    dto.add(new TimekeepingDTO(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getInt(4), rs.getDate(5), rs.getDate(6), rs.getBoolean(7), rs.getTime(8)));
                }
            }
        } finally {
            if (con != null) {
                con.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (rs != null) {
                rs.close();
            }
        }
        return dto;
    }

    public boolean updateWorkSheet(String id, int sheet)
            throws SQLException, NamingException {
        Connection con = null;
        PreparedStatement stm = null;//Do dạng tham số động
        ResultSet rs = null;
        boolean result = false;
        try {
            //1 . Connect Database
            con = DBUtil.makeConnection();
            //2 . Create SQL Statement String
            if (con != null) { // Trong username là khóa chính
                String sql = "UPDATE WorkSheet\n"
                        + "SET Sheet = ?\n"
                        + "where IdWorkSheet = ?";
                //Điều kiện của hidden username
                //3 . Create Statement to SET SQL
                stm = con.prepareStatement(sql);//Nạp  này vào Obj                
                stm.setInt(1, sheet);
                stm.setString(2, id);
                //4 . Execute Query
                int row = stm.executeUpdate();
                if (row > 0) {
                    result = true;
                }
                //5 . Process
            }//End if connection is process
        } finally {
            if (rs != null) {
                rs.close();
            }
            if (stm != null) {
                stm.close();
            }
            if (con != null) {
                con.close();
            }
        }
        return result;
    }

//    public boolean deleteBook(String primaryKey)
//            throws SQLException, NamingException {
//        Connection con = null;
//        PreparedStatement stm = null;//Do dạng tham số động
//        ResultSet rs = null;
//        boolean result = false;
//        try {
//            //1 . Connect Database
//            con = DBUtil.makeConnection();
//            //2 . Create SQL Statement String
//            if (con != null) { // Trong username là khóa chính
//                String sql = "DELETE from BookTable "
//                        + "WHERE IDBook = ?";
//                //Điều kiện của hidden username
//                //3 . Create Statement to SET SQL
//                stm = con.prepareStatement(sql);//Nạp  này vào Obj                
//                stm.setString(1, primaryKey);
//                //4 . Execute Query
//                int row = stm.executeUpdate();
//                if (row > 0) {
//                    result = true;
//                }
//                //5 . Process
//            }//End if connection is process
//        } finally {
//
//            if (stm != null) {
//                stm.close();
//            }
//            if (con != null) {
//                con.close();
//            }
//        }
//        return result;
//    }
}
