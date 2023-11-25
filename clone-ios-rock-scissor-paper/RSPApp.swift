//
//  RSPApp.swift
//  clone-ios-rock-scissor-paper
//
//  Created by Roh on 11/25/23.
//
import Foundation
// MARK: - RSP game control
class RSPApp {
    var isRunning: Bool = true
    var menuMessage: String = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
    var errorMessage: String = "잘못된 입력입니다. 다시 시도해주세요."
    
    func run () {
        while isRunning {
            // TODO: 플레이어가 정상적으로 승리한 경우 또는 종료 키를 입력한 경우 isRunning = false
            print(menuMessage)
            guard let input = promptInput(),
                  let inputToInt = Int(input),
                  let menu = Menu(rspInput: inputToInt)
            else {
                continue
            }
//            guard let
//            // 유저 플레이어가 정상적으로 가위 바위 보 값을 입력을 함
//            // pc 플레이어가 정상적으로 가위 바위 보 값을 만들어냄
//            else{
//                print(errorMessage)
//            }
        }
    }
    
    private func promptInput() -> String? {
        guard let promptInput = Swift.readLine() else {
            return nil
        }
        // 공백 문자가 들어간것을 예방
        var editPromtInput = promptInput.trimmingCharacters(in: .whitespacesAndNewlines)
        // promptInput 값이 비었을 경우를 대비
        return promptInput.isEmpty ? nil : editPromtInput
    }
}
