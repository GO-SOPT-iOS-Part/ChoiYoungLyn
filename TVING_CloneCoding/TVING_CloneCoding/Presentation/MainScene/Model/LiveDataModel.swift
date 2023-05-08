//
//  LiveDataModel.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//

import UIKit

struct LiveDataModel {
    let image: UIImage
    let rank: Int
    let channel: String
    let title: String
    let rating: Double
}

extension LiveDataModel {
    static func dummy() -> [LiveDataModel] {
        return [LiveDataModel(image: ImageLiterals.Login.tvingImg, rank: 1, channel: "Mnet", title: "보이즈 플래닛 12화", rating: 80.0),
                LiveDataModel(image: ImageLiterals.Login.tvingImg, rank: 2, channel: "TvN", title: "서진이네 6화", rating: 24.1),
                LiveDataModel(image: ImageLiterals.Login.tvingImg, rank: 3, channel: "OCN", title: "동네사람들", rating: 20.5),
                LiveDataModel(image: ImageLiterals.Login.tvingImg, rank: 4, channel: "JTBC", title: "아는 형님 123화", rating: 13.3)
        ]
    }
}
