//
//  KGRegistController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGRegistController.h"
#import "CWSReadPolicyView.h"
#import "CWSPublicButton.h"
#import "KGPolicyController.h"//服务协议
#define kDistance 10
#define kTextFieldHeight 44
@interface KGRegistController ()<CWSReadPolicyViewDelegate>
{
    BOOL _readSelect;
}
@property (nonatomic, strong) UITextField *phoneTextField;//手机号码

@property (nonatomic, strong) UITextField *passwordTextField;//密码

@property (nonatomic, strong) UITextField *againPasswordTextField;//再次输入密码

@property (nonatomic, strong) CWSPublicButton *registBtn;//注册按钮

@property (nonatomic, strong) CWSReadPolicyView *readPolicyView;
@end

@implementation KGRegistController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"注册";
    _readSelect = YES;
    self.view.backgroundColor = [UIColor whiteColor];
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
    self.passwordTextField = [self setTextFieldWithFrame:CGRectMake(kDistance, self.phoneTextField.y_height+kDistance, kSizeOfScreen.width-2*kDistance, kTextFieldHeight) withPlaceholder:@"请输入您的密码"];
    self.passwordTextField.secureTextEntry = YES;
    [self.view addSubview:self.passwordTextField];
    
    //再次密码输入
    self.againPasswordTextField = [self setTextFieldWithFrame:CGRectMake(kDistance, self.passwordTextField.y_height+kDistance, kSizeOfScreen.width-2*kDistance, kTextFieldHeight) withPlaceholder:@"请再次输入您的密码"];
    self.againPasswordTextField.secureTextEntry = YES;
    [self.view addSubview:self.againPasswordTextField];
    
    self.registBtn = [[CWSPublicButton alloc]initWithFrame:CGRectMake(kDistance, self.againPasswordTextField.y_height+2*kDistance, self.phoneTextField.width, kTextFieldHeight)];
    [self.registBtn setTitle:@"注册" forState:UIControlStateNormal];
    [self.registBtn addTarget:self action:@selector(registClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.registBtn];
    
    _readPolicyView = [[CWSReadPolicyView alloc]initWithFrame:CGRectMake(self.registBtn.x, self.registBtn.y+self.registBtn.height+20, kSizeOfScreen.width-30, 20)];
    _readPolicyView.delegate = self;
    [self.view addSubview:_readPolicyView];
}
#pragma mark - 快速创建输入框
-(UITextField *)setTextFieldWithFrame:(CGRect)frame withPlaceholder:(NSString *)placehold
{
    UITextField *textField = [[UITextField alloc]initWithFrame:frame];
    textField.placeholder = placehold;
    textField.backgroundColor = [UIColor whiteColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.leftView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 10, kTextFieldHeight)];
    return textField;
}
#pragma mark - 注册事件
-(void)registClick:(UIButton*)sender
{
    MyLog(@"%s",__func__);
    //验证手机
    if (![Utils checkPhoneNub:self.phoneTextField.text]) {
        [MBProgressHUD showError:@"手机号码有误，请重新输入" toView:self.view];
        return;
    }
    //验证密码
    if (!(self.passwordTextField.text.length && self.againPasswordTextField.text.length)) {
        [MBProgressHUD showError:@"密码不能为空，请重新输入" toView:self.view];
        return;
    }
    if (![self.passwordTextField.text isEqualToString:self.againPasswordTextField.text]) {
        [MBProgressHUD showError:@"两次密码输入不一致，请重新输入" toView:self.view];
        return;
    }
    //判断是否选择服务协议
    if (!_readSelect) {
        [MBProgressHUD showError:@"请选择服务协议" toView:self.view];
        return;
    }
    //请求网络

}
#pragma mark - 服务选项代理
//跳转到服务协议界面
-(void)readPolicyViewTurnToPolicyVC
{
    MyLog(@"%s",__func__);
    KGPolicyController*policyVC = [[KGPolicyController alloc]init];
    [self.navigationController pushViewController:policyVC animated:YES];
}
//是否选择协议
-(void)readPolicyViewTochDown:(BOOL)readOrPolicy
{
    _readSelect = readOrPolicy;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
