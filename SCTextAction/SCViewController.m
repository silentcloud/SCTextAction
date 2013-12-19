//
//  SCViewController.m
//  SCTextAction
//
//  Created by silentcloud on 13-12-19.
//  Copyright (c) 2013年 silentcloud. All rights reserved.
//

//通过 touchesBegan:withEvent: 隐藏键盘

#import "SCViewController.h"
#import "SCGestureViewController.h"

@interface SCViewController () <UITextFieldDelegate>
{
    UIView *_rootView;
    UITextField *_nameInput;
    UITextField *_pwdInput;
    UIButton *_loginBtn;
    UIButton *_nextBtn;
}
@end

@implementation SCViewController

- (id)init
{
    self = [super init];
    if (self) {
        // Custom initialization
        self.navigationItem.title = @"通过touch";
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [_nameInput becomeFirstResponder];
}

- (BOOL)resignFirstResponder {
    [self.view endEditing:YES];
    return [super resignFirstResponder];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _rootView = [[UIView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:_rootView];
    
    _nameInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 200, 30)];
    _nameInput.placeholder = @"用户名";
    _nameInput.borderStyle = UITextBorderStyleLine;
    _nameInput.delegate = self;
    
    [_rootView addSubview:_nameInput];
    
    _pwdInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 130, 200, 30)];
    _pwdInput.placeholder = @"密码";
    _pwdInput.borderStyle = UITextBorderStyleLine;
    _pwdInput.delegate = self;
    
    [_rootView addSubview:_pwdInput];
    
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 170, 200, 40)];
    _loginBtn.backgroundColor = [UIColor redColor];
    [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [_rootView addSubview:_loginBtn];
    
    _nextBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 220, 200, 40)];
    _nextBtn.backgroundColor = [UIColor blueColor];
    [_nextBtn setTitle:@"通过手势隐藏" forState:UIControlStateNormal];
    [_nextBtn addTarget:self action:@selector(next:) forControlEvents:UIControlEventTouchUpInside];
    
    [_rootView addSubview:_nextBtn];
    
}

- (void)login:(id)sender
{
    NSLog(@"login");
    
}

- (void)next:(id)sender
{
    NSLog(@"next");
    [self resignFirstResponder];
    SCGestureViewController *gestureVC = [[SCGestureViewController alloc] init];
    [self.navigationController pushViewController:gestureVC animated:YES];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touches");
    [super touchesBegan:touches withEvent:event];
    [self restoreUI];
    [self resignFirstResponder];
}

- (void)restoreUI {
    CGRect bounds = _rootView.bounds;
    _rootView.frame = bounds;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    if(textField == _nameInput) {
        [_pwdInput becomeFirstResponder];
    } else if(textField == _pwdInput){
        [_pwdInput resignFirstResponder];
    }
    
	return YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
