//
//  MyViewController.m
//  Base64
//
//  Created by apple on 15/7/28.
//  Copyright (c) 2015年 CloudRoom. All rights reserved.
//

#import "AppleAPIViewController.h"
#import "UIButton+K.h"

typedef NS_ENUM(NSInteger, AppleAPIViewType)
{
    AppleAPIViewTypeEncodeBtn = 100,
    AppleAPIViewTypeDecodeBtn,
};

@interface AppleAPIViewController ()

@property (weak, nonatomic) IBOutlet UITextField *contentTextField;

@property (weak, nonatomic) IBOutlet UILabel *encodeLabel;

@property (weak, nonatomic) IBOutlet UILabel *decodeLabel;

@property (weak, nonatomic) IBOutlet UIButton *encodeBtn;

@property (weak, nonatomic) IBOutlet UIButton *decodeBtn;

- (IBAction)btnClickForAppleAPIViewController:(UIButton *)sender;

@end

@implementation AppleAPIViewController
#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self setupUIScreenForMyViewController];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnClickForAppleAPIViewController:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    
    switch (tag)
    {
        case AppleAPIViewTypeEncodeBtn: // encode
        {
            [self testEncodeForAppleAPI];
            
            break;
        }
        case AppleAPIViewTypeDecodeBtn: // decode
        {
            [self testDecodeForAppleAPI];
            
            break;
        }
        default:
            break;
    }
}

#pragma mark - private methods
- (void)setupUIScreenForMyViewController
{
    [self.encodeBtn initWithCallButtonBackgroundWithNormalImage:@"bottom_button_color_n" highlightedImage:@"bottom_button_color_h" selectedImage:nil disabledImage:nil];
    
    [self.decodeBtn initWithCallButtonBackgroundWithNormalImage:@"bottom_button_color_n" highlightedImage:@"bottom_button_color_h" selectedImage:nil disabledImage:nil];
}

- (void)testEncodeForAppleAPI
{
    NSString *initString = self.contentTextField.text;
    
    NSData *initData = [initString dataUsingEncoding:NSUTF8StringEncoding];
    
    NSString *encodeString = [initData base64EncodedStringWithOptions:0];
    
    [self.encodeLabel setText:encodeString];
}

- (void)testDecodeForAppleAPI
{
    NSString *encodeString = self.encodeLabel.text;
    
    NSData *decodeData = [[NSData alloc] initWithBase64EncodedString:encodeString options:0];
    
    NSString *decodeString = [[NSString alloc] initWithData:decodeData encoding:NSUTF8StringEncoding];
    
    [self.decodeLabel setText:decodeString];
}

#pragma mark - reload methods
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}

@end

/*
 typedef NS_OPTIONS(NSUInteger, NSDataBase64EncodingOptions) {
 // Use zero or one of the following to control the maximum line length after which a line ending is inserted. No line endings are inserted by default.
 NSDataBase64Encoding64CharacterLineLength = 1UL << 0,
 NSDataBase64Encoding76CharacterLineLength = 1UL << 1,
 
 // Use zero or more of the following to specify which kind of line ending is inserted. The default line ending is CR LF.
 NSDataBase64EncodingEndLineWithCarriageReturn = 1UL << 4,
 NSDataBase64EncodingEndLineWithLineFeed = 1UL << 5,
 
 } NS_ENUM_AVAILABLE(10_9, 7_0);
 */
