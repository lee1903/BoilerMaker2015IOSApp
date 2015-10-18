//
//  DispPicViewController.h
//  Talk2Me
//
//  Created by Ian Renfro and Brian Lee on 10/17/15.
//  Copyright © 2015 SoloMin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DispPicViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *Gender;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSDictionary *fbProperties;
@property (weak, nonatomic) IBOutlet UILabel *name;

@end
