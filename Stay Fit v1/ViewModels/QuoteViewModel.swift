import Foundation

class QuoteViewModel: ObservableObject {
    
    @Published var quote: [QuoteModel] = []
    
    init() {
        getQuote()
    }
    
    func getQuote() {
        let newQuote = [
            QuoteModel(number: 1,
                       quote: "“Our bodies communicate to us clearly and specifically, if we are willing to listen to them.”",
                       author: "- Shakti Gawain"),
            QuoteModel(number: 2,
                       quote: "“The only person you are destined to become is the person you decide to be.”",
                       author: "- Ralph Waldo Emerson")
        ]
        
        quote.append(contentsOf: newQuote)
    }
}
