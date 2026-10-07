import UIKit
import Flutter
import SwiftUI
import HubspotMobileSDK

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

    // MARK: - HubSpot Implementation

    private func initializeHubSpot(result: @escaping FlutterResult) {
        do {
            try HubspotManager.shared.configure()
            result(nil)
        } catch {
            result(
                FlutterError(
                    code: "CONFIG_ERROR",
                    message: "Failed to configure HubSpot: \(error.localizedDescription)",
                    details: nil
                )
            )
        }
    }

    private func setChatProperties(
        userId: String,
        deviceId: String,
        result: @escaping FlutterResult
    ) {
        let properties = [
            "user_id": userId,
            "device_id": deviceId
        ]
        HubspotManager.shared.setChatProperties(data: properties)
        result(nil)
    }

    private func setUserIdentity(
        email: String,
        identityToken: String,
        result: @escaping FlutterResult
    ) {
        HubspotManager.shared.setUserIdentity(identityToken: identityToken, email: email)
        result(nil)
    }

    private func openChat(result: @escaping FlutterResult) {
        DispatchQueue.main.async {
            guard let rootViewController = self.window?.rootViewController else {
                result(
                    FlutterError(
                        code: "PRESENTATION_ERROR",
                        message: "Root view controller not found",
                        details: nil
                    )
                )
                return
            }


            // Initialize HubSpot Chat View Controller and present modally in a Navigation Controller
            let chatVC = HubspotChatView()
            let hostingController = UIHostingController(rootView: chatVC)
            let navController = UINavigationController(rootViewController: hostingController)

            // Add a Done/Close button to allow closing the chat UI
            hostingController.navigationItem.rightBarButtonItem = UIBarButtonItem(
                barButtonSystemItem: .done,
                target: self,
                action: #selector(self.dismissChat)
            )

            rootViewController.present(navController, animated: true) {
                result(nil)
            }
        }
    }

    @objc private func dismissChat() {
        window?.rootViewController?.dismiss(animated: true, completion: nil)
    }

    private func logout(result: @escaping FlutterResult) {
        HubspotManager.shared.clearUserData()
        result(nil)
    }
}