//
//  ViewController.m
//  HybridLayout
//
//  Created by 乌雅 on 5/25/15.
//  Copyright (c) 2015 Greenesttea. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//demonstrates a hybrid layout: autosized nib receives progrmmatice autolayout specs
-(void)loadView
{
    NSLog(@"newer change");
    //create view
    self.view = [[UIView alloc]init];
    self.view.backgroundColor = [UIColor whiteColor];
    
    //load subview from nib
    UIView *subview = [[[NSBundle mainBundle] loadNibNamed:@"View" owner:self options:nil] lastObject];
    [self.view addSubview:subview];
    
    //do autolayout preparations
    //this only affects view and parent, not view's children
    subview.translatesAutoresizingMaskIntoConstraints = NO;
    
    //add constraints
    NSLayoutConstraint *constraint;
    
    //center along parent x & y axes
    constraint = [NSLayoutConstraint
        constraintWithItem:subview
        attribute:NSLayoutAttributeCenterX
        relatedBy:NSLayoutRelationEqual
        toItem:self.view
        attribute:NSLayoutAttributeCenterX
        multiplier:1
        constant:0];
    
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:subview
                  attribute:NSLayoutAttributeCenterY
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeCenterY
                  multiplier:1
                  constant:0];
    
    [self.view addConstraint:constraint];
    
    
    //set aspect ratio to 1:1
    constraint = [NSLayoutConstraint
                  constraintWithItem:subview
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationEqual
                  toItem:subview
                  attribute:NSLayoutAttributeHeight
                  multiplier:1
                  constant:0];
    
    [self.view addConstraint:constraint];
    
    //constrain with respect to superview's size
    constraint = [NSLayoutConstraint
                  constraintWithItem:subview
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationLessThanOrEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeWidth
                  multiplier:1
                  constant:-40];
    
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:subview
                  attribute:NSLayoutAttributeHeight
                  relatedBy:NSLayoutRelationLessThanOrEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeHeight
                  multiplier:1
                  constant:-40];
    
    [self.view addConstraint:constraint];
    
    //add a weak 'match size' constraint
    constraint = [NSLayoutConstraint
                  constraintWithItem:subview
                  attribute:NSLayoutAttributeWidth
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeWidth
                  multiplier:1
                  constant:-40];
    constraint.priority = 1;
    
    [self.view addConstraint:constraint];
    
    constraint = [NSLayoutConstraint
                  constraintWithItem:subview
                  attribute:NSLayoutAttributeHeight
                  relatedBy:NSLayoutRelationEqual
                  toItem:self.view
                  attribute:NSLayoutAttributeHeight
                  multiplier:1
                  constant:-40];
    constraint.priority = 1;
    
    [self.view addConstraint:constraint];
    
}

@end
