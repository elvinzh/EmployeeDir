//
//  Employee.swift
//  EmployeeDir
//
//  Created by Elvin Zhang on 2023-03-24.
//

import Foundation

struct Employee: Equatable, Codable {
    
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
