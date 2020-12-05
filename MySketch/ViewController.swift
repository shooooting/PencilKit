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

class ViewController: UIViewController, PKToolPickerObserver {
    
    private let canvas = PKCanvasView()
    
    private let drawing = PKDrawing()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setCanvas()
        setConstraint()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        setToolKit()
    }
    
    private func setConstraint() {
        canvas.snp.makeConstraints {
            $0.top.leading.trailing.bottom.equalToSuperview()
//            $0.top.equalTo(view.safeAreaLayoutGuide.snp.topMargin)
        }
    }
    
    private func setCanvas() {
        if #available(iOS 14.0, *) {
            view.addSubview(canvas)
            canvas.backgroundColor = .systemGreen
            canvas.drawingPolicy = .anyInput
        } else {
            view.addSubview(canvas)
            canvas.backgroundColor = .systemGreen
            canvas.allowsFingerDrawing = true
        }
    }
    
    private func setToolKit() {
        
        if #available(iOS 14.0, *) {
            guard let window = view.window,
                  let toolPicker = PKToolPicker.shared(for: window) else { return }
            toolPicker.setVisible(true, forFirstResponder: canvas)
            toolPicker.addObserver(canvas)
            canvas.becomeFirstResponder()
            canvas.resignFirstResponder()
            canvas.becomeFirstResponder()
        } else {
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



