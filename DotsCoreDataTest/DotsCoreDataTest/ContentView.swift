//
//  ContentView.swift
//  DotsCoreDataTest
//
//  Created by 정승균 on 2023/07/17.
//

import SwiftUI

struct ContentView: View {
    @StateObject var dotsModel = DotsModel()
    @State var selectedStrength: StrengthEntity = StrengthEntity()
    @State var strengthName = ""
    
    var body: some View {
        VStack {
            List {
                ForEach(dotsModel.myStrength) { myStrength in
                    VStack {
                        Text("강점명 : \(myStrength.ownStrength?.strengthName ?? "")")
                        Text("강점 레벨 : \(myStrength.strengthLevel)")
                    }
                }
            }
            TextField(text: $strengthName) {
                Text("강점 이름")
            }
            .border(.black)
            HStack {
                Button {
                    dotsModel.addStrength(strengthName: strengthName)
                } label: {
                    Text("강점 추가")
                }
                
                Button {
                    dotsModel.addMyStrength(level: 2, strength: selectedStrength)
                } label: {
                    Text("새로운 강점 생성")
                }
            }
            .padding()
            
            VStack(alignment: .leading, spacing: 20) {
                Text("지금까지 생성된 모든 강점들")
                    .font(.title)
                
                HStack {
                    ForEach(dotsModel.strength) { strength in
                        Text(strength.strengthName ?? "")
                            .font(.headline)
                            .background(Color(strength.strengthColor ?? "blue").opacity(0.5))
                            .onTapGesture {
                                selectedStrength = strength
                                print("선택됨 \(strength)")
                            }
                        
                    }
                }
                
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
