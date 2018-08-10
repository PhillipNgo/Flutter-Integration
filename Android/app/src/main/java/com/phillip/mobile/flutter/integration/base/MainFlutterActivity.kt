package com.phillip.mobile.flutter.integration.base

import android.content.Intent
import android.os.Bundle

import io.flutter.app.FlutterActivity
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugins.GeneratedPluginRegistrant

class MainFlutterActivity : FlutterActivity() {

    // Channel and constants used for passing AppData to Flutter
    private val DATA_CHANNEL = "com.phillip.mobile.flutter.integration.base/AppData"
    private val APP_TITLE = "Native Title"
    private val APP_TYPE = "Android"

    // Channel used for navigation/starting new activities in Flutter
    private val NAV_CHANNEL = "com.phillip.mobile.flutter.integration.base/AppNav"

    // Channel to signify to Flutter an entry point
    private val ENTRY_CHANNEL = "com.phillip.mobile.flutter.integration.base/Entry"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        GeneratedPluginRegistrant.registerWith(this)

        // Handler for sending App Data
        MethodChannel(flutterView, DATA_CHANNEL).setMethodCallHandler{ call, result ->
            when (call.method) {
                "getTitle" -> result.success(APP_TITLE)
                "getType" -> result.success(APP_TYPE)
                else -> result.notImplemented()
            }
        }

        // Handler for navigation
        MethodChannel(flutterView, NAV_CHANNEL).setMethodCallHandler{ call, result ->
            when (call.method) {
                "showFavorites" -> {
                    val intent = Intent(this, SavedSuggestionsActivity::class.java)
                    // Retrieve data from the call and pass it into the intent
                    intent.putExtra("suggestions", call.argument<ArrayList<String>>("suggestions"))
                    startActivity(intent)
                }
                else -> result.notImplemented()
            }
        }

        // Handler for entry
        MethodChannel(flutterView, ENTRY_CHANNEL).setMethodCallHandler{ call, result ->
            when (call.method) {
                "getEntryPoint" -> result.success(intent.extras.getString("EntryPoint"))
                else -> result.notImplemented()
            }
        }
    }

}
