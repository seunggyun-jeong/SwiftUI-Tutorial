//
//  ItemModel.swift
//  TodoList
//
//  Created by 정승균 on 2022/07/08.
//

import Foundation

// Immutable Struct

// 모델을 Codable 프로토콜을 준수하게 하여 JSON 형식의 데이터를 저장하고 읽어올 수 있도록 함
struct ItemModel: Identifiable, Codable {
    let id: String
    let title: String
    let isCompleted: Bool
    
    // id 값을 넣는 경우와 넣지 않는 경우를 구분하여 Update와 Add를 구분
    init(id: String = UUID().uuidString, title: String, isCompleted: Bool) {
        self.id = id // Identifiable 프로토콜을 준수하면서 String 타입의 랜덤 id 값을 생성
        self.title = title
        self.isCompleted = isCompleted
    }
    
    // item 업데이트를 위한 메서드 생성
    func updateCompletion() -> ItemModel {
        return ItemModel(id: id, title: title, isCompleted: !isCompleted)
    }
}
