//
//  CardButton.swift
//  AnimatedSetGamee
//
//  Created by Tiago Maia Lopes on 07/03/18.
//  Copyright © 2018 Tiago Maia Lopes. All rights reserved.
//

import UIKit

class CardButton: UIButton {

  // MARK: Properties
  
  /// The default color for the card button when it's not selected or face down.
  var defaultBackgroundColor = UIColor.white.cgColor
  
  /// Tells if the button is face up or not, changing
  /// this property will flip the card.
  @IBInspectable var isFaceUp: Bool = true {
    didSet {
      if isFaceUp {
        layer.backgroundColor = defaultBackgroundColor
      }
      setNeedsDisplay()
    }
  }
  
  // MARK: Drawing
  
  override func draw(_ rect: CGRect) {
    layer.cornerRadius = 10
    layer.borderColor = #colorLiteral(red: 0.501960814, green: 0.501960814, blue: 0.501960814, alpha: 1)
    layer.borderWidth = 0.5
    
    if isFaceUp {
      drawSetShapes()
    } else {
      drawBack()
    }
  }
  
  /// Draws the front of the card.
  func drawFront() {}
  
  /// Draws the back of the card.
  func drawBack() {}
  
  // MARK: Imperatives
  
  /// Flips the card.
  ///
  /// - Parameter animated: flips with a transition from left to right.
  /// - Paramater completion: completion block called after the end of the transition animation.
  func flipCard(animated: Bool = false, completion: Optional<(CardButton) -> ()> = nil) {
    if animated {
      UIView.transition(with: self,
                        duration: 0.3,
                        options: .transitionFlipFromLeft,
                        animations: {
                          self.isFaceUp = !self.isFaceUp
      }) { completed in
        if let completion = completion {
          completion(self)
        }
      }
    } else {
      self.isFaceUp = !self.isFaceUp
    }
  }

}
