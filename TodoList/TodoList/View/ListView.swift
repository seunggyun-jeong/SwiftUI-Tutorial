//
//  ListView.swift
//  TodoList
//
//  Created by 정승균 on 2022/07/08.
//

import SwiftUI

struct ListView: View {
    
    // EnvironmentObject Wrapper 변수를 통해 뷰 모델에 접근 함
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack {
            if listViewModel.items.isEmpty {
                NoItemsView()
                    .transition(AnyTransition.opacity.animation(.easeIn))
            }
            else {
                List {
                    ForEach(listViewModel.items) { item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.updateItem(item: item)
                                }
                            }
                    }
                    // 파라미터를 자동으로 연결시키기 때문에 괄호를 생략하여 사용 가능
                    // editing 모드 활성화 시 제어 가능
                    .onDelete(perform: listViewModel.deleteItem) // 리스트에서 Swipe and Delete가 가능하도록 하는 기능
                    .onMove(perform: listViewModel.moveItem)
                }
                .listStyle(PlainListStyle())
            }
        }
        
        .navigationTitle("Todo List ✏️")
        .navigationBarItems(
            leading: EditButton(),
            trailing:
                NavigationLink("Add", destination: AddView())
        )
    }
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ListView()
        }
        .environmentObject(ListViewModel())
        // 프리뷰에 environmentObject를 전달하여야 프리뷰 가능
    }
}


