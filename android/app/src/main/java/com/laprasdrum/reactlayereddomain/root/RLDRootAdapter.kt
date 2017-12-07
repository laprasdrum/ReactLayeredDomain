package com.laprasdrum.reactlayereddomain.root

import android.content.Intent
import android.util.Log
import com.facebook.react.bridge.ReactApplicationContext
import com.facebook.react.bridge.ReactContextBaseJavaModule
import com.facebook.react.bridge.ReactMethod
import com.facebook.react.bridge.ReadableArray

const val REACT_MOUNTED_ROOT_MODEL = "REACT_MOUNTED_ROOT_MODEL"
const val LANGUAGE = "LANGUAGE"

class RLDRootAdapter(context: ReactApplicationContext?): ReactContextBaseJavaModule(context) {
    override fun getName(): String = "RLDRootAdapter"

    @ReactMethod
    fun emitChange(obj: ReadableArray) {
        Log.d("TEST", "----------------------------------------------------------------------------------")
        Log.d("TEST", obj.javaClass.name)
        val intent = Intent(REACT_MOUNTED_ROOT_MODEL).also {
            it.putStringArrayListExtra(LANGUAGE, arrayListOf(obj.))
        }
    }
}