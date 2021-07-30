import Foundation

class QuoteViewModel: ObservableObject {
    
    @Published var quote: [QuoteModel] = []
    
    init() {
        getQuote()
    }
    
    func getQuote() {
        let newQuote = [
            QuoteModel(day: "Monday",
                       quote: "“Our bodies communicate to us clearly and specifically, if we are willing to listen to them.”",
                       author: "- Shakti Gawain -"),
            QuoteModel(day: "Tuesday",
                       quote: "“The only person you are destined to become is the person you decide to be.”",
                       author: "- Ralph Waldo Emerson -"),
            QuoteModel(day: "Wednesday",
                       quote: "“Most people fail, not because of lack of desire, but, because of lack of commitment.”",
                       author: "- Vince Lombardi -"),
            QuoteModel(day: "Thursday",
                       quote: "“Some people want it to happen, some wish it would happen, others make it happen.”",
                       author: "- Michael Jordan -"),
            QuoteModel(day: "Friday",
                       quote: "“All progress takes place outside the comfort zone.”",
                       author: "- Michal Joan Bobak -"),
            QuoteModel(day: "Saturday",
                       quote: "“Physical fitness is not only one of the most important keys to a healthy body, it is the basis of dynamic and creative intellectual activity.”",
                       author: "- John F. Kennedy -"),
            QuoteModel(day: "Sunday",
                       quote: "“Whether you think you can, or you think you can’t, you’re right.”",
                       author: "- Henry Ford -")
        ]
        
        quote.append(contentsOf: newQuote)
    }
}
