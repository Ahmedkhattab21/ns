import UIKit

class UserActivityHandler: NSObject {
    static func createActivity() -> NSUserActivity {
        let activity = NSUserActivity(activityType: "com.example.myapp.myactivity")
        activity.title = "My Activity"
        activity.userInfo = ["key": "value"]
        /*
        //print data
        print("Key")
        if let userInfo = activity.userInfo as? [String: Any] {
                   for (key, value) in userInfo {
                       print("Key: \(key), Value: \(value)")
                   }
               }
     
        // Set any additional information you want to pass.
*/
        return activity
    }
}
