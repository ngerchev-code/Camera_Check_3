# Keep the JS interface bridge if added later
-keepclassmembers class * {
    @android.webkit.JavascriptInterface <methods>;
}
