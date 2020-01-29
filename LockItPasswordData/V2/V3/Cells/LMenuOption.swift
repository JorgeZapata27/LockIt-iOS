import UIKit

enum MenuOption : Int, CustomStringConvertible {

  case Cards
  case Notifications
  case Settings
  case Help
  case Share

  var description : String {
    switch self {
      case .Cards: return "Profile"
      case .Notifications: return "Notifications"
      case .Settings: return "Settings"
      case .Help: return "Help"
      case .Share: return "Share"
    }
  }

  var image : UIImage {
    switch self {
      case .Cards: return UIImage(named: "Cards") ?? UIImage()
      case .Notifications: return UIImage(named: "Notif") ?? UIImage()
      case .Settings: return UIImage(named: "Settings") ?? UIImage()
      case .Help: return UIImage(named: "Help") ?? UIImage()
      case .Share: return UIImage(named: "Share") ?? UIImage()
    }
  }

}
