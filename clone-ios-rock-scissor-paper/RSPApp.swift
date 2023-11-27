//
//  RSPApp.swift
//  clone-ios-rock-scissor-paper
//
//  Created by Roh on 11/25/23.
//
import Foundation
// MARK: - RSP game control
final class RSPApp {
    var isRunning: Bool = true
    var menuMessage: String = "가위(1), 바위(2), 보(3)! <종료 : 0> :"
    var errorMessage: String = "잘못된 입력입니다. 다시 시도해주세요."
    var drawMessage: String = "비겼습니다!"
    var winMessage: String = "이겼습니다!"
    var loseMessage: String = "졌습니다!"
    var exitMessage: String = "게임 종료"
    
    var hand : Hand?
    
    var userPlayer: Player {
        get {
            return Player(hand: self.hand)
        }
    }
    var pcPlayer: Player {
        get {
            return Player(hand: nil)
        }
    }
    
    func run () {
        while isRunning {
            // TODO: 플레이어가 정상적으로 승리한 경우 또는 종료 키를 입력한 경우 isRunning = false
            print(menuMessage)
            guard let input = promptInput(),
                  let inputToInt = Int(input),
                  let menu = Menu(rspInput: inputToInt)
            else {
                print(errorMessage)
                continue
            }
            processMenu(menu)
        }
    }
}

extension RSPApp {
    private func processMenu(_ menu: Menu) {
        switch menu {
        case .rsp(let hand):
            // hand를 유저, pc player 객체에 저장
            self.hand = hand
            let winloseResult = judgeRSP(userPlayer, pcPlayer)
            handleResult(winloseResult)
        
            // 이제 이기거나 비기거나를 비교해야됨
        case .exit:
            print("게임 종료")
            isRunning = false
        }
    }
    
    private func judgeRSP(_ userPlayer: Player, _ pcPlayer: Player) -> RSPResult {
        if userPlayer.hand == pcPlayer.hand {
            return .draw
        }
        else {
            let winner = userPlayer.hand.wins(pcPlayer.hand) ? userPlayer : pcPlayer
            return .winner(winner)
        }
    }
    
    private func handleResult(_ winloseResult: RSPResult) {
        switch winloseResult {
        case .draw:
            print(drawMessage)
        case.winner(let Player):
            if Player.isUser {
                print(winMessage)
            }
            else {
                print(loseMessage)
            }
            exit()
        }
    }
    
    private func exit() {
        print(exitMessage)
        self.isRunning = false
    }
}

extension RSPApp {
    private func promptInput() -> String? {
        guard let promptInput = Swift.readLine() else {
            return nil
        }
        // 공백 문자가 들어간것을 예방
        let editPromtInput = promptInput.trimmingCharacters(in: .whitespacesAndNewlines)
        // promptInput 값이 비었을 경우를 대비
        return promptInput.isEmpty ? nil : editPromtInput
    }
}
