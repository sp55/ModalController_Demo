//
//  ViewController.m
//  ModalController_Demo
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#import "ViewController.h"
#import "ModalViewController.h"
@interface ViewController ()

@end

@implementation ViewController


- (IBAction)jumpAction:(UIButton *)sender {
    
    ModalViewController *modalVC = [[ModalViewController alloc]init];
    modalVC.definesPresentationContext = YES; //self is presenting view controller
    modalVC.modalPresentationStyle = UIModalPresentationOverCurrentContext;
    [self presentViewController:modalVC animated:NO completion:nil];
    
}


@end
