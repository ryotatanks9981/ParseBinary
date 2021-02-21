import UIKit
import RxCocoa
import RxSwift

class ParseViewController: UIViewController {

    private var viewModel: ParseViewPresentable!
    var viewModelBuilder: ParseViewPresentable.ViewModelBuilder!
    
    private let label = Label()
    private let textField = TextField()
    private lazy var stackView = UIStackView(arrangedSubviews: [label, textField])
    
    private let bag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        viewModel = viewModelBuilder((
            parseText: textField.rx.text.orEmpty.asDriver(), ()
        ))
        
        setupLayout()
        setupBinding()
    }
    
    private func setupLayout() {
        
        view.addSubview(stackView)
        
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        stackView.spacing = 10
        
        let viewWidth = view.frame.size.width
        let stackWidth = view.frame.size.width / 1.3
        let viewHeight = view.frame.size.height
        stackView.frame = .init(x: (viewWidth-stackWidth)/2, y: (viewHeight-100)/2, width: stackWidth, height: 100)
    }
    
    private func setupBinding() {
        self.viewModel.output.binary
            .drive(label.rx.text)
            .disposed(by: bag)
    }


}

