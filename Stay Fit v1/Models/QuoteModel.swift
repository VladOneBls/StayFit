import Foundation

struct QuoteModel: Identifiable {
    
    let id: String = UUID().uuidString
    let day: String
    let quote: String
    let author: String
    
}
