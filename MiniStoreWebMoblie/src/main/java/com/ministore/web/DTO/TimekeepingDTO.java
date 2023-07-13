/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ministore.web.DTO;

import java.sql.Time;
import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author DUY KHANH
 */
@Getter
@Setter
@ToString
@NoArgsConstructor
@AllArgsConstructor
public class TimekeepingDTO{
    private String id;
    private String idEmployees;
    private Date dateWorksheet;
    private int idSheetDetails;
    private Date dateCheckIn;
    private Date dateCheckOut;
    private Boolean status;
    private Time totalTime;   
}
