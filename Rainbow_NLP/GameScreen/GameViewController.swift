//
//  GameViewController.swift
//  Rainbow_NLP
//
//  Created by Alexander Altman on 16.11.2023.
//

import UIKit

class GameViewController: BaseViewController {
    
    
    var cellWorkItem: DispatchWorkItem?
    
    //Timer Impl
    private var isTimerRunning = false
    private var timer: Timer?
    private var seconds = 60 // Set the initial number of seconds
    
    private func startTimer() {
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            
            // Update the timer label with the remaining time in mm:ss format
            let minutes = self.seconds / 60
            let remainingSeconds = self.seconds % 60
            let timerText = String(format: "%02d:%02d", minutes, remainingSeconds)
            
            
            // Update the navigation title with the new value including the timer
            self.navigationBarView.titleLabel.text = timerText
            
            // Decrement the seconds
            seconds -= 1
            
            // Check if the timer has reached 0
            if seconds < 0 {
                timer.invalidate()
                
            }
        }
    }
    
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        // Stop the timer
        timer?.invalidate()
        timer = nil
    }
    
    
    
    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .lightGray
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    var cellColors: [CellColor] = CellColor.allCases
    
    // Visual Effect View
    var pauseOverlayView: UIVisualEffectView?
    
    var visualEffectView: UIVisualEffectView!
    
    var shouldGenerateNewCells = true
    
    var isVisualEffectViewHidden = true
    
    private func toggleVisualEffectView() {
        if isVisualEffectViewHidden {
            isVisualEffectViewHidden.toggle()
            visualEffectView.isHidden = false
            collectionView.isScrollEnabled = false
            shouldGenerateNewCells = false
        } else {
            isVisualEffectViewHidden.toggle()
            visualEffectView.isHidden = true
            collectionView.isScrollEnabled = true
            shouldGenerateNewCells = true
            collectionView.reloadData()
        }
    }
    
    private func createVisualEffect() {
        let blurEffect = UIBlurEffect(style: .light)
        visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(visualEffectView)
        
        visualEffectView.isHidden = true
        
        
        pauseOverlayView = visualEffectView
        
        NSLayoutConstraint.activate([
            visualEffectView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            visualEffectView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            visualEffectView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .lightGray
        
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(CustomCell.self, forCellWithReuseIdentifier: "CustomCell")
        
        view.addSubview(collectionView)
        
        createVisualEffect()
        
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: navigationBarView.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
        
        // Schedule the appearance of the cell after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Start the timer
        startTimer()
    }
    
    
    
    override func pauseButtonAction(_ sender: UIButton) {
        toggleVisualEffectView()
        
        collectionView.isScrollEnabled = isVisualEffectViewHidden
        shouldGenerateNewCells = isVisualEffectViewHidden
        
        if !isVisualEffectViewHidden {
            timer?.invalidate()
            timer = nil
            
            // Pause the timer
            
        } else {
            // Resume the timer
            startTimer()
            collectionView.reloadData()
            
        }
    }
}

extension GameViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1 // Number of cells to appear
    }
    
  
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var cell: CustomCell
        
        guard shouldGenerateNewCells else {
            cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
            // Configure the reusable cell with existing content if needed
            return cell
        }
        
        cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomCell", for: indexPath) as! CustomCell
        
        // Get a random background color
        var allColors = CellColor.allColors
        // Create a separate array for label colors
        var labelColors = allColors
        
        guard !allColors.isEmpty else {
            // Handle the case when the colors array is empty
            return cell
        }
        
        let randomBackgroundColorIndex = Int.random(in: 0..<allColors.count)
        let randomLabelColorIndex = Int.random(in: 0..<labelColors.count)
        
        let randomBackgroundColor = allColors[randomBackgroundColorIndex]
        cell.backgroundColor = randomBackgroundColor.color
        
       

        // Remove the background color from the label colors array
        labelColors.remove(at: randomBackgroundColorIndex)
        
        guard randomLabelColorIndex < labelColors.count else {
                // Handle the case when the label colors array is empty or the index is out of range
                return cell
            }
        
        
        let randomLabelColor = labelColors[randomLabelColorIndex]
        labelColors.remove(at: randomLabelColorIndex)
        
        // Check contrast ratio between background color and font color
        let contrastRatio = randomBackgroundColor.color.contrastRatio(with: randomLabelColor.color)
        
        // If contrast ratio is below a certain threshold, choose a different font color
        if contrastRatio < 4.5 {
            let newLabelColorIndex = Int.random(in: 0..<labelColors.count)
            
            guard newLabelColorIndex < labelColors.count else {
                // Handle the case when the label colors array is empty or the index is out of range
                return cell
            }
            
            let newLabelColor = labelColors[newLabelColorIndex]
            cell.label.textColor = newLabelColor.color
            labelColors.remove(at: newLabelColorIndex)
        } else {
            cell.label.textColor = randomLabelColor.color
        }
        
        let randomColorNameIndex = Int.random(in: 0..<allColors.count)
        
        guard randomColorNameIndex < allColors.count else {
            // Handle the case when the colors array is empty or the index is out of range
            return cell
        }
        
        let randomColorName = allColors[randomColorNameIndex].name
        cell.label.text = randomColorName
        
        // Remove the used colors from the arrays
        allColors.remove(at: randomBackgroundColorIndex)
        
        // Set the corner radius of the cell
        cell.layer.cornerRadius = 15
        
        // Generate random x and y coordinates within the collection view's bounds
        let randomX = CGFloat.random(in: 0...(collectionView.bounds.width - cell.bounds.width))
        let randomY = CGFloat.random(in: 0...(collectionView.bounds.height - cell.bounds.height))
        
        // Set the cell's frame with the random coordinates
        cell.frame.origin = CGPoint(x: randomX, y: randomY)
        
        // Schedule the disappearance of the cell after 2 seconds
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            allColors.append(randomBackgroundColor)
            labelColors.append(randomLabelColor)
            collectionView.reloadData()
        }
        
        return cell
    }
}



extension GameViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let collectionViewHeight = collectionView.bounds.height
        
        let randomX = CGFloat.random(in: 0...(collectionViewWidth - 100))
        let randomY = CGFloat.random(in: 0...(collectionViewHeight - 30))
        
        return CGSize(width: 250, height: 50).applying(CGAffineTransform(translationX: randomX, y: randomY))
    }
}

