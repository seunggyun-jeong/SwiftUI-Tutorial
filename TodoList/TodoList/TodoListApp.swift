//
//  TodoListApp.swift
//  TodoList
//
//  Created by 정승균 on 2022/07/08.
//

import SwiftUI

/*
 MVVM Architecture
 
 Model - data point
 View - UI
 ViewModel - manages Models for View
 
 */

@main
struct TodoListApp: App {
    // 모든 뷰에 listViewModel을 전달하기 위해 StateObject 변수로 가장 상위 파일인 TodoListApp.swift에 선언
    // 다른 뷰에서 해당 StateObject의 변경이 있을 경우 모든 뷰에 적용이 가능함
    @StateObject var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .navigationViewStyle(StackNavigationViewStyle())
            .environmentObject(listViewModel)
            // environmentObject를 통해 하위 뷰에 데이터 전달
        }
    }
}
