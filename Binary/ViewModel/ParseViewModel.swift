import Foundation
import RxCocoa
import RxSwift

protocol ParseViewPresentable {
    typealias Input = (
        parseText: Driver<String>, ()
    )
    
    typealias Output = (
        binary: Driver<String>, ()
    )
    
    typealias ViewModelBuilder = (ParseViewPresentable.Input) -> ParseViewPresentable
    
    var input: ParseViewPresentable.Input { get }
    var output: ParseViewPresentable.Output { get }
}




class ParseViewModel: ParseViewPresentable {
    var input: ParseViewPresentable.Input
    var output: ParseViewPresentable.Output
    
    private let bag = DisposeBag()
    
    init(input: ParseViewPresentable.Input) {
        self.input = input
        self.output = ParseViewModel.output(input: self.input)
    }
    
}

private extension ParseViewModel {
    static func output(input: ParseViewPresentable.Input) -> ParseViewPresentable.Output {
        
        let text = input.parseText.map({ Int($0) ?? 0 }).map({ String($0, radix: 2) }).asDriver()
        
        return (
            binary: text, ()
        )
    }
}
