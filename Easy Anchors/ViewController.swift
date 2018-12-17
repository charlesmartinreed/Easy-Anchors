//
//  ViewController.swift
//  Easy Anchors
//
//  Created by Charles Martin Reed on 12/16/18.
//  Copyright © 2018 Charles Martin Reed. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //a test redView that spans the entire view
        let redView = UIView()
        redView.backgroundColor = .red
        
        let blueView = UIView()
        blueView.backgroundColor = .blue
        
        //large view on the top left
        let greenView = UIView()
        greenView.backgroundColor = .green
        
        //alternatively
        [redView, blueView, greenView].forEach { view.addSubview($0) }
        //view.addSubview(redView)
        //view.addSubview(blueView)
        
        //now, we create a redView in the top-right corner
        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: nil, bottom: nil, trailing: view.safeAreaLayoutGuide.trailingAnchor, padding: .init(top: 0, left: 0, bottom: 0, right: 12), size: .init(width: 125, height: 0))
        //now if we modify the width, the height follows
        redView.heightAnchor.constraint(equalTo: redView.widthAnchor).isActive = true
        
        blueView.anchor(top: redView.bottomAnchor, leading: nil, bottom: nil, trailing: redView.trailingAnchor, padding: .init(top: 12, left: 0, bottom: 0, right: 0))
        //let's get the blue view to resize according to the redView
        blueView.anchorSize(to: redView)
        
//        blueView.widthAnchor.constraint(equalTo: redView.heightAnchor).isActive = true
//        blueView.heightAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
//
        greenView.anchor(top: redView.topAnchor, leading: view.safeAreaLayoutGuide.leadingAnchor, bottom: blueView.bottomAnchor, trailing: redView.leadingAnchor, padding: .init(top: 0, left: 12, bottom: 0, right: 12))
        
        //testing the fillSuperview helper method
        let purpleView = UIView()
        purpleView.backgroundColor = .purple
        view.addSubview(purpleView)
        purpleView.fillSuperview()
        
      
        //padding is optional in our call because it has a default value of .zero in our extension. Call it with .init() constructor
//        redView.anchor(top: view.safeAreaLayoutGuide.topAnchor, leading: view.leadingAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, trailing: view.trailingAnchor, padding: .init(top: 0, left: 16, bottom: 0, right: 16), size: .init(width: 100, height: 100))
    }
}

