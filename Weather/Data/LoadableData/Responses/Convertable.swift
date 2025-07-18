import Foundation

protocol Convertable {
    associatedtype FinalType
    
    func convert() -> FinalType?
}
