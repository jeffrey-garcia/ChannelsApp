//
//  ViewController.m
//  ChannelsApp
//
//  Created by jeffrey on 16/3/15.
//  Copyright (c) 2015 jeffrey. All rights reserved.
//

#import "ViewController.h"
#import "ChannelsLibrary/ChannelsLibrary.h"

@interface ViewController ()

@end

@implementation ViewController

UIButton *testStaticLibraryBtn;
UIButton *testDownloadBundleBtn;
UIButton *testDownloadBundleBtn1;
UIButton *testInitBundleBtn;
UIButton *testUIAlertViewBtn;
UIButton *testUIImageBtn;
UIButton *testXibBtn;

ChannelsLibrary *library;

- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(@"viewDidLoad");
    
    // Do any additional setup after loading the view, typically from a nib.
    
    testStaticLibraryBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testStaticLibraryBtn.frame = CGRectMake(80.0, 150.0, 180.0, 40.0);
    [[testStaticLibraryBtn layer] setBorderWidth:2.0f];
    [[testStaticLibraryBtn layer] setBorderColor:[UIColor grayColor].CGColor];
    [testStaticLibraryBtn setTitle:@"Test Static Library" forState:UIControlStateNormal];
    [testStaticLibraryBtn addTarget:self action:@selector(testStaticLibrary:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testStaticLibraryBtn];
    
    testDownloadBundleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testDownloadBundleBtn.frame = CGRectMake(80.0, 200.0, 180.0, 40.0);
    [[testDownloadBundleBtn layer] setBorderWidth:2.0f];
    [[testDownloadBundleBtn layer] setBorderColor:[UIColor grayColor].CGColor];
    [testDownloadBundleBtn setTitle:@"Test Download Bundle" forState:UIControlStateNormal];
    [testDownloadBundleBtn addTarget:self action:@selector(testDownloadBundle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testDownloadBundleBtn];
    
    testDownloadBundleBtn1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testDownloadBundleBtn1.frame = CGRectMake(80.0, 250.0, 180.0, 40.0);
    [[testDownloadBundleBtn1 layer] setBorderWidth:2.0f];
    [[testDownloadBundleBtn1 layer] setBorderColor:[UIColor grayColor].CGColor];
    [testDownloadBundleBtn1 setTitle:@"Test Download Bundle-1" forState:UIControlStateNormal];
    [testDownloadBundleBtn1 addTarget:self action:@selector(testDownloadBundle1:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testDownloadBundleBtn1];
    
    testInitBundleBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testInitBundleBtn.frame = CGRectMake(80.0, 300.0, 180.0, 40.0);
    [[testInitBundleBtn layer] setBorderWidth:2.0f];
    [[testInitBundleBtn layer] setBorderColor:[UIColor grayColor].CGColor];
    [testInitBundleBtn setTitle:@"Test Init Bundle" forState:UIControlStateNormal];
    [testInitBundleBtn addTarget:self action:@selector(testInitBundle:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testInitBundleBtn];
    
    testUIAlertViewBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testUIAlertViewBtn.frame = CGRectMake(80.0, 350.0, 180.0, 40.0);
    [[testUIAlertViewBtn layer] setBorderWidth:2.0f];
    [[testUIAlertViewBtn layer] setBorderColor:[UIColor grayColor].CGColor];
    [testUIAlertViewBtn setTitle:@"Test UIAlertView" forState:UIControlStateNormal];
    [testUIAlertViewBtn addTarget:self action:@selector(testUIAlertView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testUIAlertViewBtn];
    
    testUIImageBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testUIImageBtn.frame = CGRectMake(80.0, 400.0, 180.0, 40.0);
    [[testUIImageBtn layer] setBorderWidth:2.0f];
    [[testUIImageBtn layer] setBorderColor:[UIColor grayColor].CGColor];
    [testUIImageBtn setTitle:@"Test UIImageView" forState:UIControlStateNormal];
    [testUIImageBtn addTarget:self action:@selector(testUIImageView:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testUIImageBtn];
    
    testXibBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    testXibBtn.frame = CGRectMake(80.0, 450.0, 180.0, 40.0);
    [[testXibBtn layer] setBorderWidth:2.0f];
    [[testXibBtn layer] setBorderColor:[UIColor grayColor].CGColor];
    [testXibBtn setTitle:@"Test XIB" forState:UIControlStateNormal];
    [testXibBtn addTarget:self action:@selector(testXIB:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:testXibBtn];
    
    // disable the buttons by default
    testDownloadBundleBtn.enabled = NO;
    testDownloadBundleBtn1.enabled = NO;
    testInitBundleBtn.enabled = NO;
    testUIAlertViewBtn.enabled = NO;
    testUIImageBtn.enabled = NO;
    testXibBtn.enabled = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)testStaticLibrary:(UIButton *)sender
{
    // trigger the static library
    NSLog(@"Bundle Type: %@", ChannelsLibrary.getBundleType);
    
    // Instantiate the library object
    library = [[ChannelsLibrary alloc] init];
    NSLog(@"Static Library is instantiated");
    
    // enable the following button
    testDownloadBundleBtn.enabled = YES;
    testDownloadBundleBtn1.enabled = YES;
}

-(void)testDownloadBundle:(UIButton *)sender
{
    NSString * urlToDownload = @"";
    urlToDownload = @"https://sites.google.com/site/jeffreygarcia/ChannelsBundle.bundle.zip";
    
    // trigger the static library
    [library testDownloadBundle: self: urlToDownload];
}

-(void)testDownloadBundle1:(UIButton *)sender
{
    NSString * urlToDownload = @"";
    urlToDownload = @"https://sites.google.com/site/jeffreygarcia/ChannelsBundle.bundle-1.zip";
    
    // trigger the static library
    [library testDownloadBundle: self: urlToDownload];
}

#pragma mark - DownloadDelegate protocol
- (void)notifyDownloadCompleted
{
    // enable the following button
    testInitBundleBtn.enabled = YES;
}

-(void)testInitBundle:(UIButton *)sender
{
    // trigger the static library
    BOOL result = [library testInitBundle];
    NSLog(@"init bundle result: %d", result);
    
    if(result) {
        // enable the following button
        testUIAlertViewBtn.enabled = YES;
        testUIImageBtn.enabled = YES;
        testXibBtn.enabled = YES;
    }
}

-(void)testUIAlertView:(UIButton *)sender
{
    // trigger the static library
    [library testUIAlertView];
}

-(void)testUIImageView:(UIButton *)sender
{
    // clear previous UIImagageView if already presented
    for(UIView *subview in [self.view subviews]) {
        if([subview isKindOfClass:[UIImageView class]]) {
            [subview removeFromSuperview];
            NSLog(@"previous UIImageView is cleared");
        } else {
            // Do nothing - not a UIImageView or subclass instance
        }
    }
    
    // trigger the static library
    UIImage *theImage = [library testUIImage];
    
    // create image view instance
    UIImageView *theImageView = [[UIImageView alloc] initWithImage:theImage];
    
    //set the frame for the image view
    CGRect theFrame = CGRectMake(30.0f, 80.0f, theImageView.frame.size.width, theImageView.frame.size.height/2);
    [theImageView setFrame:theFrame];
    
    //If your image is bigger than the frame then you can scale it
    [theImageView setContentMode:UIViewContentModeScaleAspectFit];
    
    //add the image view to the current view
    [self.view addSubview:theImageView];
}

-(void)testXIB:(UIButton *)sender
{
    // trigger the static library
    UIViewController * theNewViewController = [library testXIB];
    //UIViewController * theNewViewController = [[ViewController alloc] init];
    
    /*
    theNewViewController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
    NSLog(@"UIViewController instantiated");
    
    [UIView beginAnimations:@"View Flip" context:nil];
    [UIView setAnimationDuration:0.80];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationTransition:UIViewAnimationTransitionFlipFromRight forView:self.navigationController.view cache:NO];
    */
    
    [self.navigationController pushViewController:theNewViewController animated:YES];
    [UIView commitAnimations];
}

@end
