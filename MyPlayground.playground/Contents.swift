import SwiftUI
import Combine
import Foundation

//class ClubHouseHandsUp: Publisher {
//    typealias Output = String
//    typealias Failure = Never
//
//    func receive<S>(subscriber: S) where S : Subscriber, Failure == S.Failure, Output == S.Input {
//        DispatchQueue.global(qos: .utility).async {
//            let dummy: [String] = ["jack", "tom"]
//            dummy.forEach {
//                _ = subscriber.receive($0)
//            }
//            subscriber.receive(completion: .finished)
//        }
//    }
//}
//
//let handsupPublisher = ClubHouseHandsUp()
//_ = handsupPublisher.sink(receiveCompletion: { _ in
//    print("completed")
//}) {
//    print($0)
//}

// Just : subscriber에게 한 번만 출력하는 Publisher를 선언하는 방법
let publisher = Just("seunggyun")

// sink() : subscriber를 생성하는 메서드
let subscriber = publisher.sink { value in
    print(value)
}

// subscriber 프로토콜을 이용하여 subscriber 선언하기
// subscriber 프로토콜의 요구 조건 Input과 Failure 선언하기
class SeunggyunSubscriber: Subscriber {
    typealias Input = String // 받을 값의 종류
    typealias Failure = Never // 에러의 종류, 에러를 받을 수 없는 경우 Never 사용
    
    // subscriber에게 publisher를 성공적으로 구독했음을 알리고 item을 요청
    func receive(subscription: Subscription) {
        print("구독 시작!")
        subscription.request(.max(2))
    }
    
    // subscriber에게 publisher가 element를 생성했음을 알림
    func receive(_ input: String) -> Subscribers.Demand {
        print("\(input)")
        
        switch input {
        case "Zedd" :
            return .max(1)
        default :
            return .none
        }
       
    }
    
    // subscriber에게 publisher가 정상적으로 또는 오류로 publish를 완료했음을 알림
    func receive(completion: Subscribers.Completion<Never>) {
        print("응 완료야", completion)
    }
}

let publisher2 = ["Zedd", "seunggyun", "jeong", "park"].publisher

publisher2.subscribe(SeunggyunSubscriber())


let currentValueSubject = CurrentValueSubject<String, Never>("Seunggyun")
let subscriberC = currentValueSubject.sink(receiveValue: {
    print($0)
})

currentValueSubject.value = "안녕"
currentValueSubject.send("하이")


let passthroughSubject = PassthroughSubject<String, Never>()
let subscriberP = passthroughSubject.sink(receiveValue: {
    print($0)
})

passthroughSubject.send("HELLO")
passthroughSubject.send("HI")
