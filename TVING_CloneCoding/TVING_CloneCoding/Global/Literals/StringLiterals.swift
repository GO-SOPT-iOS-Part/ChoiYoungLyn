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
    
    struct MyPage {
        static let nickName = "닉네임이뭘까요?"
        static let profileChangeButtonTitle = "프로필 전환"
        static let ticket = "나의 이용권"
        static let cash = "티빙캐시"
        static let noTicket = "사용중인 이용권이 없습니다."
        static let myCash = "0"
        static let join1 = "이용권을 구매하고 "
        static let join2 = " 등 인기 TV프로그램과\n다양한 영화 콘텐츠를 자유롭게 시청하세요!"
        static let aboutUserArray = ["이용권" , "1:1 문의 내역", "예약 알림", "회원정보 수정", "프로모션 정보 수신 동의"]
        static let aboutTvingArray = ["공지사항", "이벤트", "고객센터", "티빙 알아보기"]
        static let logoutButtonTitle = "로그아웃"
    }
}
