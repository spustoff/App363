//
//  FriendsViewModel.swift
//  App363
//
//  Created by IGOR on 26/02/2024.
//

import SwiftUI
import CoreData

final class FriendsViewModel: ObservableObject {

    @Published var friendName: String = ""
    @Published var friendAge: String = ""
    @Published var friendLevel: String = ""

    @Published var levels: [String] = ["Beginner", "Intermediate", "PRO"]
    @Published var currentLevel = ""
    
    @Published var isAdd: Bool = false
    @Published var isDetail: Bool = false
    @Published var isDelete: Bool = false

    @Published var friends: [FriendsModel] = []
    @Published var selectedFriend: FriendsModel?

    func addFriend() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let loan = NSEntityDescription.insertNewObject(forEntityName: "FriendsModel", into: context) as! FriendsModel

        loan.friendName = friendName
        loan.friendAge = friendAge
        loan.friendLevel = friendLevel

        CoreDataStack.shared.saveContext()
    }
    
    func fetchFriends() {
        
        let context = CoreDataStack.shared.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<FriendsModel>(entityName: "FriendsModel")

        do {
            
            let result = try context.fetch(fetchRequest)
        
            self.friends = result
            
        } catch let error as NSError {
            
            print("catch")
            
            print("Error fetching persons: \(error), \(error.userInfo)")
            
            self.friends = []
        }
    }
}
