//
//  SCGestureViewController.m
//  SCTextAction
//
//  Created by silentcloud on 13-12-19.
//  Copyright (c) 2013年 silentcloud. All rights reserved.
//

#import "SCGestureViewController.h"

@interface SCGestureViewController () <UITextFieldDelegate>
{
    UITextField *_nameInput;
    UIButton *_loginBtn;
}
@end

@implementation SCGestureViewController

- (id)init
{
    self = [super init];
    if (self) {
        self.navigationItem.title = @"通过 gesture";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _nameInput = [[UITextField alloc] initWithFrame:CGRectMake(20, 80, 200, 30)];
    _nameInput.placeholder = @"用户名";
    _nameInput.borderStyle = UITextBorderStyleLine;
    _nameInput.delegate = self;
    [_nameInput becomeFirstResponder];
    [self.view addSubview:_nameInput];
    
    _loginBtn = [[UIButton alloc] initWithFrame:CGRectMake(20, 100, 200, 40)];
    _loginBtn.backgroundColor = [UIColor redColor];
    [_loginBtn setTitle:@"登 录" forState:UIControlStateNormal];
    [_loginBtn addTarget:self action:@selector(login:) forControlEvents:UIControlEventTouchUpInside];
    
    [self.view addSubview:_loginBtn];
    
    UITapGestureRecognizer *tapGr = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(viewTapped:)];
    tapGr.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:tapGr];
}

- (void)login:(id)sender
{
    NSLog(@"login");
    
}

- (void)viewTapped:(UITapGestureRecognizer *)gesture
{
    NSLog(@"tap");
    [_nameInput resignFirstResponder];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
