//
//  ViewProtocol.swift
//  ColorSetPicker
//
//  Created by 김태성 on 2023/02/20.
//

import Foundation

protocol ViewAble {
    func configureView()
    func setInitView()
    func drawDesign()
    func setEvent()
}

extension ViewAble {
    func configureView() {
        self.setInitView()
        self.drawDesign()
        self.setEvent()
    }
}
