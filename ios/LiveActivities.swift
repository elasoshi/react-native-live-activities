import SwiftUI
import ActivityKit

struct GroceryDeliveryAppAttributes: ActivityAttributes, Identifiable {
    public typealias LiveDeliveryData = ContentState

    public struct ContentState: Codable, Hashable {
        var courierName: String
        var deliveryTime: Date
        var heading: String
        var subHeading: String
    }
    var numberOfGroceyItems: Int
    var id = UUID()
}



@objc(LiveActivities)
class LiveActivities: NSObject {

    @objc
    @available(iOS 16.1, *)
    func createActivity() {
        
        if #available(iOS 10.0, *) {
            print("Started")
            let center = UNUserNotificationCenter.current()
            center.requestAuthorization(options: [.alert, .sound, .badge]) { granted, error in
                
                if let error = error {
                    // Handle the error here.
                    print(error.localizedDescription)
                }
                
                // Enable or disable features based on the authorization.
            }
            
            let attributes = GroceryDeliveryAppAttributes(numberOfGroceyItems: 12)
            let contentState = GroceryDeliveryAppAttributes.LiveDeliveryData(courierName: "Mike", deliveryTime: .now + 120, heading: "Shamsudeen", subHeading: "Yusuf")
            do {
                let _ = try Activity<GroceryDeliveryAppAttributes>.request(
                    attributes: attributes,
                    contentState: contentState,
                    pushType: .token)
            } catch (let error) {
                print(error.localizedDescription)
            }
        } else {
            // Fallback on earlier versions
        }
            
        }
    
    @objc
    @available(iOS 16.1, *)
    func endAllActivity() {
           Task {
               for activity in Activity<GroceryDeliveryAppAttributes>.activities{
                   await activity.end(dismissalPolicy: .immediate)
               }
           }
       }
    
    

}
