package com.phillip.mobile.flutter.integration.base

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.content.Intent
import android.view.View

class MainActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)
    }

    /**
     * Starts the MainFlutterActivity
     */
    fun openFlutter(view: View) {
        val intent = Intent(this, MainFlutterActivity::class.java)
        intent.putExtra("EntryPoint", view.tag.toString())
        startActivity(intent)
    }

}
