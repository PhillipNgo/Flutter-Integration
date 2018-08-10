package com.phillip.mobile.flutter.integration.base

import android.support.v7.app.AppCompatActivity
import android.os.Bundle
import android.widget.TextView

class SavedSuggestionsActivity : AppCompatActivity() {

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_saved_suggestions)

        // Set the text to the suggestions that were passed in
        val suggestionsTextView = findViewById<TextView>(R.id.textView)
        val suggestionText = intent.extras.getStringArrayList("suggestions").joinToString(separator = "\n")
        suggestionsTextView.text = suggestionText
    }

}