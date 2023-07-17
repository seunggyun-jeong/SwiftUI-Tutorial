//
//  CoreDataManager.swift
//  DotsCoreDataTest
//
//  Created by 정승균 on 2023/07/17.
//

import Foundation
import CoreData

class CoreDataManager {
    static let instance = CoreDataManager() // singleton
    let container: NSPersistentContainer
    let context: NSManagedObjectContext
    
    init() {
        // Container 지정 = Database
        container = NSPersistentContainer(name: "DotsDB")
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Error loading Core Data. \(error)")
            }
        }
        // context 지정 = Database 저장 관리자
        context = container.viewContext
    }
    
    func save() {
        do {
            try context.save()
            print("Saved Successfully!")
        } catch let error {
            print("Saving error. \(error.localizedDescription)")
        }
    }
}

class DotsModel: ObservableObject {
    let manager = CoreDataManager.instance
    @Published var myStrength: [MyStrengthEntity] = []
    @Published var strength: [StrengthEntity] = []
    
    init() {
        getModel()
    }
    
    func save() {
        // 메모리에 올라온 객체 모두 제거
        myStrength.removeAll()
        strength.removeAll()
        
        // 저장된 객체를 새로 뽑아옴
        manager.save()
        self.getModel()
    }
    
}

// Get Functions
extension DotsModel {
    func getModel() {
        getMyStrength()
        getStrength()
    }
    
    func getMyStrength() {
        let request = NSFetchRequest<MyStrengthEntity>(entityName: "MyStrengthEntity")
        do {
            myStrength = try manager.context.fetch(request)
        } catch let error {
            print("Fetching Error. \(error.localizedDescription)")
        }
    }
    
    func getStrength() {
        let request = NSFetchRequest<StrengthEntity>(entityName: "StrengthEntity")
        do {
            strength = try manager.context.fetch(request)
        } catch let error {
            print("Fetching Error. \(error.localizedDescription)")
        }
    }
}

extension DotsModel {
    func addMyStrength(level: Int16, strength: StrengthEntity) {
        let newMyStrength = MyStrengthEntity(context: manager.context)
        
        newMyStrength.myStrengthUUID = UUID()
        newMyStrength.strengthLevel = level
        newMyStrength.ownStrength = strength
        save()
    }
    
    func addStrength(strengthName: String) {
        let newStrength = StrengthEntity(context: manager.context)
        newStrength.strengthName = strengthName
        newStrength.strengthColor = "red"
        
        save()
    }
}
