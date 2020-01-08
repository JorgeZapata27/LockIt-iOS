import UIKit

class LContainerController : UIViewController {

  // MARK: - Properties

  var menuController : LMenuController!
  var centerController : UIViewController!
  var isExpanded = false

  // MARK: - Init

  override func viewDidLoad() {
    super.viewDidLoad()

    // Functions To Throw
    configureHomeController()

  }

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return .lightContent
  }

  override var preferredStatusBarUpdateAnimation: UIStatusBarAnimation {
    return .slide
  }

  override var prefersStatusBarHidden: Bool {
    return isExpanded
  }

  // MARK: - Handlers

  func configureHomeController() {
    let homeController = LHomeController()
    homeController.delegate = self
    centerController = UINavigationController(rootViewController: homeController)
    view.addSubview(centerController.view)
    addChild(centerController)
    centerController.didMove(toParent: self)
  }

  func confirgureMenuController() {
    if menuController == nil {
      // add our new menu controller here
      menuController = LMenuController()
      menuController.delegate = self
      view.insertSubview(menuController.view,  at: 0)
      addChild(menuController)
      menuController.didMove(toParent: self)
      print("Did Add VC")
    }
  }

  func animatePanel(shouldExpand : Bool, menuOption: MenuOption?) {
    if shouldExpand {
      // Show Menu
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.centerController.view.frame.origin.x = self.centerController.view.frame.width - 80
      })
    } else {
      // Hide Menu
      UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
        self.centerController.view.frame.origin.x = 0
      }) { (_) in
        guard let menuOption = menuOption else { return }
        self.didSelectMenuOption(menuOption: menuOption)
      }
    }
    animateStatusBar()
  }

  func didSelectMenuOption(menuOption: MenuOption) {
    switch menuOption {
        case .Cards:
          print("Show Cards")
        case .Notifications:
          print("Show Notis")
        case .Settings:
          print("Show Settings")
          let controller = LSettingsController()
          present(UINavigationController(rootViewController: controller), animated: true, completion: nil)
        case .Help:
          print("Show Help")
        case .Share:
          print("Show Share")
    }
  }

  func animateStatusBar() {
    // Show Menu
    UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0, options: .curveEaseInOut, animations: {
      self.setNeedsStatusBarAppearanceUpdate()
    })
  }
}

extension LContainerController : LHomeControllerDelegate {

  func handleMenuToggle(forMenuOption menuOption: MenuOption?) {
      if !isExpanded {
        confirgureMenuController()
      }
      isExpanded = !isExpanded
    animatePanel(shouldExpand: isExpanded, menuOption: menuOption)
  }
}
