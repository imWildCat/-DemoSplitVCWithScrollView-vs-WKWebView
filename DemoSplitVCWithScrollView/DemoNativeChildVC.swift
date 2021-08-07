//

import UIKit

class DemoNativeChildVC: UIViewController {
  let scrollView = UIScrollView(frame: .zero)

  override func loadView() {
    view = scrollView
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    view.backgroundColor = .secondarySystemGroupedBackground

    let label = UILabel(frame: .zero)
    label.text = "this is a native scroll view"
    label.sizeToFit()

    scrollView.addSubview(label)

    // Do any additional setup after loading the view.
  }

  override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
    
    scrollView.alwaysBounceHorizontal = false
    scrollView.alwaysBounceVertical = false

    let originalSize = view.bounds.size
    scrollView.contentSize = CGSize(
      width: originalSize.width,
      height: originalSize.height + 50
    )
  }
}
