//
//  LangView.swift
//  ReactLayeredDomain
//
//  Created by laprasDrum on 2017/12/07.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit

enum LangType: String {
  case swift = "Swift", kotlin = "Kotlin"
}

@IBDesignable class LangView: UIView {

    @IBOutlet var contentView: UIView!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var starsLabel: UILabel!

    private var language: Language?
    private var timer: Timer?

    private let startStars: Float = 0
    private var endStars: Float {
        return Float(language?.stars ?? 0)
    }
    private let duration: TimeInterval = 5

    private var progress: TimeInterval = 0
    private var lastUpdate: TimeInterval = Date.timeIntervalSinceReferenceDate
    private var percentage: Float {
        return Float(progress / duration)
    }

    private var currentStars: Float {
        if progress >= duration {
            return endStars
        }
        return startStars + (percentage * (endStars - startStars))
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        loadFromNib()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        loadFromNib()
    }

    private func loadFromNib() {
        Bundle.main.loadNibNamed("LangView", owner: self, options: nil)
        contentView.frame = self.bounds
        addSubview(contentView)
    }

    func update(with language: Language?) {
        self.language = language
        typeLabel.text = language?.type

        invalidateTimer()

        contentView.alpha = 0

        switch language?.type {
        case .some(LangType.swift.rawValue):
            contentView.backgroundColor = .swift
        case .some(LangType.kotlin.rawValue):
            contentView.backgroundColor = .kotlin
        default:
            contentView.backgroundColor = .white
        }

        timer = Timer.scheduledTimer(
            timeInterval: 0.01,
            target: self,
            selector: #selector(updateStars),
            userInfo: nil,
            repeats: true
        )
    }

    @objc private func updateStars() {
        let now = Date.timeIntervalSinceReferenceDate
        progress = progress + (now - lastUpdate)
        lastUpdate = now

        if progress >= duration {
            invalidateTimer()
            progress = duration
        }

        DispatchQueue.main.async {
            self.contentView.alpha = CGFloat(self.percentage)
            self.starsLabel.text = "\(Int(self.currentStars))"
      }
    }

    private func invalidateTimer() {
        timer?.invalidate()
        timer = nil
    }
}

fileprivate extension UIColor {
    static let swift  = #colorLiteral(red: 0.8509803922, green: 0.2431372549, blue: 0.168627451, alpha: 1)
    static let kotlin = #colorLiteral(red: 0.3882352941, green: 0.631372549, blue: 0.9490196078, alpha: 1)
}
