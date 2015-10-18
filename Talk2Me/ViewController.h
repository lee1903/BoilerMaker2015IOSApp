//
//  ViewController.h
//  Talk2Me
//
//  Created by Ian Renfro on 10/17/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import <FBSDKShareKit/FBSDKShareKit.h>

struct Person {
    __unsafe_unretained UIImage *image;
    __unsafe_unretained NSString *name;
    __unsafe_unretained NSString *gender;
    __unsafe_unretained NSString *status;
};

extern UIImage *image;

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet FBSDKLoginButton *loginButton;

@end
