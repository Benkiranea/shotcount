package com.shotcount

import android.content.Intent
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

import com.hubspot.mobilesdk.HubspotManager
import com.hubspot.mobilesdk.HubspotWebActivity

class MainActivity : FlutterActivity() {

    private val CHANNEL = "hubspot_chat"

    override fun configureFlutterEngine(
        flutterEngine: FlutterEngine
    ) {
        super.configureFlutterEngine(flutterEngine)

        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            CHANNEL
        ).setMethodCallHandler { call, result ->

            when (call.method) {

                "initialize" -> {
                    try {
                        val manager =
                            HubspotManager.getInstance(applicationContext)

                        manager.configure()

                        result.success(null)

                    } catch (e: Exception) {
                        result.error(
                            "HUBSPOT_INIT_ERROR",
                            e.message,
                            null
                        )
                    }
                }

                "setChatProperties" -> {
                    try {
                        val userId =
                            call.argument<String>("userId")

                        val deviceId =
                            call.argument<String>("deviceId")

                        if (userId == null || deviceId == null) {
                            result.error(
                                "INVALID_ARGUMENT",
                                "userId and deviceId are required",
                                null
                            )
                            return@setMethodCallHandler
                        }

                        val properties = mapOf(
                            "user_id" to userId,
                            "device_id" to deviceId
                        )

                        val manager =
                            HubspotManager.getInstance(applicationContext)

                        manager.setChatProperties(properties)

                        result.success(null)

                    } catch (e: Exception) {
                        result.error(
                            "HUBSPOT_PROPERTY_ERROR",
                            e.message,
                            null
                        )
                    }
                }

                "setUserIdentity" -> {
                    try {
                        val email =
                            call.argument<String>("email")

                        val identityToken =
                            call.argument<String>("identityToken")

                        if (email == null || identityToken == null) {
                            result.error(
                                "INVALID_ARGUMENT",
                                "email and identityToken are required",
                                null
                            )
                            return@setMethodCallHandler
                        }

                        val manager =
                            HubspotManager.getInstance(applicationContext)

                        manager.setUserIdentity(
                            email,
                            identityToken
                        )

                        result.success(null)

                    } catch (e: Exception) {
                        result.error(
                            "HUBSPOT_IDENTITY_ERROR",
                            e.message,
                            null
                        )
                    }
                }

                "openChat" -> {
                    try {
                        val intent = Intent(
                            this,
                            HubspotWebActivity::class.java
                        )

                        startActivity(intent)

                        result.success(null)

                    } catch (e: Exception) {
                        result.error(
                            "HUBSPOT_CHAT_ERROR",
                            e.message,
                            null
                        )
                    }
                }

                "logout" -> {
                    try {
                        val manager =
                            HubspotManager.getInstance(applicationContext)

                        Thread {
                            try {
                                kotlinx.coroutines.runBlocking {
                                    manager.logout()
                                }

                                runOnUiThread {
                                    result.success(null)
                                }

                            } catch (e: Exception) {

                                runOnUiThread {
                                    result.error(
                                        "HUBSPOT_LOGOUT_ERROR",
                                        e.message,
                                        null
                                    )
                                }
                            }
                        }.start()

                    } catch (e: Exception) {
                        result.error(
                            "HUBSPOT_LOGOUT_ERROR",
                            e.message,
                            null
                        )
                    }
                }

                else -> {
                    result.notImplemented()
                }
            }
        }
    }
}