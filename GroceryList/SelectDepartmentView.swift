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
    let borderRadius: Int = 20
    let circleRadius: Int = 11
    let circleLineThickness: CGFloat = CGFloat(2.5)
    
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
        produceData.borderColor = Colors().jade
        produceData.circleColor = Colors().jade
        produceData.borderRadius = self.borderRadius
        produceData.circleRadius = self.circleRadius
        produceData.circleLineThickness = self.circleLineThickness
        
        var generalData = TNCircularRadioButtonData()
        generalData.labelText = "General"
        generalData.identifier = Department.General.rawValue
        generalData.selected = true
        generalData.borderColor = Colors().absestos
        generalData.circleColor = Colors().absestos
        generalData.borderRadius = self.borderRadius
        generalData.circleRadius = self.circleRadius
        generalData.circleLineThickness = self.circleLineThickness
        
        var meatData = TNCircularRadioButtonData()
        meatData.labelText = "Meat"
        meatData.identifier = Department.Meat.rawValue
        meatData.selected = false
        meatData.borderColor = Colors().radicalRed
        meatData.circleColor = Colors().radicalRed
        meatData.borderRadius = self.borderRadius
        meatData.circleRadius = self.circleRadius
        meatData.circleLineThickness = self.circleLineThickness
        
        var dairyData = TNCircularRadioButtonData()
        dairyData.labelText = "Dairy"
        dairyData.identifier = Department.Dairy.rawValue
        dairyData.selected = false
        dairyData.borderColor = Colors().creamCan
        dairyData.circleColor = Colors().creamCan
        dairyData.borderRadius = self.borderRadius
        dairyData.circleRadius = self.circleRadius
        dairyData.circleLineThickness = self.circleLineThickness
        
        var personalCareData = TNCircularRadioButtonData()
        personalCareData.labelText = "Personal Care"
        personalCareData.identifier = Department.PersonalCare.rawValue
        personalCareData.selected = false
        personalCareData.borderColor = Colors().plum
        personalCareData.circleColor = Colors().plum
        personalCareData.borderRadius = self.borderRadius
        personalCareData.circleRadius = self.circleRadius
        personalCareData.circleLineThickness = self.circleLineThickness
        
        var frozenFoodData = TNCircularRadioButtonData()
        frozenFoodData.labelText = "FrozenFood"
        frozenFoodData.identifier = Department.FozenFood.rawValue
        frozenFoodData.selected = false
        frozenFoodData.borderColor = Colors().picton
        frozenFoodData.circleColor = Colors().picton
        frozenFoodData.borderRadius = self.borderRadius
        frozenFoodData.circleRadius = self.circleRadius
        frozenFoodData.circleLineThickness = self.circleLineThickness
        
        var radioButtonData: [TNCircularRadioButtonData] = [generalData, produceData, dairyData, meatData, personalCareData, frozenFoodData]
        
        self.departmentGroup = TNRadioButtonGroup(radioButtonData: radioButtonData, layout: TNRadioButtonGroupLayoutVertical)
        self.departmentGroup.identifier = "Department Group"
        self.departmentGroup.create()

        self.departmentGroup.position = CGPointMake(30.0, 195.0)

        self.addSubview(self.departmentGroup)

    }
    
    
}
