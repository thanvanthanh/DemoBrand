import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
    
        let mainVC = BrandViewController()
        
        let navi = UINavigationController(rootViewController: mainVC)
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        
        return true
    }
}
