//
//  ModalViewController.m
//  ModalController_Demo
//
//  Created by admin on 16/8/4.
//  Copyright © 2016年 AlezJi. All rights reserved.
//

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height
#define White_Color  [UIColor whiteColor]
#define Black_Color  [UIColor blackColor]
#define Orange_Color    [UIColor orangeColor]

#import "ModalViewController.h"
#import "UIView+Extension.h"

@interface ModalViewController ()
@property (nonatomic,strong)UIView *topView;
@property (nonatomic,strong)UIView *bottomView;
@end

@implementation ModalViewController
-(UIColor *)colorWithRGB:(uint32_t)rgbValue alpha:(CGFloat)alpha {
    return [UIColor colorWithRed:((rgbValue & 0xFF0000) >> 16) / 255.0f
                           green:((rgbValue & 0xFF00) >> 8) / 255.0f
                            blue:(rgbValue & 0xFF) / 255.0f
                           alpha:alpha];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [self colorWithRGB:0x000000 alpha:0.65];
    [self initTopView];
    [self initBottomView];
    
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(back:)];
    [self.view addGestureRecognizer:tap];
}

#pragma mark - TopView
- (void)initTopView
{
    self.topView = [[UIView alloc]initWithFrame:CGRectMake(0, 64, kScreenWidth, kScreenHeight-100-64)];
    [self.view addSubview:self.topView];
    
    
    //签收状态
    UILabel *orderStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(20*kScreenWidth/375, 20, 100, 30)];
    orderStateLabel.font = [UIFont systemFontOfSize:16.0f];
    orderStateLabel.textColor = [UIColor whiteColor];
    orderStateLabel.text = @"签收状态";
    [self.topView addSubview:orderStateLabel];
    NSArray *orderStateArr=@[@"全部",@"已签收",@"未收款"];
    for (NSInteger i=0; i<orderStateArr.count; i++) {
        UIButton *orderStateBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        orderStateBtn.frame = CGRectMake(kScreenWidth/10+kScreenWidth*3*i/10, orderStateLabel.bottom+5, kScreenWidth/5, 35);
        [orderStateBtn setTitle:orderStateArr[i] forState:UIControlStateNormal];
        [orderStateBtn setTitleColor:Black_Color forState:UIControlStateNormal];
        [orderStateBtn setTitleColor:White_Color forState:UIControlStateSelected];
        orderStateBtn.backgroundColor = White_Color;
        orderStateBtn.tag = 100+i;
        [orderStateBtn addTarget:self action:@selector(orderStataBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.topView addSubview:orderStateBtn];
    }
    
    //发车状态
    UILabel *sendStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(orderStateLabel.left, 20+80, orderStateLabel.width, orderStateLabel.height)];
    sendStateLabel.font = [UIFont systemFontOfSize:16.0f];
    sendStateLabel.textColor = [UIColor whiteColor];
    sendStateLabel.text = @"发车状态";
    [self.topView addSubview:sendStateLabel];
    NSArray *sendStateArr=@[@"全部",@"发车",@"发货"];
    for (NSInteger i=0; i<sendStateArr.count; i++) {
        UIButton *sendStateBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        sendStateBtn.frame = CGRectMake(kScreenWidth/10+kScreenWidth*3*i/10, sendStateLabel.bottom+5, kScreenWidth/5, 35);
        [sendStateBtn setTitle:sendStateArr[i] forState:UIControlStateNormal];
        [sendStateBtn setTitleColor:Black_Color forState:UIControlStateNormal];
        [sendStateBtn setTitleColor:White_Color forState:UIControlStateSelected];
        sendStateBtn.backgroundColor = White_Color;
        sendStateBtn.tag = 103+i;
        [sendStateBtn addTarget:self action:@selector(sendStataBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.topView addSubview:sendStateBtn];
    }
    
    
    //废弃状态
    UILabel *abandonedStateLabel = [[UILabel alloc]initWithFrame:CGRectMake(orderStateLabel.left, 20+160, orderStateLabel.width, orderStateLabel.height)];
    abandonedStateLabel.font = [UIFont systemFontOfSize:16.0f];
    abandonedStateLabel.textColor = [UIColor whiteColor];
    abandonedStateLabel.text = @"废弃状态";
    [self.topView addSubview:abandonedStateLabel];
    NSArray *abandonedStateArr=@[@"全部",@"已作废",@"未作废"];
    for (NSInteger i=0; i<abandonedStateArr.count; i++) {
        UIButton *abandonedStateBtn =[UIButton buttonWithType:UIButtonTypeCustom];
        abandonedStateBtn.frame = CGRectMake(kScreenWidth/10+kScreenWidth*3*i/10, abandonedStateLabel.bottom+5, kScreenWidth/5, 35);
        [abandonedStateBtn setTitle:abandonedStateArr[i] forState:UIControlStateNormal];
        [abandonedStateBtn setTitleColor:Black_Color forState:UIControlStateNormal];
        [abandonedStateBtn setTitleColor:White_Color forState:UIControlStateSelected];
        abandonedStateBtn.backgroundColor = White_Color;
        abandonedStateBtn.tag = 106+i;
        [abandonedStateBtn addTarget:self action:@selector(abandonedStataBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        [self.topView addSubview:abandonedStateBtn];
    }
    
    
}


#pragma mark - orderStataBtnAction
-(void)orderStataBtnAction:(UIButton *)btn{
    for (NSInteger i=100; i<103; i++) {
        UIButton *tmpBtn=[self.view viewWithTag:i];
        tmpBtn.selected = NO;
        tmpBtn.backgroundColor = White_Color;
    }
    btn.selected = YES;
    btn.backgroundColor =Orange_Color;
}
#pragma mark - sendStataBtnAction
-(void)sendStataBtnAction:(UIButton *)btn{
    for (NSInteger i=103; i<106; i++) {
        UIButton *tmpBtn=[self.view viewWithTag:i];
        tmpBtn.selected = NO;
        tmpBtn.backgroundColor = White_Color;
    }
    btn.selected = YES;
    btn.backgroundColor =Orange_Color;
    
}
#pragma mark -abandonedStataBtnAction
-(void)abandonedStataBtnAction:(UIButton *)btn{
    for (NSInteger i=106; i<109; i++) {
        UIButton *tmpBtn=[self.view viewWithTag:i];
        tmpBtn.selected = NO;
        tmpBtn.backgroundColor = White_Color;
    }
    btn.selected = YES;
    btn.backgroundColor =Orange_Color;
}

#pragma mark - BottomView
- (void)initBottomView
{
    self.bottomView = [[UIView alloc]initWithFrame:CGRectMake(0, kScreenHeight - 100, kScreenWidth, 100)];
    
    [self.view addSubview:self.bottomView];
    UIButton *clearBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    clearBtn.frame = CGRectMake(10, 20, (kScreenWidth- 30)/2, 40);
    [clearBtn setTitle:@"重置" forState:UIControlStateNormal];
    clearBtn.backgroundColor = [UIColor whiteColor];
    [clearBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    clearBtn.layer.cornerRadius = 3;
    clearBtn.clipsToBounds = YES;
    [clearBtn addTarget:self action:@selector(clearAction) forControlEvents:UIControlEventTouchUpInside];
    [self.bottomView addSubview:clearBtn];
    
    
    
    
    UIButton *confirmBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    confirmBtn.frame = CGRectMake(clearBtn.right + 10, 20, (kScreenWidth- 30)/2, 40);
    [confirmBtn setTitle:@"确定" forState:UIControlStateNormal];
    confirmBtn.backgroundColor = [UIColor whiteColor];
    [confirmBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    confirmBtn.layer.cornerRadius = 3;
    confirmBtn.clipsToBounds = YES;
    [confirmBtn addTarget:self action:@selector(confirmAction) forControlEvents:UIControlEventTouchUpInside];
    confirmBtn.backgroundColor = Orange_Color;
    [self.bottomView addSubview:confirmBtn];
    
    
    
    
    
    
}



#pragma mark - 清除所有状态
- (void)clearAction
{
    for (NSInteger i=100; i<109; i++) {
        UIButton *tmpBtn=[self.view viewWithTag:i];
        tmpBtn.selected = NO;
        tmpBtn.backgroundColor = White_Color;
    }
    
}

#pragma mark - 确定

- (void)confirmAction
{
    
    NSMutableString *mutStr=[NSMutableString string];
    for (NSInteger i=100; i<109; i++) {
        UIButton *tmpBtn=[self.view viewWithTag:i];
        if (tmpBtn.selected) {
            [mutStr appendString:[NSString stringWithFormat:@"%@--->",tmpBtn.titleLabel.text]];
        }
    }
    NSLog(@"最终的字符串-->%@",mutStr);
    
    //    [self dismissViewControllerAnimated:NO completion:nil];
    
}
- (void)back:(UITapGestureRecognizer *)t {
    [self dismissViewControllerAnimated:NO completion:nil];
}



@end
