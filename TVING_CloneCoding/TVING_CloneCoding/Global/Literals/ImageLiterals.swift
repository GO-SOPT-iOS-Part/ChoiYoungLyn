//
//  ImageLiterals.swift
//  TVING-CloneCoding
//
//  Created by 최영린 on 2023/04/09.
//

import UIKit

struct ImageLiterals {
    
    struct Common {
        static var beforeBtn: UIImage { .load(name: "btn_before")}
    }
    
    struct Login {
        static var clearIcon: UIImage { .load(name: "icn_clear")}
        static var securityIcon: UIImage { .load(name: "icn_security")}
        static var tvingImg: UIImage { .load(name: "img_tving")}
    }
    
    struct MyPage {
        static var noticifationIcon: UIImage { .load(name: "icn_notification")}
        static var settingIcon: UIImage { .load(name: "icn_setting") }
        static var profileImg: UIImage { .load(name: "img_profile") }
        static var ticketIcon: UIImage { .load(name: "icn_ticket") }
        static var cashIcon: UIImage { .load(name: "icn_cash") }
        static var jtbcImg: UIImage { .load(name: "img_jtbc") }
        static var tvnImg: UIImage { .load(name: "img_tvn") }
        static var detailBtn: UIImage { .load(name: "btn_detail") }
    }
    
    struct Main {
        static var dummyImg1: UIImage { .load(name: "img_1")}
        static var dummyImg2: UIImage { .load(name: "img_2")}
        static var dummyImg3: UIImage { .load(name: "img_3")}
        static var dummyImg4: UIImage { .load(name: "img_4")}
        static var dummyImg5: UIImage { .load(name: "img_5")}
    }
    
}
