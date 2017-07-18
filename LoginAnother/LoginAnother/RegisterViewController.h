//
//  RegisterViewController.h
//  LoginAnother
//
//  Created by Tharzeez on 7/14/17.
//  Copyright © 2017 Tharzeez. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegisterViewController : UIViewController <UITextFieldDelegate>
{
    NSString *fname;
    NSString *lName;
//    NSInteger date;
//    NSInteger mon;
//    NSInteger yr;
    NSInteger gender;
    NSString *email;
    NSString *pass;
    NSString *confirmPass;
    NSString * mobileNum;
    NSString * country;
    NSString *datestr;
    NSString *monstr;
    NSString  *yrstr;
    NSString *genderstr;
   
}
-(void) moveContents:(UITextField *)textField up:(BOOL)up;


@end
