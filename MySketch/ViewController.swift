//
//  ViewController.swift
//  MySketch
//
//  Created by ㅇ오ㅇ on 2020/12/04.
//

import UIKit
import PencilKit
import SnapKit
import PhotosUI

class ViewController: UIViewController {
    
    private let canvas = PKCanvasView()
    
    private let drawing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(canvas)
        setConstraint()
        canvas.drawing = drawing
//        setNavi()
    }
    
//    override func viewWillAppear(_ animated: Bool) {
//        super.viewWillAppear(animated)
//
//        setToolKit()
//    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        setToolKit()
    }
    
    private func setConstraint() {
        canvas.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
        }
    }
    
    private func setToolKit() {
//        guard let window = view.window,
//            let toolPicker = PKToolPicker.shared(for: window) else { return }
//        toolPicker.setVisible(true, forFirstResponder: canvas)
//        toolPicker.addObserver(canvas)
//        canvas.becomeFirstResponder()
//        canvas.resignFirstResponder()
//        canvas.becomeFirstResponder()
        
        if #available(iOS 14.0, *) {
            let tool = PKToolPicker.init()
            tool.setVisible(true, forFirstResponder: canvas)
            tool.addObserver(canvas)
            canvas.becomeFirstResponder()
        } else {
            // Fallback on earlier versions
            guard let window = view.window,
                let toolPicker = PKToolPicker.shared(for: window) else { return }
            toolPicker.setVisible(true, forFirstResponder: canvas)
            toolPicker.addObserver(canvas)
            canvas.becomeFirstResponder()
        }
        
    }
    
    private func setNavi() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "camera"),
                                                           style: .plain,
                                                           target: self,
                                                           action: #selector(didTapNaviLeftButton))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Pencil",
                                                            style: .plain,
                                                            target: self,
                                                            action: #selector(didTapNaviRightButton))
    }
    
    @objc
    private func didTapNaviRightButton() {
        
    }
    
    @objc
    private func didTapNaviLeftButton() {
        
    }
    
    
}



