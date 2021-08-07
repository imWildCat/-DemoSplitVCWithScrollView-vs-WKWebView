# DemoSplitVCWithScrollView - A demonstration of legacy `WKWebView` bug in `UISplitViewController`

As described in <https://stackoverflow.com/a/47299321/2949840>,

> This is because the parent UISplitViewController is reporting incorrect dimensions to the WebView - it is (probably) failing to subtract the 0.5 points for the divider line from the detail view's frame.

## Proof

On the simulator "iPad Pro (11-inch)" (iOS 15.0, with Xcode 13 beta),
when the left column is not collapsed,
the width of the `WKScrollView` is `873.5`.
However, the width of its child `WKContentView` is `874`, which may lead to this issue.

In addition,
```swift
webView.scrollView.alwaysBounceHorizontal = false // This does not work at all.
```
does not work


## Video recoding

![recoding](https://user-images.githubusercontent.com/2396817/128588780-633d9e0e-3126-400c-ae23-5833a07a41f6.gif)


## License

MIT
