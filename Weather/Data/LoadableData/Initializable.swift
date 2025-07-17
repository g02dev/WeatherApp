import Foundation

protocol Initializable {
    associatedtype DataSource
    
    init?(_ data: DataSource)
}
