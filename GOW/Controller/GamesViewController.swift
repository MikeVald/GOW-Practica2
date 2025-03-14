//
//  GamesViewController.swift
//  GOW
//
//  Created by Rafael Gonzalez on 07/03/25.
//

import UIKit

class GamesViewController: UIViewController {
    @IBOutlet weak var gameImage: UIImageView!
    
    @IBOutlet weak var imagePageControl: UIPageControl!
    
    @IBAction func rightSwipeDone(_ sender: UISwipeGestureRecognizer) {
        print("Right")
        // Mostar siguiente elemento de imagePageControl
        //imagePageControl.setIndicatorImage(UIImage(named: "defaultIndicator"), forPage: imagePageControl.currentPage)
        if imagePageControl.currentPage == 7 {
            imagePageControl.currentPage = 0
        } else {
            imagePageControl.currentPage += 1
        }
        //imagePageControl.setIndicatorImage(UIImage(named: "gow_logo"), forPage: imagePageControl.currentPage)
        //gameImage.image = UIImage(named: "\(imagePageControl.currentPage)")
        for index in 0..<imagePageControl.numberOfPages {
            let indicatorImage = (index == imagePageControl.currentPage) ? UIImage(named: "gow_logo") : UIImage(named: "defaultIndicator")
            imagePageControl.setIndicatorImage(indicatorImage, forPage: index)
        }
        gameImage.image = UIImage(named: "\(gamePosters[imagePageControl.currentPage])")
    }
    @IBAction func leftSwipeDone(_ sender: UISwipeGestureRecognizer) {
        print("Left")
        imagePageControl.setIndicatorImage(UIImage(named: "defaultIndicator"), forPage: imagePageControl.currentPage)
        if imagePageControl.currentPage == 0 {
            imagePageControl.currentPage = 7
        } else {
            imagePageControl.currentPage -= 1
        }
        imagePageControl.setIndicatorImage(UIImage(named: "gow_logo"), forPage: imagePageControl.currentPage)
        gameImage.image = UIImage(named: "\(imagePageControl.currentPage)")
    }
    //datasource :P
    let gamePosters = Array(0...7)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        imagePageControl.numberOfPages = gamePosters.count
        gameImage.image = UIImage(named: gamePosters.first?.description ?? "0")
        imagePageControl.addTarget(self, action: #selector(pageControlChanged(_:)), for: .valueChanged)
        
        for index in 0..<imagePageControl.numberOfPages {
            let indicatorImage = (index == imagePageControl.currentPage) ? UIImage(named: "gow_logo") : UIImage(named: "defaultIndicator")
            imagePageControl.setIndicatorImage(indicatorImage, forPage: index)
        }
        gameImage.image = UIImage(named: "\(gamePosters[imagePageControl.currentPage])")
    }
    
    @objc func pageControlChanged(_ sender: UIPageControl) {
        gameImage.image = UIImage(named: "\(imagePageControl.currentPage)")
        
        for index in 0..<imagePageControl.numberOfPages {
            let indicatorImage = (index == imagePageControl.currentPage) ? UIImage(named: "gow_logo") : UIImage(named: "defaultIndicator")
            imagePageControl.setIndicatorImage(indicatorImage, forPage: index)
        }
    }
}
