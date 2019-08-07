//
//  EmployeeModel.swift
//  MvvmDemo
//
//  Created by Sopan M. Sanap on 07/08/19.
//  Copyright © 2019 Sopan M. Sanap. All rights reserved.
//

import Foundation

class EmployeeModel: Decodable{
    
    var id: String?
    var employee_name: String?
    
    init(employeeId: String, employeeName: String){
        self.id = employeeId
        self.employee_name = employeeName
    }
}
