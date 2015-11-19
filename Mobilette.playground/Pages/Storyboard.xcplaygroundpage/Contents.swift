/*:

# Storyboard

Segues are one of the most powerful tools for developers, but one of the biggest problem are segues themselves. Managing identifiers are painful that's why we've created a tool to manage it easily.
This method was introduced by Apple during the WWDC 2015. We encourage you to [watch the session number 411](https://developer.apple.com/videos/play/wwdc2015-411/).

Inside your `ViewController` class you must add an enum of segue identifiers :

    enum SegueIdentifier: String {
    case ShowRed
    case ShowBlue
    case ShowMagic
    }

_Note: you should use the same name as the identifier inside the storyboard file._

Then, you should use `segueIdentifierForSegue:` inside `prepareForSegue:sender:` to get an enum :

    switch segueIdentifierForSegue(segue) {
    case .ShowRed:
    print("ShowRed")
    case .ShowBlue:
    print("ShowBlue")
    case .ShowMagic:
    print("ShowMagic")
    }

If you want to perform a segue manually, you should use `performSegueWithIdentifier:sender:` :

    performSegueWithIdentifier(.ShowMagic, sender: nil)

*/

import UIKit

class TestViewController: UIViewController, SegueHandlerType
{
    enum SegueIdentifier: String {
        case ShowRed
        case ShowBlue
        case ShowMagic
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        switch segueIdentifierForSegue(segue) {
        case .ShowRed:
            print("ShowRed")
        case .ShowBlue:
            print("ShowBlue")
        case .ShowMagic:
            print("ShowMagic")
        }
    }
    
    // MARK: - Actions
    
    func doSomethingMagic() {
        performSegueWithIdentifier(.ShowMagic, sender: nil)
    }
}

let testViewController = TestViewController()
let segue = UIStoryboardSegue(identifier: "ShowMagic", source: testViewController, destination: testViewController)
testViewController.prepareForSegue(segue, sender: nil)
