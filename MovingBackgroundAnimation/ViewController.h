//
//  ViewController.h
//  MovingBackgroundAnimation
//
//  Created by Gaurav Taywade on 31/08/13.
//  Copyright (c) 2013 OAB studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hexagon.h"
#import <QuartzCore/QuartzCore.h>

@interface ViewController : UIViewController{
    
    //Background moving animation
    NSMutableArray *arrayForImageView;
}

//Background moving animation
@property (strong, nonatomic) NSTimer* timer;
-(void)LoadHexagonOnscreen;
-(void) UpdateHexaPosition;

@end
