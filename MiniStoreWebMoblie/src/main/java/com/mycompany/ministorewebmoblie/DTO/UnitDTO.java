/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ministorewebmoblie.DTO;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author PC
 */
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class UnitDTO {
    private String id;
    private String sku;
    private String Uname;
    private int quantity;
    private double priceImport;
    private double priceExport;
}
