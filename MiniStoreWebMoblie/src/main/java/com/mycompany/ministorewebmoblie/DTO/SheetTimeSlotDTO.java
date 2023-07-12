/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.mycompany.ministorewebmoblie.DTO;

import java.time.LocalTime;

/**
 *
 * @author nanat
 */
public class SheetTimeSlotDTO {
    private String sheet;
    private LocalTime startTime;
    private LocalTime endTime;
    private LocalTime ShiftStartTime;
    private LocalTime ShiftEndTime;
    

    public SheetTimeSlotDTO() {
    }

    public SheetTimeSlotDTO(String sheet, LocalTime startTime, LocalTime endTime, LocalTime ShiftStartTime, LocalTime ShiftEndTime) {
        this.sheet = sheet;
        this.startTime = startTime;
        this.endTime = endTime;
        this.ShiftStartTime = ShiftStartTime;
        this.ShiftEndTime = ShiftEndTime;
    }

    public LocalTime getShiftStartTime() {
        return ShiftStartTime;
    }

    public void setShiftStartTime(LocalTime ShiftStartTime) {
        this.ShiftStartTime = ShiftStartTime;
    }

    public LocalTime getShiftEndTime() {
        return ShiftEndTime;
    }

    public void setShiftEndTime(LocalTime ShiftEndTime) {
        this.ShiftEndTime = ShiftEndTime;
    }

    

    public String getSheet() {
        return sheet;
    }

    public void setSheet(String sheet) {
        this.sheet = sheet;
    }

    public LocalTime getStartTime() {
        return startTime;
    }

    public void setStartTime(LocalTime startTime) {
        this.startTime = startTime;
    }

    public LocalTime getEndTime() {
        return endTime;
    }

    public void setEndTime(LocalTime endTime) {
        this.endTime = endTime;
    }
    
}
