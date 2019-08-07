//
//  ViewController.swift
//  MvvmDemo
//
//  Created by Sopan M. Sanap on 07/08/19.
//  Copyright © 2019 Sopan M. Sanap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblEmployee: UITableView!
    
    var arrEmployee: [EmployeeViewModel] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.activityStartAnimating(activityColor: UIColor.white, backgroundColor: UIColor.black.withAlphaComponent(0.5))
        
        getData()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    func getData(){
        
        Service.sharedInstance.getEmployeeData{ (emp,error) in
            
            if error == nil{
                self.arrEmployee = emp?.map({ return EmployeeViewModel(employe: $0) }) ?? []
                print("arrEmployee count is ",self.arrEmployee.count)
                DispatchQueue.main.async {
                    self.view.activityStopAnimating()
                    self.tblEmployee.reloadData()
                }
                
            }
            
        }
        
    }

}
extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.arrEmployee.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let temp = self.arrEmployee[indexPath.row]
        
        cell.textLabel?.text = "Id: " + temp.employeeId!
        cell.detailTextLabel?.text = "Name: " + temp.employeeName!
        return cell
        
    }
}
