//
//  ViewController.swift
//  meme_auth
//
//  Created by Reilly kennon on 7/19/17.
//  Copyright © 2017 Reilly kennon. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuthUI


class ViewController: UIViewController, FUIAuthDelegate {
    
    

    var handle: AuthStateDidChangeListenerHandle?
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        //Listen for signed in user
        let authUI = FUIAuth.defaultAuthUI()
        authUI?.delegate = self
        
        
    

        handle = Auth.auth().addStateDidChangeListener { (auth, user) in
            if Auth.auth().currentUser == nil {
                
                let authViewController = authUI!.authViewController()
                self.present(authViewController, animated: true, completion: nil)
            }
            
            
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Auth.auth().removeStateDidChangeListener(handle!)
        
    }

    
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error: Error?) {
        
    }
    

    
    

//    extension ViewController: FUIAuthDelegate {
//        func authUI(_ authUI: FUIAuth, didSignInWith user: User?, error?) {
//            print("did sign in with \(String(describing: user)) and errors? \(String(describing: user)) and errors? \(String(describing: error))")
//        }
//    }
    
}

