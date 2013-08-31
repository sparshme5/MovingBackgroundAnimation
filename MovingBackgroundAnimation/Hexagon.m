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
        [self setFrame: CGRectMake(0, 0, image.size.width/2, image.size.height/2)];
        self.center = CGPointMake(150, 274);
        [self updateSpeed:1];
        self.status = MOVING;
        self.xStretch = 1;
        self.yStretch = 1;
    }
    return self;
}
- (void)updateSpeed: (int) speed{
    if (speed>0 && speed <11) {
        self.speed = speed;
        vx = (vx>0)? 3*speed: -3*speed;
        vy = (vy>0)? 3*speed: -3*speed;
    }
    
}
- (void) updateBallCenter{
    if (self.status == MOVING) {
        if (self.center.x + vx +40 > self.superview.frame.size.width || self.center.x + vx -40 <0) {
            vx = -vx;
        }
        if (self.center.y + vy +40 > self.superview.frame.size.height || self.center.y + vy -40 <0) {
            vy = -vy;
        }
        self.center = CGPointMake(self.center.x + self.xStretch*vx, self.center.y + self.yStretch*vy);
    }
    else if (self.status == DROPPING){
        countV++;
        vx = (vx>0)? vx-(countV/5) : vx+(countV/5);
        if (self.center.x + vx +40 > self.superview.frame.size.width || self.center.x + vx -40 <0) {
            vx = -vx;
        }
        vy = vy + abs(countV/5);
        if  (self.center.y + vy -40 <0){
            vy=-vy;
        }
        if (self.center.x + vx +40 > self.superview.frame.size.width || self.center.x + vx -40 <0) {
            vx = -vx;
        }
        self.center = CGPointMake(self.center.x + vx, self.center.y + vy);
        if (self.center.y +40> self.superview.frame.size.height) {
            self.center = CGPointMake(self.center.x, self.superview.frame.size.height -40);
            self.status = STAYSTILL;
            [self updateSpeed:self.speed];
            countV = 0;
        }
        
    }
}


@end
