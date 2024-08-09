//
//  WBAppApp.swift
//  WBApp
//
//  Created by Назар Ткаченко on 05.06.2024.
//

//import SwiftUI
//
//@main
//struct WBAppApp: App {
////    @ObservedObject var router = Router()
//    
//    var body: some Scene {
//        WindowGroup {
////            NavigationStack(path: $router.navPath) {
////                router.getDestination(.onboardingView)
////                    .navigationDestination(for: Router.Destination.self) { destination in
////                        router.getDestination(destination)
////                    }
////            }
////            .environmentObject(router)
////            ChatExampleView(title: "")
//        }
//    }
//}
import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {

    static var orientationLock = UIInterfaceOrientationMask.all

    static func lockOrientationToPortrait() {
        orientationLock = .portrait
        if #available(iOS 16, *) {
            if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                scene.requestGeometryUpdate(.iOS(interfaceOrientations: .portrait))
            }
            UIViewController.attemptRotationToDeviceOrientation()
        } else {
            UIDevice.current.setValue(UIDeviceOrientation.portrait.rawValue, forKey: "orientation")
        }
    }

    static func unlockOrientation() {
        orientationLock = .all
        UIViewController.attemptRotationToDeviceOrientation()
    }

    func application(_ application: UIApplication, supportedInterfaceOrientationsFor window: UIWindow?) -> UIInterfaceOrientationMask {
        return AppDelegate.orientationLock
    }

    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}

@main
struct WBAppApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
