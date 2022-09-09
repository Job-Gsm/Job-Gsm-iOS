import UIKit
import SnapKit
import Then

class AlertViewController: UIViewController {
  private let popupView: Alert
  
  init(title: String) {
    self.popupView = Alert(title: title)
    super.init(nibName: nil, bundle: nil)
    
    self.view.backgroundColor = .clear
    self.view.addSubview(self.popupView)
    self.popupView.snp.makeConstraints {
      $0.edges.equalToSuperview()
    }
  }
  
  required init?(coder: NSCoder) { fatalError() }
}
