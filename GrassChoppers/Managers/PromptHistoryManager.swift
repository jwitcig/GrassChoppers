import Foundation

enum PromptType: String, Codable {
    case notifications
    case appStoreReview
    case upsell
    case promo
}

enum PromptTrigger: String, Codable {
    case appLaunch
}

enum PromptResponse: String, Codable {
    case accepted
    case dismissed
    case doNotRepeat
}

struct PromptEvent: Codable {
    let type: PromptType
    let trigger: PromptTrigger
    let timestamp: Date
    let session: String
    let response: PromptResponse
}

class PromptHistoryManager {
    
    init() {
        
    }
    
    func record(event: PromptEvent) {
        
        let storage = UserDefaults.standard
        
        let encoder = JSONEncoder()
        if let encodedData = try? encoder.encode(event) {
            storage.set(encodedData, forKey: "prompt_events")
        }
    }
    
    func fetchEvents() -> [PromptEvent] {
        
        let storage = UserDefaults.standard
        
        let decoder = JSONDecoder()
        
        if let rawData = storage.data(forKey: "prompt_events"),
            let promptEvent = try? decoder.decode(PromptEvent.self, from: rawData) {
            
            return [promptEvent]
        }
        
        return []
    }
}
