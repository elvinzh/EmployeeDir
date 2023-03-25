//
//  Employee.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import Foundation

let mockEmployee1 = Employee(uuid: "0d8fcc12-4d0c-425c-8355-390b312b909c", fullName: "Justine Mason", phoneNumber: "5553280123", emailAddress: "jmason.demo@squareup.com", biography: "Engineer on the Point of Sale team.", photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/small.jpg", photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/16c00560-6dd3-4af4-97a6-d4754e7f2394/large.jpg", team: "Point of Sale", employeeType: .fullTime)

let mockEmployee2 = Employee(uuid: "a98f8a2e-c975-4ba3-8b35-01f719e7de2d", fullName: "Camille Rogers", phoneNumber: "5558531970", emailAddress: "crogers.demo@squareup.com", biography: "Designer on the web marketing team.", photoUrlSmall: "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/small.jpg", photoUrlLarge: "https://s3.amazonaws.com/sq-mobile-interview/photos/5095a907-abc9-4734-8d1e-0eeb2506bfa8/large.jpg", team: "Public Web & Marketing", employeeType: .partTime)

class Employee: Equatable, Hashable, Codable {
    static func == (lhs: Employee, rhs: Employee) -> Bool {
        return lhs.uuid == rhs.uuid;
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(uuid)
    }
    
    var uuid: String
    var fullName: String
    var phoneNumber: String?
    var emailAddress: String
    var biography: String?
    var photoUrlSmall: String?
    var photoUrlLarge: String?
    var team: String
    
    enum EmployeeType: String, Codable{
        case fullTime = "FULL_TIME"
        case partTime = "PART_TIME"
        case contractor = "CONTRACTOR"
    }
    var employeeType: EmployeeType
    
    init(uuid: String,
         fullName: String,
         phoneNumber: String? = nil,
         emailAddress: String,
         biography: String? = nil,
         photoUrlSmall: String? = nil,
         photoUrlLarge: String? = nil,
         team: String,
         employeeType: EmployeeType) {
        
        self.uuid = uuid
        self.fullName = fullName
        self.phoneNumber = phoneNumber
        self.emailAddress = emailAddress
        self.biography = biography
        self.photoUrlSmall = photoUrlSmall
        self.photoUrlLarge = photoUrlLarge
        self.team = team
        self.employeeType = employeeType
    }
}
