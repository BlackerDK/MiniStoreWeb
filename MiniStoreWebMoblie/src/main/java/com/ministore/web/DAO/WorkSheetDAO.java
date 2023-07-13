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
public class WorkSheetDAO implements Serializable{
    public ArrayList<TimekeepingDTO>ShowHistory() throws SQLException,NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<TimekeepingDTO> dto = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "select * from WorkSheet";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    dto.add(new TimekeepingDTO(rs.getString(1), rs.getString(2), rs.getDate(3), rs.getInt(4), rs.getDate(5), rs.getDate(6),rs.getBoolean(7),rs.getTime(8)));
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
}
