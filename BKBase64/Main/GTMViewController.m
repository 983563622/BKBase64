//
//  GTMViewController.m
//  Base64
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 CloudRoom. All rights reserved.
//

#import "GTMViewController.h"
#import "UIButton+K.h"
#import "GTMBase64.h"

@interface GTMViewController ()

@end

typedef NS_ENUM(NSInteger, GTMViewType)
{
    GTMViewTypeEncodeBtn = 200,
    GTMViewTypeDecodeBtn,
};

@interface GTMViewController ()

@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

@property (weak, nonatomic) IBOutlet UILabel *encodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *decodeLabel;

@property (weak, nonatomic) IBOutlet UIButton *encodeBtn;

@property (weak, nonatomic) IBOutlet UIButton *decodeBtn;

- (IBAction)btnClickForGTMViewController:(UIButton *)sender;

@end

@implementation GTMViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUIScreenForGTMViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClickForGTMViewController:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    
    switch (tag)
    {
        case GTMViewTypeEncodeBtn: // encode
        {
            [self testEncodeForGTM];
            
            break;
        }
        case GTMViewTypeDecodeBtn: // decode
        {
            [self testDecodeForGTM];
            
            break;
        }
        default:
            break;
    }
}

#pragma mark - private methods
- (void)setupUIScreenForGTMViewController
{
    [self.encodeBtn initWithCallButtonBackgroundWithNormalImage:@"bottom_button_color_n" highlightedImage:@"bottom_button_color_h" selectedImage:nil disabledImage:nil];
    
    [self.decodeBtn initWithCallButtonBackgroundWithNormalImage:@"bottom_button_color_n" highlightedImage:@"bottom_button_color_h" selectedImage:nil disabledImage:nil];
}

- (void)testEncodeForGTM
{
    NSString *initString = self.contentTextField.text;
    
    NSData *initData = [initString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *encodeData = [GTMBase64 encodeData:initData];
    
    NSString *encodeString = [[NSString alloc] initWithData:encodeData encoding:NSUTF8StringEncoding];
    
    [self.encodeLabel setText:encodeString];
}

- (void)testDecodeForGTM
{
    NSString *encodeString = self.encodeLabel.text;
    
    NSData *encodeData = [encodeString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSData *decodeData = [GTMBase64 decodeData:encodeData];
    
    NSString *decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    
    [self.decodeLabel setText:decodeString];
}

#pragma mark - reload methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end
