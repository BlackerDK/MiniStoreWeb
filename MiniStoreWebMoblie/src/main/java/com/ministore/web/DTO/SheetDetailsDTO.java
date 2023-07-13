/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.ministore.web.DTO;

import java.sql.Time;
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
public class SheetDetailsDTO {
    private int IdSheet;
    private String DecriptionDetails;
    private double Coefficients;
    private Time ShiftStart;
    private Time ShiftEnd;
    private int Roles;
    private Boolean CheckNight;
}
