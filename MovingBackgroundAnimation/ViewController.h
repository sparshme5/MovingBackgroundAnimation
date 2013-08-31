//
//  ViewController.h
//  MovingBackgroundAnimation
//
//  Created by Gaurav Taywade on 31/08/13.
//  Copyright (c) 2013 OAB studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hexagon.h"

@interface ViewController : UIViewController{
    
}

-(void)LoadHexagonOnscreen;
@property (strong, nonatomic) NSTimer* timer;
@property (strong, nonatomic) Hexagon* HexagonImageView;
@property (strong, nonatomic) Hexagon* HexagonImageView2;

@end
