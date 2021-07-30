import Foundation

struct QuoteModel: Identifiable {
    
    let id: String = UUID().uuidString
    let number: Int
    let quote: String
    let author: String
    
}
