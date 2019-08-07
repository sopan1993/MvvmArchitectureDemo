//
//  EmployeeViewModel.swift
//  MvvmDemo
//
//  Created by Sopan M. Sanap on 07/08/19.
//  Copyright © 2019 Sopan M. Sanap. All rights reserved.
//

import Foundation

class EmployeeViewModel{
    
    var employeeId: String?
    var employeeName: String?
    
    // Dependency Injection
    init(employe:EmployeeModel){
        
        self.employeeId = employe.id
        self.employeeName = employe.employee_name
    }
    
    
}
