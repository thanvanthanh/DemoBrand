import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // khởi tạo cửa sổ
        window = UIWindow(frame: UIScreen.main.bounds)
        
        //  khởi tạo màn hình chính
        let mainVC = BrandViewController()
        
        let navi = UINavigationController(rootViewController: mainVC)
        // khởi tạo navigationController
//        let mainNavigationController = UINavigationController(rootViewController: mainVC)
        
        // gán root ViewController
        window?.rootViewController = navi
        window?.makeKeyAndVisible()
        
        return true
    }
}
