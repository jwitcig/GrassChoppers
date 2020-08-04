import SnapKit
import UIKit

class FullScreenPromptViewController: PromptViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupAppearance()
        setupConstraints()
        
        logicController.viewDidLoad()
    }
    
    private func setupAppearance() {
        
        // image view
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        // title
        titleLabel.textAlignment = .center
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 30)
        view.addSubview(titleLabel)
                
        // subtitle
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        view.addSubview(subtitleLabel)
        
        // accept button
        acceptButton.setTitle("accept", for: .normal)
        acceptButton.setTitleColor(.black, for: .normal)
        acceptButton.backgroundColor = .green
        view.addSubview(acceptButton)
        
        // dismiss button
        dismissButton.setTitle("dismiss", for: .normal)
        dismissButton.setTitleColor(.black, for: .normal)
        view.addSubview(dismissButton)
    }
    
    private func setupConstraints() {
        
        // image view
        imageView.snp.makeConstraints { make in
            make.width.equalTo(200)
            make.height.equalTo(200)
            make.centerX.equalToSuperview()
            make.bottom.equalTo(titleLabel.snp.top).offset(-64)
        }
        
        // title
        titleLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        // subtitle
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        // accept button
        acceptButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(dismissButton.snp.top).offset(-16)
        }
     
        // dismiss button
        dismissButton.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview()
            make.height.equalTo(44)
            
            make.centerX.equalToSuperview()
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-16)
        }
    }
}
