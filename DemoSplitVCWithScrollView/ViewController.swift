//

import UIKit

class ViewController: UIViewController {
  var splitVC: RootSplitVC!
  override func viewDidLoad() {
    super.viewDidLoad()

    splitVC = RootSplitVC(style: .doubleColumn)
    addChild(splitVC)
    view.addSubview(splitVC.view)

    // Do any additional setup after loading the view.
    view.backgroundColor = .systemBackground
    
    initializeWeb()
  }
  
  /// Please note that pure native `UIScrollView` does not have this
  /// unwanted horizontal bounce
  func initializeNative() {
    splitVC.viewControllers = [
      MasterTableVC(style: .grouped),
      DemoNativeChildVC(),
    ]
  }

  func initializeWeb() {
    let detailVC = WebViewDetailVC()
    
    splitVC.viewControllers = [
      MasterTableVC(style: .grouped),
      detailVC,
    ]
  }
}
