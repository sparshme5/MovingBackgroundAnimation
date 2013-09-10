//
//  Hexagon.m
//  MovingBackgroundAnimation
//
//  Created by Gaurav Taywade on 31/08/13.
//  Copyright (c) 2013 OAB studios. All rights reserved.
//

#import "Hexagon.h"

@implementation Hexagon

int vx,vy;
int countV=0;
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}
- (id)initWithImage:(UIImage *)image{
    if (self = [super initWithImage:image]) {
        
        NSInteger xCordRandom = arc4random() % 950;
        NSInteger yCordRandom = arc4random() % 650;
        [self setFrame: CGRectMake(0+xCordRandom, 0+yCordRandom, image.size.width/5, image.size.height/5)];
        self.status = MOVING;
        self.xStretch = 1;
        self.yStretch = 1;
    }
    return self;
}



@end
