//
//  PosterDataModel.swift
//  TVING_CloneCoding
//
//  Created by 최영린 on 2023/05/01.
//

import UIKit

struct PosterDataModel {
    let image: UIImage
}

extension PosterDataModel {
    static func dummy() -> [PosterDataModel] {
        return [PosterDataModel(image: ImageLiterals.Main.dummyImg5),
                PosterDataModel(image: ImageLiterals.Main.dummyImg2),
                PosterDataModel(image: ImageLiterals.Main.dummyImg3),
                PosterDataModel(image: ImageLiterals.Main.dummyImg4),
                PosterDataModel(image: ImageLiterals.Main.dummyImg5)
        ]
    }
}

