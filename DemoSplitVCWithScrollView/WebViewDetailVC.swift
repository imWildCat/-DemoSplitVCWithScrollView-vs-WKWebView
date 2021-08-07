//

import UIKit
import WebKit

class WebViewDetailVC: UIViewController {
  lazy var webView = WKWebView(frame: .zero)

  var isHackingContentInsetOn: Bool = false

  override func viewDidLoad() {
    super.viewDidLoad()

    webView.translatesAutoresizingMaskIntoConstraints = false

    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Toggle contentInset", primaryAction: UIAction(handler: { [weak self] _ in
      self?.toggle()
    }), menu: nil)

    view.addSubview(webView)

    NSLayoutConstraint.activate([
      webView.topAnchor.constraint(equalTo: view.topAnchor),
      webView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
      webView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
      webView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])

    webView.load(URLRequest(url: URL(string: "https://www.apple.com")!))

    webView.scrollView.delegate = self

//    webView.scrollView.alwaysBounceHorizontal = false // This does not work at all.
  }
}

extension WebViewDetailVC: UIScrollViewDelegate {
  func scrollViewDidEndDecelerating(_: UIScrollView) {
    print("scrollViewDidEndDecelerating")
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {
    print("did scroll: \(Date()): \(scrollView.contentOffset.x)")
  }
}

private extension WebViewDetailVC {
  func toggle() {
    self.isHackingContentInsetOn = !isHackingContentInsetOn
    if isHackingContentInsetOn {
      webView.scrollView.contentInset = UIEdgeInsets(top: 0, left: -0.5, bottom: 0, right: 0)

      title = "isHackingContentInsetOn: \(isHackingContentInsetOn)"
    } else {
      webView.scrollView.contentInset = .zero
      title = "isHackingContentInsetOn: \(isHackingContentInsetOn)"
    }
  }
}
