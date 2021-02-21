import UIKit

class TextField: UITextField {
    init() {
        super.init(frame: .zero)
        borderStyle = .roundedRect
        leftView = UIView(frame: .init(x: 0, y: 0, width: 5, height: 0))
        leftViewMode = .always
        rightView = UIView(frame: .init(x: 0, y: 0, width: 5, height: 0))
        rightViewMode = .always
        
        placeholder = "10進数を入力してください"
    }
    
    required init?(coder: NSCoder) {
        fatalError("error")
    }
}
