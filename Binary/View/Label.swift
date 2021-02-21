import UIKit

class Label: UILabel {
    
    init() {
        super.init(frame: .zero)
        font = .boldSystemFont(ofSize: 30)
        textAlignment = .center
        textColor = .systemPink
        numberOfLines = 0
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
