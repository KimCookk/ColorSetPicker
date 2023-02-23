import Foundation
import UIKit

class UIColorSetView: UIView {
    
    lazy var container: UIStackView = {
       let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
       return stack
    }()
    
    lazy var colorViewList: [UIColorUnitView] = []
    
    let initColorCount = 5
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColorSetView: ViewAble {

    func setInitView() {
        initColorViewList()
    }
    
    func drawDesign() {
        self.addSubview(container)
        container.translatesAutoresizingMaskIntoConstraints = false
        let centerXOfContainer = NSLayoutConstraint(item: container, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1.0, constant: 1.0)
        let centerYOfContainer = NSLayoutConstraint(item: container, attribute: .centerY, relatedBy: .equal, toItem: self, attribute: .centerY, multiplier: 1.0, constant: 1.0)
        let widthOfContainer = NSLayoutConstraint(item: container, attribute: .width, relatedBy: .equal, toItem: self, attribute: .width, multiplier: 1.0, constant: 1.0)
        let heightOfContainer = NSLayoutConstraint(item: container, attribute: .height, relatedBy: .equal, toItem: self, attribute: .height, multiplier: 1.0, constant: 1.0)
        
        self.addConstraints([centerXOfContainer, centerYOfContainer, widthOfContainer, heightOfContainer])
        
        colorViewList.forEach{ colorView in
            container.addArrangedSubview(colorView)
            let widthOfColorView = NSLayoutConstraint(item: colorView, attribute: .width, relatedBy: .equal, toItem: container, attribute: .width, multiplier: 1.0, constant: 1.0)
            container.addConstraint(widthOfColorView)
        }
    }
    
    func setEvent() {
        
    }
}

extension UIColorSetView {
    
    private func initColorViewList() {
        for i in 1...initColorCount {
            colorViewList.append(UIColorUnitView())
        }
    }
    
}
