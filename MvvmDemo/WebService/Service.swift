//
//  Service.swift
//  MvvmDemo
//
//  Created by Sopan M. Sanap on 07/08/19.
//  Copyright © 2019 Sopan M. Sanap. All rights reserved.
//

import Foundation

class Service: NSObject {
    
    static let sharedInstance = Service()
    
    func getEmployeeData(completion: @escaping([EmployeeModel]?,Error?) -> ()){
        
        let urlStr = "http://dummy.restapiexample.com/api/v1/employees"
        guard let url = URL(string: urlStr) else { return }
        
        URLSession.shared.dataTask(with: url) { (data,response,error) in

            if let err = error {
                print("error ocurred:",err.localizedDescription)
                completion(nil,err)
            }else{
                
                guard let data = data else { return }
                    
                    do{
                        var empData = [EmployeeModel]()
                        let empArr = try JSONDecoder().decode([EmployeeModel].self, from: data)
                        for emp in empArr{
                            empData.append(EmployeeModel(employeeId: emp.id ?? "", employeeName: emp.employee_name ?? ""))
                        }
                        completion(empData,nil)
                        
                     }catch let error{
                        print("Parsing error::",error.localizedDescription)
                        
                     }
                }
            
        }.resume()
        
    }

}
