import SnapKit
import UIKit

class CardPromptViewController: PromptViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        setupAppearance()
        setupConstraints()
        
        logicController.viewDidLoad()
    }
    
    internal override func setupAppearance() {
        view.backgroundColor = .systemBlue
        view.layer.cornerRadius = 14
        
        view.addSubview(imageView)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        
        // image view
        imageView.contentMode = .scaleAspectFit
        
        // title
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        titleLabel.font = UIFont.boldSystemFont(ofSize: 18)
        titleLabel.setContentHuggingPriority(.defaultHigh, for: .vertical)
                
        // subtitle
        subtitleLabel.textAlignment = .left
        subtitleLabel.numberOfLines = 0
        subtitleLabel.setContentHuggingPriority(.defaultLow, for: .vertical)
    }
    
    internal override func setupConstraints() {
        
        // image view
        imageView.snp.makeConstraints { make in
            make.width.equalTo(60)
            make.height.equalTo(60)
            make.leading.top.equalToSuperview().inset(16)
            make.bottom.lessThanOrEqualToSuperview().inset(16)
        }
        
        // title
        titleLabel.snp.makeConstraints {
            $0.top.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.bottom.lessThanOrEqualToSuperview().inset(16)
        }
        
        // subtitle
        subtitleLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(16)
            $0.trailing.equalToSuperview().inset(16)
            $0.leading.equalTo(imageView.snp.trailing).offset(16)
            $0.bottom.lessThanOrEqualToSuperview().inset(16)
        }
    }
}

extension CardPromptViewController {
    override func update(title: String, subtitle: String?) {
        titleLabel.text = title
        
        if let subtitle = subtitle, !subtitle.isEmpty {
            subtitleLabel.text = subtitle
        } else {
            subtitleLabel.removeFromSuperview()
        }
    }
}
