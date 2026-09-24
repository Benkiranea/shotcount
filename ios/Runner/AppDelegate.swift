import UIKit
import Flutter

@main
@objc class AppDelegate: FlutterAppDelegate {

    private let hubspotChannelName = "hubspot_chat"

    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {

        GeneratedPluginRegistrant.register(with: self)

        guard let controller = window?.rootViewController as? FlutterViewController else {
            return super.application(
                application,
                didFinishLaunchingWithOptions: launchOptions
            )
        }

        let hubspotChannel = FlutterMethodChannel(
            name: hubspotChannelName,
            binaryMessenger: controller.binaryMessenger
        )

        hubspotChannel.setMethodCallHandler { [weak self] call, result in

            guard let self = self else {
                result(
                    FlutterError(
                        code: "APP_DELEGATE_ERROR",
                        message: "AppDelegate is unavailable",
                        details: nil
                    )
                )
                return
            }

            switch call.method {

            case "initialize":
                self.initializeHubSpot(result: result)

            case "setChatProperties":
                guard let arguments = call.arguments as? [String: Any],
                      let userId = arguments["userId"] as? String,
                      let deviceId = arguments["deviceId"] as? String else {

                    result(
                        FlutterError(
                            code: "INVALID_ARGUMENT",
                            message: "userId and deviceId are required",
                            details: nil
                        )
                    )
                    return
                }

                self.setChatProperties(
                    userId: userId,
                    deviceId: deviceId,
                    result: result
                )

            case "setUserIdentity":
                guard let arguments = call.arguments as? [String: Any],
                      let email = arguments["email"] as? String,
                      let identityToken = arguments["identityToken"] as? String else {

                    result(
                        FlutterError(
                            code: "INVALID_ARGUMENT",
                            message: "email and identityToken are required",
                            details: nil
                        )
                    )
                    return
                }

                self.setUserIdentity(
                    email: email,
                    identityToken: identityToken,
                    result: result
                )

            case "openChat":
                self.openChat(result: result)

            case "logout":
                self.logout(result: result)

            default:
                result(FlutterMethodNotImplemented)
            }
        }

        return super.application(
            application,
            didFinishLaunchingWithOptions: launchOptions
        )
    }

    // MARK: - HubSpot

    private func initializeHubSpot(result: @escaping FlutterResult) {
        // HubSpot SDK initialization will go here.
        result(nil)
    }

    private func setChatProperties(
        userId: String,
        deviceId: String,
        result: @escaping FlutterResult
    ) {
        // HubSpot chat properties implementation will go here.
        result(nil)
    }

    private func setUserIdentity(
        email: String,
        identityToken: String,
        result: @escaping FlutterResult
    ) {
        // HubSpot visitor identity implementation will go here.
        result(nil)
    }

    private func openChat(result: @escaping FlutterResult) {
        // HubSpot chat presentation implementation will go here.
        result(nil)
    }

    private func logout(result: @escaping FlutterResult) {
        // HubSpot logout implementation will go here.
        result(nil)
    }
}
