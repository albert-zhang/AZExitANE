AZExitANE
=========

<code>NativeApplication.nativeApplication.exit()</code> does not work on iOS. So you can use this extension to exit an app.

Work on both iOS and Android. It actually call the <code>exit()</code> on iOS and <code>NativeApplication.nativeApplication.exit()</code> on other platforms.
