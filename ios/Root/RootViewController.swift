//
//  RootViewController.swift
//  ReactLayeredDomain
//
//  Created by laprasDrum on 2017/12/03.
//  Copyright © 2017 Facebook. All rights reserved.
//

import UIKit

class RootViewController: UIViewController {

    @IBOutlet weak var swiftView: LangView!
    @IBOutlet weak var kotlinView: LangView!

    struct Config {
        static let bundleRoot = "index", moduleName = "ReactLayeredDomain"
    }

    private let reactView = RCTRootView(
        bundleURL: RCTBundleURLProvider.sharedSettings().jsBundleURL(forBundleRoot: Config.bundleRoot, fallbackResource: nil),
        moduleName: Config.moduleName,
        initialProperties: nil,
        launchOptions: nil
    )

    class func instansiate() -> RootViewController {
        return UIStoryboard(name: "root", bundle: nil).instantiateInitialViewController() as! RootViewController
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        if let v = reactView {
            v.bounds = CGRect.zero
            view.addSubview(v)
        }

        NotificationCenter.default.addObserver(forName: NSNotification.Name.RootModelDidMount, object: nil, queue: OperationQueue.main) {
            [weak self] notification in
            guard let obj = notification.object else { return }
            do {
                let json = try JSONSerialization.data(withJSONObject: obj, options: .prettyPrinted)
                let languages = try! JSONDecoder().decode([Language].self, from: json)
                self?.swiftView?.update(with: languages.first(where: { lang in lang.type == LangType.swift.rawValue }))
                self?.kotlinView?.update(with: languages.first(where: { lang in lang.type == LangType.kotlin.rawValue }))
            } catch {
                print(error)
            }
        }
    }
}
