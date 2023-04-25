//
//  StringLiterals.swift
//  TVING-CloneCoding
//
//  Created by 최영린 on 2023/04/09.
//

import Foundation

struct I18N {
    
    struct Login {
        static let tvingLogin = "TVING ID 로그인"
        static let id = "아이디"
        static let password = "비밀번호"
        static let loginButtonTitle = "로그인하기"
        static let findIdButtonTitle = "아이디 찾기"
        static let findPwButtonTitle = "비밀번호 찾기"
        static let createNicknameMessage = "아직 계정이 없으신가요?"
        static let createNicknameButtonTitle = "닉네임 만들러가기"
        
        static let inValidIdMessage = "이메일 형식이 올바르지 않습니다."
        static let inValidIdSubmessage = "다시 입력해주세요."
    }
    
    struct Welcome {
        static let welcomeMessage = "님\n반가워요!"
        static let backButtonTitle = "메인으로"
    }
    
    struct NickName {
        static let nicknameMessage = "닉네임을 입력해주세요"
        static let nicknamePlaceholder = "닉네임을 입력해주세요 (한글)"
        static let saveButtonTitle = "저장하기"
        
        static let inValiNicknameMessage = "닉네임 형식이 올바르지 않습니다."
        static let inValidNicknameSubmessage = "다시 입력해주세요."
    }
}
