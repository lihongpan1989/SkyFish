//
//  KGForgetPswController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGForgetPswController.h"
#import "JKCountDownButton.h"
#import "CWSPublicButton.h"
#define kDistance 10
#define kTextFieldHeight 44
@interface KGForgetPswController ()

@property (nonatomic, strong) UITextField *phoneTextField;//手机号码

@property (nonatomic, strong) UITextField *codeTextField;//验证码

@property (nonatomic, strong) UITextField *passwordTextField;//密码

@property (nonatomic, strong) CWSPublicButton *sureBtn;//确定按钮

@property (nonatomic, strong) JKCountDownButton *getCodeBtn;//验证码按钮

@end

@implementation KGForgetPswController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"忘记密码";
    self.view.backgroundColor = [UIColor whiteColor];
    //创建视图
    [self buildUI];
}
#pragma mark - 创建视图
-(void)buildUI
{
    self.view.backgroundColor = kCOLOR(241, 241, 241);
    //手机号码输入框
    self.phoneTextField = [self setTextFieldWithFrame:CGRectMake(kDistance, kDistance*2+64, kSizeOfScreen.width-2*kDistance, kTextFieldHeight) withPlaceholder:@"请输入您的手机号"];
    [self.view addSubview:self.phoneTextField];
    
    //密码输入框
    self.codeTextField = [self setTextFieldWithFrame:CGRectMake(kDistance, self.phoneTextField.y_height+kDistance, (kSizeOfScreen.width-2*kDistance)*0.66, kTextFieldHeight) withPlaceholder:@"请输入验证码"];
    [self.view addSubview:self.codeTextField];
    
    //添加右侧获取验证码按钮
    self.getCodeBtn = [[JKCountDownButton alloc]initWithFrame:CGRectMake(self.codeTextField.x_width+kDistance, self.codeTextField.y, (kSizeOfScreen.width-2*kDistance)*0.36-kDistance, kTextFieldHeight)];
    self.getCodeBtn.backgroundColor = [UIColor whiteColor];
    self.getCodeBtn.layer.masksToBounds = YES;
    self.getCodeBtn.layer.cornerRadius = 4;
    self.getCodeBtn.layer.borderColor = [[UIColor lightGrayColor] CGColor];
    self.getCodeBtn.layer.borderWidth = 1;
    [self.getCodeBtn setTitle:@"获取验证码" forState:UIControlStateNormal];
    self.getCodeBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [self.getCodeBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    WS(ws);
    [self.getCodeBtn addToucheHandler:^(JKCountDownButton*sender, NSInteger tag) {
        //验证手机
        if (![Utils checkPhoneNub:ws.phoneTextField.text]) {
            [MBProgressHUD showError:@"手机号码有误，请重新输入" toView:ws.view];
            return;
        }
        sender.enabled = NO;
        [sender setTitleColor:[UIColor colorWithRed:177/255.0 green:177/255.0 blue:179/255.0 alpha:1] forState:UIControlStateNormal];
        [sender startWithSecond:60];
        
        [sender didChange:^NSString *(JKCountDownButton *countDownButton,int second) {
            NSString *title = [NSString stringWithFormat:@"重新发送(%d)",second];
            return title;
        }];
        [sender didFinished:^NSString *(JKCountDownButton *countDownButton, int second) {
            countDownButton.enabled = YES;
            [countDownButton setTitleColor:[UIColor colorWithRed:250/255.0 green:86/255.0 blue:85/255.0 alpha:1] forState:UIControlStateNormal];
            return @"重新发送";
        }];
    }];
    [self.view addSubview:self.getCodeBtn];
    
    //密码输入
    self.passwordTextField = [self setTextFieldWithFrame:CGRectMake(kDistance, self.codeTextField.y_height+kDistance, kSizeOfScreen.width-2*kDistance, kTextFieldHeight) withPlaceholder:@"请输入您的密码"];
    self.passwordTextField.secureTextEntry = YES;
    [self.view addSubview:self.passwordTextField];
    
    self.sureBtn = [[CWSPublicButton alloc]initWithFrame:CGRectMake(kDistance, self.passwordTextField.y_height+2*kDistance, self.passwordTextField.width, kTextFieldHeight)];
    [self.sureBtn addTarget:self action:@selector(sureClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.sureBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.view addSubview:self.sureBtn];
}
#pragma mark - 快速集成输入框
-(UITextField *)setTextFieldWithFrame:(CGRect)frame withPlaceholder:(NSString *)placehold
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placehold;
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, kTextFieldHeight)];
    return textField;
}

-(void)sureClick:(CWSPublicButton*)sender
{
    MyLog(@"%s",__func__);
    //判断手机
    //验证手机
    if (![Utils checkPhoneNub:self.phoneTextField.text]) {
        [MBProgressHUD showError:@"手机号码有误，请重新输入" toView:self.view];
        return;
    }
    //判断验证码
    
    //判断密码
    if (!(self.passwordTextField.text.length>5 && self.passwordTextField.text.length<17)) {
        [MBProgressHUD showError:@"密码长度必须为6-16位字母加数字，请重新输入" toView:self.view];
        return;
    }
    //注册网络请求
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
