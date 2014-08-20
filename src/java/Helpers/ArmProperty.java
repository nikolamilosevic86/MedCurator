/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package Helpers;

/**
 *
 * @author nikola
 */
public class ArmProperty {
    //ArmID,PropertyName,  Type,Value,AdditionalInfo,ValueUnit
    int ArmID;
    int ArmPropertyID;

    public int getArmPropertyID() {
        return ArmPropertyID;
    }

    public void setArmPropertyID(int ArmPropertyID) {
        this.ArmPropertyID = ArmPropertyID;
    }
    String PropertyName,Type,Value,AdditionalInfo,ValueUnit;

    public int getArmID() {
        return ArmID;
    }

    public void setArmID(int ArmID) {
        this.ArmID = ArmID;
    }

    public String getPropertyName() {
        return PropertyName;
    }

    public void setPropertyName(String PropertyName) {
        this.PropertyName = PropertyName;
    }

    public String getType() {
        return Type;
    }

    public void setType(String Type) {
        this.Type = Type;
    }

    public String getValue() {
        return Value;
    }

    public void setValue(String Value) {
        this.Value = Value;
    }

    public String getAdditionalInfo() {
        return AdditionalInfo;
    }

    public void setAdditionalInfo(String AdditionalInfo) {
        this.AdditionalInfo = AdditionalInfo;
    }

    public String getValueUnit() {
        return ValueUnit;
    }

    public void setValueUnit(String ValueUnit) {
        this.ValueUnit = ValueUnit;
    }
}
