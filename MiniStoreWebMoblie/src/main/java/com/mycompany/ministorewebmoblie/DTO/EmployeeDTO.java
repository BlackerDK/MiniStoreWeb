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
 * @author nanat
 */
public class EmployeeDTO {

    private String Sex;
    private String CCD;
    private String DoB;
    private String AddressEmp;
    private String Phone;
    private String password;
    private String Picture;
    private String Email;

    public EmployeeDTO(String Sex, String CCD, String DoB, String AddressEmp, String Phone, String password, String Picture, String Email) {
        this.Sex = Sex;
        this.CCD = CCD;
        this.DoB = DoB;
        this.AddressEmp = AddressEmp;
        this.Phone = Phone;
        this.password = password;
        this.Picture = Picture;
        this.Email = Email;
    }

    public String getSex() {
        return Sex;
    }

    public void setSex(String Sex) {
        this.Sex = Sex;
    }

    public String getCCD() {
        return CCD;
    }

    public void setCCD(String CCD) {
        this.CCD = CCD;
    }

    public String getDoB() {
        return DoB;
    }

    public void setDoB(String DoB) {
        this.DoB = DoB;
    }

    public String getAddressEmp() {
        return AddressEmp;
    }

    public void setAddressEmp(String AddressEmp) {
        this.AddressEmp = AddressEmp;
    }

    public String getPhone() {
        return Phone;
    }

    public void setPhone(String Phone) {
        this.Phone = Phone;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPicture() {
        return Picture;
    }

    public void setPicture(String Picture) {
        this.Picture = Picture;
    }

    public String getEmail() {
        return Email;
    }

    public void setEmail(String Email) {
        this.Email = Email;
    }

    public EmployeeDTO() {
    }
}
