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

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.


    //Background moving animation
    arrayForImageView=[[NSMutableArray alloc]init];
    [self LoadHexagonOnscreen];
}



#pragma mark - Background Animation
-(void)LoadHexagonOnscreen
{
    for (int i=1; i<4; i++)
    {
        Hexagon *HexagonImageView = [[Hexagon alloc]initWithImage:[UIImage imageNamed:@"smiley.jpeg"]];
        HexagonImageView.xStretch=0.5;
        HexagonImageView.yStretch=0.5;
        [arrayForImageView addObject:HexagonImageView];
        [HexagonImageView setAlpha:1];
        [self.view addSubview:HexagonImageView];
        [self.view sendSubviewToBack:HexagonImageView];
    }
    
    self.timer = [NSTimer scheduledTimerWithTimeInterval:0.02
                                                  target: self
                                                selector:@selector(UpdateHexaPosition)
                                                userInfo:nil
                                                 repeats:YES];
}

- (void) UpdateHexaPosition
{
    
    for (Hexagon *HexagonImageView1 in arrayForImageView)
    {
        for (Hexagon *HexagonImageView in arrayForImageView)
        {
            
            if (CGRectIntersectsRect([HexagonImageView1 frame], [HexagonImageView frame]) && (HexagonImageView!=HexagonImageView1))
            {
                HexagonImageView.xStretch = (HexagonImageView.center.x<HexagonImageView1.center.x)? 1*HexagonImageView.xStretch: -1*HexagonImageView.xStretch;
                HexagonImageView.yStretch = (HexagonImageView.center.y<HexagonImageView1.center.y)? 1*HexagonImageView.yStretch: -1*HexagonImageView.yStretch;
                
                HexagonImageView1.xStretch = (HexagonImageView1.xStretch<HexagonImageView.xStretch)? 1*HexagonImageView1.xStretch: -1*HexagonImageView1.xStretch;
                HexagonImageView1.yStretch = (HexagonImageView1.yStretch<HexagonImageView.yStretch)? 1*HexagonImageView1.yStretch: -1*HexagonImageView1.yStretch;
                
                HexagonImageView.center = CGPointMake(HexagonImageView.center.x +HexagonImageView.xStretch, HexagonImageView.center.y+HexagonImageView.yStretch);
                HexagonImageView1.center = CGPointMake(HexagonImageView1.center.x +HexagonImageView1.xStretch, HexagonImageView1.center.y+HexagonImageView1.yStretch);
            }
            else
            {
                if (HexagonImageView.center.x-(HexagonImageView.frame.size.width/2) < 0)
                {
                    HexagonImageView.xStretch = (HexagonImageView.xStretch>0)? 1*HexagonImageView.xStretch: -1*HexagonImageView.xStretch;
                }
                else if(self.view.bounds.size.width < HexagonImageView.center.x+HexagonImageView.frame.size.width/2)
                {
                    HexagonImageView.xStretch = (HexagonImageView.xStretch<0)? 1*HexagonImageView.xStretch: -1*HexagonImageView.xStretch;
                }
                
                if (HexagonImageView.center.y-(HexagonImageView.frame.size.height/2)<0)
                {
                    HexagonImageView.yStretch = (HexagonImageView.yStretch>0)? 1*HexagonImageView.yStretch: -1*HexagonImageView.yStretch;
                }
                else if(self.view.bounds.size.height < HexagonImageView.center.y+HexagonImageView.frame.size.height/2)
                {
                    HexagonImageView.yStretch = (HexagonImageView.yStretch<0)? 1*HexagonImageView.yStretch: -1*HexagonImageView.yStretch;
                }
                
                HexagonImageView.center = CGPointMake(HexagonImageView.center.x +HexagonImageView.xStretch, HexagonImageView.center.y+HexagonImageView.yStretch);
                
            }
        }
    }
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
