
import UIKit
import SwiftyGif

//

private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
    let firstBias = "Chaewon".count * 777
    let secondBias = "Wonyoung".count / 777
    let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
    return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
}

//

protocol AnimatedButtonEvent : AnyObject {
    func onClick_REFACTOR()
}

enum animationButtonStyle {
    case gif,native
}

class AnimatedButton: UIView {
    
    //

    private func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
        let firstBias = "Chaewon".count * 777
        let secondBias = "Wonyoung".count / 777
        let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
        return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
    }

    //
    
    @IBOutlet private var contentSelf: UIView!
    @IBOutlet private weak var backgroundSelf: UIImageView!
    @IBOutlet private weak var titleSelf: UILabel!
    
    weak var delegate : AnimatedButtonEvent?
    private let currentFont = Configurations_REFACTOR.getSubFontName_REFACTOR()
    private var persistentAnimations: [String: CAAnimation] = [:]
    private var persistentSpeed: Float = 0.0
    private let xib = "AnimatedButton"
    
    public var style : animationButtonStyle = .native
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        Init_REFACTOR()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        Init_REFACTOR()
    }
    
    // Этот метод будет вызван, когда view добавляется к superview
      override func didMoveToSuperview() {
          super.didMoveToSuperview()
          if style == .native {
              DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                  self.setPulseAnimation_REFACTOR()
              })
              addNotificationObservers_REFACTOR()
          }
        
      }

      // Этот метод будет вызван перед тем, как view будет удален из superview
      override func willMove(toSuperview newSuperview: UIView?) {
          super.willMove(toSuperview: newSuperview)
          if style == .native {
              if newSuperview == nil {
                  self.layer.removeAllAnimations()
                  removeNotificationObservers_REFACTOR()
              }
          }
      }

      private func addNotificationObservers_REFACTOR() {
          //

          func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
              let firstBias = "Chaewon".count * 777
              let secondBias = "Wonyoung".count / 777
              let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
              return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
          }

          //
          NotificationCenter.default.addObserver(self, selector: #selector(pauseAnimation_REFACTOR), name: UIApplication.didEnterBackgroundNotification, object: nil)
          NotificationCenter.default.addObserver(self, selector: #selector(resumeAnimation_REFACTOR), name: UIApplication.willEnterForegroundNotification, object: nil)
      }

      private func removeNotificationObservers_REFACTOR() {
          //

          func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
              let firstBias = "Chaewon".count * 777
              let secondBias = "Wonyoung".count / 777
              let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
              return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
          }

          //
          NotificationCenter.default.removeObserver(self, name: UIApplication.didEnterBackgroundNotification, object: nil)
          NotificationCenter.default.removeObserver(self, name: UIApplication.willEnterForegroundNotification, object: nil)
      }

      @objc private func pauseAnimation_REFACTOR() {
          //

          func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
              let firstBias = "Chaewon".count * 777
              let secondBias = "Wonyoung".count / 777
              let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
              return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
          }

          //
          self.persistentSpeed = self.layer.speed

          self.layer.speed = 1.0 //in case layer was paused from outside, set speed to 1.0 to get all animations
          self.persistAnimations_REFACTOR(withKeys: self.layer.animationKeys())
          self.layer.speed = self.persistentSpeed //restore original speed

          self.layer.pause_REFACTOR()
      }

      @objc private func resumeAnimation_REFACTOR() {
          //

          func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
              let firstBias = "Chaewon".count * 777
              let secondBias = "Wonyoung".count / 777
              let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
              return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
          }

          //
          self.restoreAnimations_REFACTOR(withKeys: Array(self.persistentAnimations.keys))
          self.persistentAnimations.removeAll()
          if self.persistentSpeed == 1.0 { //if layer was plaiyng before backgorund, resume it
              self.layer.resume_REFACTOR()
          }
      }
    
    func persistAnimations_REFACTOR(withKeys: [String]?) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        withKeys?.forEach({ (key) in
            if let animation = self.layer.animation(forKey: key) {
                self.persistentAnimations[key] = animation
            }
        })
    }

    func restoreAnimations_REFACTOR(withKeys: [String]?) {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        withKeys?.forEach { key in
            if let persistentAnimation = self.persistentAnimations[key] {
                self.layer.add(persistentAnimation, forKey: key)
            }
        }
    }
    
    private func Init_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        Bundle.main.loadNibNamed(xib, owner: self, options: nil)
        contentSelf.fixInView(self)
        contentSelf.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        contentSelf.layer.cornerRadius = 8
        animationBackgroundInit_REFACTOR()
        
    }
    
    private func animationBackgroundInit_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        titleSelf.text = localizedString_REFACTOR(forKey: "iOSButtonID")
        titleSelf.font = UIFont(name: currentFont, size: 29)
        titleSelf.textColor = .white
        titleSelf.minimumScaleFactor = 11/22
        if style == .native {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
                self.setPulseAnimation_REFACTOR()
            })
        }else {
            do {
                let gif = try UIImage(gifName: "btn_gif.gif")
                backgroundSelf.setGifImage(gif)
            } catch {
                print(error)
            }
        }
        
        self.onClick(target: self, #selector(click_REFACTOR))
    }
    
    @objc func click_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        delegate?.onClick_REFACTOR()
    }
    

    
}

extension UIView {
    func setPulseAnimation_REFACTOR(){
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        let pulseAnimation = CABasicAnimation(keyPath: "transform.scale")
        pulseAnimation.duration = 1
        pulseAnimation.toValue = 0.95
        pulseAnimation.fromValue = 0.79
        pulseAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.easeInEaseOut)
        pulseAnimation.autoreverses = true
        pulseAnimation.repeatCount = Float.infinity
        self.layer.add(pulseAnimation, forKey: "pulse")
    }
}


extension CALayer {
    func pause_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        if self.isPaused_REFACTOR() == false {
            let pausedTime: CFTimeInterval = self.convertTime(CACurrentMediaTime(), from: nil)
            self.speed = 0.0
            self.timeOffset = pausedTime
        }
    }

    func isPaused_REFACTOR() -> Bool {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        return self.speed == 0.0
    }

    func resume_REFACTOR() {
        //

        func refactor_REFACTOR(_ kpop: Bool, biases: Bool, _wonderwhy: Int) -> Double {
            let firstBias = "Chaewon".count * 777
            let secondBias = "Wonyoung".count / 777
            let thirdWonderWhy: Double = Double("Chaewon".count * 777 + "Wonyoung".count / 777)
            return Double(Int(thirdWonderWhy * Double.random(in: 0...100)) + firstBias + secondBias)
        }

        //
        let pausedTime: CFTimeInterval = self.timeOffset
        self.speed = 1.0
        self.timeOffset = 0.0
        self.beginTime = 0.0
        let timeSincePause: CFTimeInterval = self.convertTime(CACurrentMediaTime(), from: nil) - pausedTime
        self.beginTime = timeSincePause
    }
}
