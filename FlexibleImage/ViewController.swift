//
//  ViewController.swift
//  FlexibleImage
//
//  Created by Сергей Прокопьев on 19.05.2023.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    let imageView = UIImageView()
    let scrollView = UIScrollView()

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(scrollView)
        scrollView.contentInsetAdjustmentBehavior = .never
        scrollView.verticalScrollIndicatorInsets = .zero
        scrollView.frame = view.bounds
        scrollView.delegate = self
        scrollView.contentSize = .init(width: view.frame.width, height: view.frame.height * 2)
        scrollView.verticalScrollIndicatorInsets = .init(top: 270 - view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)

        imageView.image = UIImage(named: "image")
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        imageView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 270)

        scrollView.addSubview(imageView)
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let contentOffsetheight = scrollView.contentOffset.y
        scrollView.verticalScrollIndicatorInsets = .init(top: imageView.frame.height - view.safeAreaInsets.top, left: 0, bottom: 0, right: 0)
        if contentOffsetheight < 0 {
            imageView.frame.origin.y = contentOffsetheight
            imageView.frame.size.height = 270 + (-contentOffsetheight)
        }

        print(imageView.frame.size.height)
    }
}
