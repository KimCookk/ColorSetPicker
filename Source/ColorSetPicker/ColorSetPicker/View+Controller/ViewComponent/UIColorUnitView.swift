import Foundation
import UIKit

class UIColorUnitView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.configureView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension UIColorUnitView: ViewAble {
    
    func setInitView() {
        
    }
    
    func drawDesign() {
        
    }
    
    func setEvent() {
        
    }
}

extension UIColorUnitView {
    func changeColor(_ color: UIColor) {
        self.backgroundColor = color
    }
}
