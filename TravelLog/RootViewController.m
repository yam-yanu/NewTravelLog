//
//  RootViewController.m
//  TravelLog
//
//  Created by ami on 2014/02/06.
//  Copyright (c) 2014年 Yosuke. All rights reserved.
//

#import "RootViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController{
    IBOutlet UIButton *travel_btn;
    IBOutlet UIButton *album_btn;
}


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.

}

//旅するボタンが押された時
- (IBAction)travel_btn:(UIButton *)sender {
    NSLog(@"HelloWorld");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
