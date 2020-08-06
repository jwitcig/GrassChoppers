import Foundation

/// The set of supported analytics events.
/// Each event has a mapping to its string representation.
enum AnalyticsEvent: String {
    
    /// The app was launched.
    case appLaunch = "app_launch"
    
    /// The app was sent to the background.
    case appBackgrounded = "app_backgrounded"
    
    /// The app was launched from having been backgrounded.
    case appResumed = "app_resumed"
    
    /// The user viewed the Home screen.
    case homeScreenViewed = "home_screen_viewed"
}

/// The interface that anthing acting as an analytics tracker must have.
protocol AnalyticsTracking {
    
    /// Records an analytics event.
    /// - Parameter event: The event to be tracked.
    func track(event: AnalyticsEvent)
}

/// A type for recording analytics events to the server.
class AnalyticsTracker: AnalyticsTracking {
    
    /// The network session configuration ot be used when sending events.
    private let urlSession: URLSession
    
    /// Creates a new AnalyticsTracker.
    /// - Parameter urlSession: The network session configuration ot be used when sending events.
    init(urlSession: URLSession) {
        self.urlSession = urlSession
    }
    
    /// Records an analytics event.
    /// - Parameter event: The event to be tracked.
    func track(event: AnalyticsEvent) {
        
        // specify where the server is
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")!
//        let url = URL(string: "https://api.grasschoppers.com/track-event")!
        
        // create a request
        var request = URLRequest(url: url)
        // specify that we are sending data, not fetching
        request.httpMethod = "POST"
        // specify that we are sending data in JSON format
        request.addValue("application/json", forHTTPHeaderField: "Content-type")
        
        // some fake data to send (including the event that was passed in)
        let mockPayload: [String : Any] = [
            "title": "foo",
            "body": event.rawValue,
            "userId": 1
        ]
        
        // encode the payload as JSON; if it fails, just return
        guard let jsonData = try? JSONSerialization.data(withJSONObject: mockPayload, options: .fragmentsAllowed) else {
            // failed to encode data
            return
        }
        
        // attach the JSON data to the request
        request.httpBody = jsonData
        
        // create a data task with the URLSession (networking configuration)
        // and execute this completion handler when finished
        let task = urlSession.dataTask(with: request) { data, response, error in
            if let data = data {
                // there's some data in the response, print it out
                print(String(data: data, encoding: .utf8)!)
            } else {
                // there was an error, print it out
                print(error)
            }
        }
        
        // send the request
        task.resume()
    }
}

/// A type for mocking the recording of analytics events to the server.
class MockAnalyticsTracker: AnalyticsTracking {
    
    /// Creates a new MockAnalyticsTracker.
    init() {
        
    }
    
    /// Fakes the recording of an analytics event.
    func track(event: AnalyticsEvent) {
        // dont actually do anything
    }
}
