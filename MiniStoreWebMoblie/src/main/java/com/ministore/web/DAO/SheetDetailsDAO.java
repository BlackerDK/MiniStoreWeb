/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ministore.web.DAO;

import com.ministore.web.DTO.SheetDetailsDTO;
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
public class SheetDetailsDAO implements Serializable{
    public ArrayList<SheetDetailsDTO>ShowSheetDetails() throws SQLException,NamingException{
        Connection con = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        ArrayList<SheetDetailsDTO> dto = new ArrayList<>();
        try {
            con = DBUtil.makeConnection();
            if (con != null) {
                String sql = "Select sht.Sheet, sht.DescriptionS,sht.CoefficientsSalary,sht.ShiftStartTime,ShiftEndTime, pms.Permission,sht.CheckNight "
                        + "from SheetDetail sht inner join Permission pms on sht.Roles = pms.Roles";
                stm = con.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    dto.add(new SheetDetailsDTO(rs.getInt(1), rs.getString(2), rs.getDouble(3), rs.getTime(4), rs.getTime(5), rs.getString(6),rs.getBoolean(7)));
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
