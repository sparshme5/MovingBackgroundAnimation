//
//  Hexagon.h
//  MovingBackgroundAnimation
//
//  Created by Gaurav Taywade on 31/08/13.
//  Copyright (c) 2013 OAB studios. All rights reserved.
//

#import <UIKit/UIKit.h>
#define STAYSTILL 0
#define MOVING 1
#define DROPPING 2

@interface Hexagon : UIImageView


@property (nonatomic) int speed;
@property (nonatomic) int status;
@property (nonatomic) float xStretch;
@property (nonatomic) float yStretch;


@end
