//
//  ContentView.swift
//  TestProject
//
//  Created by 정승균 on 2022/06/03.
//

import SwiftUI

struct ContentView: View {
    @State var isToggleOn: Bool = true
    @State var Count: Int = 0
    
    var body: some View {
        VStack {
            Button("1") {
                Count += 1
            }
            
            
            Text("Count : \(Count)")
            ChildView(isToggleOn: $isToggleOn)
            if isToggleOn {
                Text("그으으을자")
            }
        }
    }
}

struct ChildView: View {
    @Binding var isToggleOn: Bool
    
    var body: some View {
        Toggle(isOn: $isToggleOn) {
            Text("글자를 안가립니다.")
        }.padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
