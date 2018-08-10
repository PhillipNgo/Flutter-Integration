import UIKit
import Flutter

class MyFlutterViewController: FlutterViewController  {
    let APP_TITLE = "Native Title";
    let APP_TYPE = "iOS";
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let dataChannel = FlutterMethodChannel.init(name: "com.phillip.mobile.flutter.integration.base/AppData", binaryMessenger: self);
        dataChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case "getTitle":
                result(self.APP_TITLE)
                break;
            case "getType":
                result(self.APP_TYPE)
                break;
            default: result(FlutterMethodNotImplemented)
            }
        })

        // Create favoritesViewController out of handler so there will only be one instance
        let favoritesViewController = self.storyboard?.instantiateViewController(withIdentifier: "favoritesViewController") as? FavoritesViewController

        let navChannel = FlutterMethodChannel.init(name: "com.phillip.mobile.flutter.integration.base/AppNav", binaryMessenger: self);
        navChannel.setMethodCallHandler({
            (call: FlutterMethodCall, result: FlutterResult) -> Void in
            switch call.method {
            case "showFavorites":
                let favoritesList = (call.arguments as! NSDictionary)["suggestions"] as! [String]
                favoritesViewController?.favoritesList = favoritesList
                self.navigationController?.pushViewController(favoritesViewController!, animated: true)
                break;
            default: result(FlutterMethodNotImplemented)
            }
        })
    }
}
