//
//  KGLoginController.m
//  SkyFish
//
//  Created by 李洪攀 on 15/11/18.
//  Copyright © 2015年 SkyFish. All rights reserved.
//

#import "KGLoginController.h"
#import "CWSLoginTextField.h"
#import "UIView+Frame.h"
#import "CWSPublicButton.h"
#import "UIButton+titleFrame.h"
#import "Utils.h"
#import "KGRegistController.h"
#import "KGForgetPswController.h"
#define CWSPercent 0.43
#define CWSLeftDistance 15
#define CWSHeightDistance [[UIScreen mainScreen]applicationFrame].size.height * 0.03
@interface KGLoginController ()
@property (nonatomic, strong) UIImageView *iconImgView;//大图片
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) CWSLoginTextField *phoneTF;//手机号码输入框
@property (nonatomic, strong) CWSLoginTextField *passwordTF;//密码输入框
@property (nonatomic, strong) CWSPublicButton *sureBtn;//登录按钮
@property (nonatomic, strong) UIButton *forgetPassWordBtn;//忘记密码按钮
@property (nonatomic, strong) UIButton *registBtn;//注册按钮
@end

@implementation KGLoginController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"登陆";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"按钮_左侧菜单"] style:UIBarButtonItemStyleBordered target:self action:@selector(backClick)];
    
    [self setUI];
}
-(void)backClick
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - 创建视图
- (void)setUI
{
    _iconImgView = [[UIImageView alloc]init];
    [self.view addSubview:_iconImgView];
    _iconImgView.frame = CGRectMake(0,64,kSizeOfScreen.width*0.25, kSizeOfScreen.width*0.25);
    _iconImgView.contentMode = UIViewContentModeScaleToFill;
    _iconImgView.image = [UIImage imageNamed:@"背景图片"];
    _iconImgView.center = CGPointMake(kSizeOfScreen.width/2, (kSizeOfScreen.height-64)*CWSPercent/2+64);
    _iconImgView.backgroundColor = KMainColor;
    _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, _iconImgView.y_height, kSizeOfScreen.width, 44)];
    _titleLabel.text = @"空钩";
    _titleLabel.font = [UIFont systemFontOfSize:21];
    _titleLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_titleLabel];
    
    //手机号码
    _phoneTF = [[CWSLoginTextField alloc]initWithFrame:CGRectMake(CWSLeftDistance, (kSizeOfScreen.height-64)*CWSPercent+44, kSizeOfScreen.width - 2 * CWSLeftDistance, 44)];
    _phoneTF.leftImage = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    _phoneTF.placeholder = @"手机号码";
    [self.view addSubview:_phoneTF];
    //密码
    _passwordTF = [[CWSLoginTextField alloc]initWithFrame:CGRectMake(CWSLeftDistance, _phoneTF.y + _phoneTF.height + CWSHeightDistance, kSizeOfScreen.width - 2 * CWSLeftDistance, 44)];
    _passwordTF.leftImage = [UIImage imageNamed:@"searchbar_textfield_search_icon"];
    _passwordTF.placeholder = @"密码";
    _passwordTF.secureTextEntry = YES;
    [self.view addSubview:_passwordTF];
    
    //登录按钮
    _sureBtn = [[CWSPublicButton alloc]initWithFrame:CGRectMake(CWSLeftDistance, _passwordTF.y + _passwordTF.height +2*CWSHeightDistance, kSizeOfScreen.width - 2 * CWSLeftDistance, 44)];
    [_sureBtn setTitle:@"登录" forState:UIControlStateNormal];
    [_sureBtn addTarget:self action:@selector(loginClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_sureBtn];
    
    //忘记密码
    _forgetPassWordBtn = [[UIButton alloc]initWithFrame:CGRectMake(CWSLeftDistance, kSizeOfScreen.height-30 + 20, 80, 30)];
    [_forgetPassWordBtn setFrameWithTitle:@"忘记密码?" forState:UIControlStateNormal];
    [_forgetPassWordBtn addTarget:self action:@selector(forgetPassWordClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_forgetPassWordBtn];

    //新用户注册
    _registBtn = [[UIButton alloc]initWithFrame:CGRectMake(kSizeOfScreen.width - CWSLeftDistance, _forgetPassWordBtn.y, 0, 30)];
    [_registBtn setFrameWithTitle:@"新用户注册" forState:UIControlStateNormal];
    [_registBtn addTarget:self action:@selector(registClick:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_registBtn];
}
#pragma mark - 登录事件
- (void)loginClick:(CWSPublicButton*)sender
{
    NSLog(@"%s",__func__);
    [Utils checkPhoneNub:self.phoneTF.text andPassword:self.passwordTF.text complete:^(BOOL isSuccess) {
        MyLog(@" tel:%@ \n psw:%@",self.phoneTF.text,self.passwordTF.text);
    } error:^(NSString *errorMsg) {
        [MBProgressHUD showError:errorMsg toView:self.view];
    }];
}
#pragma mark - 忘记密码事件
- (void)forgetPassWordClick:(UIButton *)sender
{
    NSLog(@"%s",__func__);
    KGForgetPswController *forgetPasswordVC = [[KGForgetPswController alloc]init];
    [self.navigationController pushViewController:forgetPasswordVC animated:YES];
}
#pragma mark - 注册事件
- (void)registClick:(UIButton *)sender
{
    NSLog(@"%s",__func__);
    KGRegistController *registVC = [[KGRegistController alloc]init];
    [self.navigationController pushViewController:registVC animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
