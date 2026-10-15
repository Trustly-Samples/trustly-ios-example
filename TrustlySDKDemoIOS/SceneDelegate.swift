import UIKit
import TrustlySDK

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        // The window and root view controller are loaded from Main.storyboard via the scene manifest in Info.plist.
        guard scene is UIWindowScene else { return }

        // Handle URLs received when the app is launched from a cold start.
        handle(urlContexts: connectionOptions.urlContexts)
    }

    func scene(_ scene: UIScene, openURLContexts URLContexts: Set<UIOpenURLContext>) {
        handle(urlContexts: URLContexts)
    }

    private func handle(urlContexts: Set<UIOpenURLContext>) {
        guard urlContexts.contains(where: { $0.url.absoluteString.contains("demoapp:") }) else { return }
        NotificationCenter.default.post(name: .trustlyCloseWebview, object: nil)
    }
}
