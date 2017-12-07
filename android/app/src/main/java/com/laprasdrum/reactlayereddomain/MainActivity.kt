package com.laprasdrum.reactlayereddomain

import com.facebook.react.ReactFragmentActivity

class MainActivity : ReactFragmentActivity() {

    /**
     * Returns the name of the main component registered from JavaScript.
     * This is used to schedule rendering of the component.
     */
    override fun getMainComponentName(): String? {
        return "ReactLayeredDomain"
    }
}
