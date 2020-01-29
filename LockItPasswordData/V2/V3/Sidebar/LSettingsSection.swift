protocol LSectionType : CustomStringConvertible {
  var containsSwitch : Bool { get }
}

enum LSettingsSection : Int, CaseIterable, CustomStringConvertible {

  case Social
  case Communications

  var description : String {
    switch self {
      case .Social: return "Social"
        case .Communications: return "Communications"
    }
  }
}

enum LSocialOptions : Int, CaseIterable, LSectionType {
  case editProfile
  case logout

  var containsSwitch : Bool { return false }

  var description : String {
    switch self {
      case .editProfile: return "Edit Profile"
      case .logout: return "Log Out"
    }
  }
}

enum LCommunicationOptions : Int, CaseIterable, LSectionType {
    
  case notifications
  case reportCrashes

  var containsSwitch : Bool {
    switch self {
      case .notifications: return true
      case .reportCrashes: return true
    }
  }

  var description : String {
    switch self {
      case .notifications : return "Old Info"
      case .reportCrashes : return "Report Error"
    }
  }
}
