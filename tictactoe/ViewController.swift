//
//  ViewController.swift
//  tictactoe
//
//  Created by Zainuddin Qazi on 7/3/15.
//  Copyright (c) 2015 Zainuddin Qazi. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    var grid : [Int] = [0,0,0,0,0,0,0,0,0]
    var currentPlayer = 0
    var currentlyPlaying = false
    var images = ["white.png", "cross.png", "not.png"]
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var playerLabel: UILabel!
    
    @IBOutlet weak var winView: UIImageView!

    @IBOutlet weak var startButtonOutlet: UIButton!
    
    @IBAction func startButton(sender: AnyObject) {
        
        if currentlyPlaying {
            CGRecto
            resetGame()
            
        } else {
            
            startGame()
            
        }
        
    }
    
    
    //************************ Helper Functions ************************//
    
    func startGame() {
        
        currentlyPlaying = true
        currentPlayer = 0
        grid = [0,0,0,0,0,0,0,0,0]
        startButtonOutlet.setTitle("Reset", forState: UIControlState.Normal)
        playerLabel.text = "Player 1's turn"
        collectionView.reloadData()
        
    }
    
    func resetGame() {
        
        currentlyPlaying = false
        currentPlayer = 0
        grid = [0,0,0,0,0,0,0,0,0]
        startButtonOutlet.setTitle("Start", forState: UIControlState.Normal)
        playerLabel.text = "No ones turn!"
        collectionView.reloadData()
        
    }
    
    
    func checkForWin() -> Bool {
        
        for (index, element) in enumerate(grid) {
            
            if element != 0 {
            
                if index == 0 {
                    if (grid[1] == element && grid[2] == element) || (grid[1] == element && grid[2] == element) || (grid[4] == element && grid[8] == element) || (grid[3] == element && grid[6] == element) {
                            return true
                    }
                }
                
                if index == 1 {
                    if (grid[4] == element && grid[7] == element) {
                        return true
                    }
                }

                if index == 2 {
                    if (grid[4] == element && grid[6] == element) || (grid[5] == element && grid[8] == element) {
                        return true
                    }
                }
                
                if index == 3 {
                    if (grid[4] == element && grid[5] == element) {
                        return true
                    }
                }
                
                if index == 6 {
                    if (grid[7] == element && grid[8] == element) {
                        return true
                    }
                }
            }
        }
        return false
    }

    
    //************************ Error Functions ************************//
    
    
    
    //************************ Delegate Functions ************************//
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
        if currentlyPlaying && grid[indexPath.item] == 0 {
            
            if currentPlayer == 0 {
            
                grid[indexPath.item] = 1
                currentPlayer = 1
                playerLabel.text = "Player 2's Turn!"
        
            } else {
            
                grid[indexPath.item] = 2
                currentPlayer = 0
                playerLabel.text = "Player 1's Turn!"
            
            }
            
            collectionView.reloadItemsAtIndexPaths([indexPath])
            
            if checkForWin() {
                
                resetGame()
                
                UIView.animateWithDuration(3, animations: { () -> Void in
                    
                    self.winView.alpha = 1
                    
                })
                
                //self.winView.alpha = 0
                
            }
        
        }
    }
    
    
    //************************ Data Source Functions ************************//
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return 9
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        var cell = collectionView.dequeueReusableCellWithReuseIdentifier("tictaccell", forIndexPath: indexPath) as! TicTacCell
        
        cell.imageView.image = UIImage(named: images[grid[indexPath.item]])
        cell.backgroundColor = UIColor.whiteColor()
        
        return cell
        
    }
    
    
    
    required init(coder aDecoder: NSCoder) {
        
        super.init(coder: aDecoder)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        winView.alpha = 0
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

