//
//  SelectDepartmentView.swift
//  GroceryList
//
//  Created by bearclough on 11/28/14.
//  Copyright (c) 2014 bearclough. All rights reserved.
//

import Foundation
import UIKit

class SelectDepartmentView: UIView {
    
    var departmentGroup: TNRadioButtonGroup
    
    required init(coder aDecoder: NSCoder) {
        
        self.departmentGroup = TNRadioButtonGroup()
        
        super.init(coder: aDecoder)
        
        self.createDepartmentGroupList()
    }
    
    override init(frame: CGRect) {
        
        self.departmentGroup = TNRadioButtonGroup()
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.whiteColor()
        self.createDepartmentGroupList()
    }
    
    func createDepartmentGroupList() {
        
        var produceData = TNCircularRadioButtonData()
        produceData.labelText = "Produce"
        produceData.identifier = Department.Produce.rawValue
        produceData.selected = false
        //produceData.borderColor = .blackColor()
        //produceData.circleColor = .blackColor()
        //produceData.borderRadius = 12
        //produceData.circleRadius = 5
        //produceData.circleLineThickness = 1.0
        
        var generalData = TNCircularRadioButtonData()
        generalData.labelText = "General"
        generalData.identifier = Department.General.rawValue
        generalData.selected = true
        
        var meatData = TNCircularRadioButtonData()
        meatData.labelText = "Meat"
        meatData.identifier = Department.Meat.rawValue
        meatData.selected = false
        
        var dairyData = TNCircularRadioButtonData()
        dairyData.labelText = "Dairy"
        dairyData.identifier = Department.Dairy.rawValue
        dairyData.selected = false
        
        var personalCareData = TNCircularRadioButtonData()
        personalCareData.labelText = "Personal Care"
        personalCareData.identifier = Department.PersonalCare.rawValue
        personalCareData.selected = false
        
        var frozenFoodData = TNCircularRadioButtonData()
        frozenFoodData.labelText = "FrozenFood"
        frozenFoodData.identifier = Department.FozenFood.rawValue
        frozenFoodData.selected = false
        
        var radioButtonData: [TNCircularRadioButtonData] = [generalData, produceData, dairyData, meatData, personalCareData, frozenFoodData]
        
        self.departmentGroup = TNRadioButtonGroup(radioButtonData: radioButtonData, layout: TNRadioButtonGroupLayoutVertical)
        self.departmentGroup.identifier = "Department Group"
        self.departmentGroup.create()
        //self.departmentGroup.position = CGPointMake(25.0, 175.0)
        self.addSubview(self.departmentGroup)

    }
    
    
}
