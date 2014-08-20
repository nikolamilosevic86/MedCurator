package Helpers;


import java.util.LinkedList;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author nikola
 */
public class ClinicalArm {
    private String ArmName;
    private int NoPatients;
    private int NoMale;
    private int NoFemale;
    private int ArmID;

    public int getArmID() {
        return ArmID;
    }

    public void setArmID(int ArmID) {
        this.ArmID = ArmID;
    }
    public LinkedList<ArmProperty> properties = new LinkedList<ArmProperty>();
    
    public String getArmName() {
        return ArmName;
    }

    public void setArmName(String ArmName) {
        this.ArmName = ArmName;
    }

    public int getNoPatients() {
        return NoPatients;
    }

    public void setNoPatients(int NoPatients) {
        this.NoPatients = NoPatients;
    }

    public int getNoMale() {
        return NoMale;
    }

    public void setNoMale(int NoMale) {
        this.NoMale = NoMale;
    }

    public int getNoFemale() {
        return NoFemale;
    }

    public void setNoFemale(int NoFemale) {
        this.NoFemale = NoFemale;
    }

    
    
}
