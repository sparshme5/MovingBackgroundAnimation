//
//  ViewController.m
//  MovingBackgroundAnimation
//
//  Created by Gaurav Taywade on 31/08/13.
//  Copyright (c) 2013 OAB studios. All rights reserved.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController
@synthesize HexagonImageView;
@synthesize HexagonImageView2;
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    [self LoadHexagonOnscreen];
}

-(void)LoadHexagonOnscreen
{
    HexagonImageView = [[Hexagon alloc]initWithImage:[UIImage imageNamed:@"hexa.png"]];
    [self.view addSubview:HexagonImageView];
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.025
                                                  target: HexagonImageView
                                                selector:@selector(updateBallCenter)
                                                userInfo:nil
                                                 repeats:YES];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
