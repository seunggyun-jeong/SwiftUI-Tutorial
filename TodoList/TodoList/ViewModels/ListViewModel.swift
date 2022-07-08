//
//  ListViewModel.swift
//  TodoList
//
//  Created by 정승균 on 2022/07/08.
//

import Foundation

/*
 1. 백그라운드 데이터 작업은 뷰 모델에서 하도록 뷰 모델 작성
    1.1 모델 데이터 관리
    1.2 모델 관련 메서드 관리
 2. 뷰 모델을 모델을 가지고 있어야 하며 Published Wrapper 변수로 선언하여야 함
 3. 뷰 모델은 ObservableObject 프로토콜을 준수하여야 함
 */

/*
 CRUD FUNCTIONS
 
 Create
 Read
 Update
 Delete
 
 */

class ListViewModel: ObservableObject {
    
    @Published var items: [ItemModel] = []
    
    init() {
        getItems()
    }
    
    func getItems() {
        let newItems = [
            ItemModel(title: "This is the first title!", isCompleted: false),
            ItemModel(title: "This is the second", isCompleted: true),
            ItemModel(title: "Third!", isCompleted: false)
        ]
        items.append(contentsOf: newItems)
    }
    
    func deleteItem(indexSet: IndexSet) {
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int) {
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String) {
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func updateItem(item: ItemModel) {
        if let index = items.firstIndex(where: { $0.id == item.id}) {
            items[index] = item.updateCompletion()
        }
    }
}
