//
//  SeriesDataModel.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//
import UIKit

struct SeriesDataModel {
    let image: UIImage
    let title: String
}

extension SeriesDataModel {
    static func dummy() -> [SeriesDataModel] {
        return [SeriesDataModel(image: ImageLiterals.Main.dummyImg1, title: "시그널"),
                SeriesDataModel(image: ImageLiterals.Main.dummyImg2, title: "반지의 제왕"),
                SeriesDataModel(image: ImageLiterals.Main.dummyImg3, title: "해리포터와 마법사의 돌"),
                SeriesDataModel(image: ImageLiterals.Main.dummyImg4, title: "스즈메의 문단속"),
                SeriesDataModel(image: ImageLiterals.Main.dummyImg5, title: "너의 이름은")
        ]
    }
}
