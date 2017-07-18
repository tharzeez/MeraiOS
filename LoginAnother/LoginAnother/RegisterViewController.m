//
//  RegisterViewController.m
//  LoginAnother
//
//  Created by Tharzeez on 7/14/17.
//  Copyright © 2017 Tharzeez. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UITextField *Date;
@property (weak, nonatomic) IBOutlet UITextField *month;
@property (weak, nonatomic) IBOutlet UITextField *year;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;
@property (weak, nonatomic) IBOutlet UITextField *mobNum;
@property (weak, nonatomic) IBOutlet UITextField *location;
@property (weak, nonatomic) IBOutlet UIButton *reButton;
@property (weak, nonatomic) IBOutlet UILabel *passwordMismatchLabel;
@property (weak, nonatomic) IBOutlet UILabel *validNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLAbel;

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [_genderSegment removeAllSegments];
    [_genderSegment insertSegmentWithTitle:@"Male" atIndex:0 animated:YES];
    [_genderSegment insertSegmentWithTitle:@"Female" atIndex:1 animated:YES];
    [_genderSegment insertSegmentWithTitle:@"Others" atIndex:2 animated:YES];
    
    self.password.tag=5;
    self.confirmPassword.tag=1;
    self.mobNum.tag=2;
    self.location.tag=3;
    self.userName.tag=4;
    self.fName.tag=6;
    self.lastName.tag=7;
    self.Date.tag=8;
    self.month.tag=9;
    self.year.tag=10;
    
    
//    NSLog(@"%@",self.superview);
    
    
    
}

//
//-(BOOL) textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
//            NSInteger length=10;
//            if(_mobNum.text.length>=length && [string length] > range.length)
//                return NO;
//            else
//                return YES;
//    }

//-(BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string {
//    //limit the size :
//    int limit = 5;
//    return !([textField.text length]>limit && [string length] > range.length);
//}



- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{

if(textField.tag==2){
    {
        NSInteger max_len=10;
        if (textField.text.length >= max_len && range.length == 0)
        {
            //NSLog(@"%lu%lu",(unsigned long)range.length,(unsigned long)range.location);
            NSLog(@"lol");
            return NO; // return NO to not change text
        }
        else
        {
            NSLog(@"len is %lu",(unsigned long)range.length);
            NSLog(@"loc is %lu",(unsigned long)range.location);
            return YES;
        }
    }
}else if(textField.tag==8){
    NSInteger max_len=2;
    if(textField.text.length >= max_len && range.length ==0){
        NSLog(@"lol");
        return NO;
    }else {
        NSLog(@"lmao");
        return YES;
    }
    
    
}else if(textField.tag ==10){
    NSInteger max_len=4;
    return !(textField.text.length >=max_len && range.length==0);
}
else if(textField.tag==6 || textField.tag ==7 ){
            NSInteger max_len=32;
            if (textField.text.length >= max_len && range.length == 0){
                //NSLog(@"%lu%lu",(unsigned long)range.length,(unsigned long)range.location);
                NSLog(@"lol");
                return NO; // return NO to not change text
            }
            else
            {
                NSLog(@"len is %lu",(unsigned long)range.length);
                NSLog(@"loc is %lu",(unsigned long)range.location);
                return YES;
            }
    

}
else
    return YES;
}


-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    [self.fName resignFirstResponder];
    [self.lastName resignFirstResponder];
    [self.Date resignFirstResponder];       [self.month resignFirstResponder];
    [self.year resignFirstResponder];
    [self.userName resignFirstResponder];
    [self.password resignFirstResponder];
    [self.confirmPassword resignFirstResponder];
    [self.mobNum resignFirstResponder];
    [self.location resignFirstResponder];
    return YES;
    
}

-(void) textFieldDidBeginEditing:(UITextField *)textField {
   if( textField.tag==1 || textField.tag==2 || textField.tag==3)
    [self moveContents:textField up:YES];
}
-(void)textFieldDidEndEditing:(UITextField *)textField{
   if( textField.tag==1 || textField.tag==2 || textField.tag==3)
    [self moveContents:textField up:NO];

    if(textField.tag==6 ){
        NSString *pattern=@"^[A-Za-z]*$";
        NSRegularExpression *expression= [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSTextCheckingResult *check=[expression firstMatchInString:_fName.text options:0 range:NSMakeRange(0, self.fName.text.length)];
        if(check){
            _validNameLabel.text=@"";
        }else{
            _validNameLabel.text=@"Enter a valid Name";
        }
}
    
    
    if(textField.tag==7){
        NSString *pattern=@"^[A-Za-z]*$";
        NSRegularExpression *expression= [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSTextCheckingResult *check=[expression firstMatchInString:_lastName.text options:0 range:NSMakeRange(0, self.lastName.text.length)];
        if(check){
            _validNameLabel.text=@"";
        }else{
            _validNameLabel.text=@"Enter a valid Name";
        }

    }
    if( textField.tag==4){
        NSString *emailid=self.userName.text;
        NSString *pattern=@"^[A-Z0-9a-z._]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}$";
        NSRegularExpression *regex= [NSRegularExpression regularExpressionWithPattern:pattern options:NSRegularExpressionCaseInsensitive error:nil];
        NSTextCheckingResult *match=[regex firstMatchInString:emailid options:0 range:NSMakeRange(0, [emailid length])];
   //     NSLog(@"%d",match);
        if(match){
            NSLog(@"yaay");
                   }else{
            NSLog(@"naah");
                       UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"Not a valid Email" message:@"Please enter an aleeternate one" preferredStyle:UIAlertControllerStyleAlert];
                       UIAlertAction *action =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
                       [alert addAction:action];
                       [self presentViewController:alert animated:YES completion:nil];
                       

        }
        
    }
    
    if(textField.tag==1){
        if(![_password.text isEqualToString:_confirmPassword.text]){
            self.passwordMismatchLabel.text=@"Password entered doesnt match";
        }else{
            self.passwordMismatchLabel.text=@"";
        }
    }
}



-(void)moveContents:(UITextField *)textField up:(BOOL)up{
    const int movementDistance=-130;
    const float movementDuration=0.3f;
    
    int movement=( up ? movementDistance : -movementDistance);
    [UIView beginAnimations:@"moveContents" context:nil];
    [UIView setAnimationBeginsFromCurrentState:YES];
    
    self.view.frame =CGRectOffset(self.view.frame, 0, movement);
    [UIView commitAnimations];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)regButtonAction:(id)sender {
    NSLog(@"RegButonn pressed");
    fname       =   self.fName.text;
    lName       =   self.lastName.text;
//  date        =   (NSInteger)self.Date.text;
//  mon         =   (NSInteger)self.month.text;
//  yr          =   (NSInteger)self.year.text;
    gender      =   (NSInteger)self.genderSegment.selectedSegmentIndex;
    email       =   self.userName.text;
    pass        =   self.password.text;
    confirmPass =   self.confirmPassword.text;
    mobileNum   =   self.mobNum.text;
    country     =   self.location.text;
    datestr     =   self.Date.text;
    monstr      =   self.month.text;
    yrstr       =   self.year.text;
    genderstr   =   [NSString stringWithFormat:@"%ld",(long)gender];
    
    NSLog(@"%ld",(long)gender);
    NSLog(@"%@",monstr);
    NSLog(@"%@",genderstr);
    
    if( [fname isEqualToString:@""] || [lName isEqualToString:@""]  || [datestr isEqualToString:@""] ||[monstr isEqualToString:@""] || [yrstr isEqualToString:@""] || [email isEqualToString:@""] || [pass isEqualToString:@""] || [confirmPass isEqualToString:@""]  || [genderstr isEqualToString:@""]  || [mobileNum isEqualToString:@""] ||[country isEqualToString:@""]   ) {
        
            UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Empty Fields" message:@"Please fill in all the fields" preferredStyle:UIAlertControllerStyleAlert];
        
            UIAlertAction *action=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil ];
            [alert addAction:action];
            [self presentViewController:alert animated:YES completion:nil];
        
    }else if ( ![pass isEqualToString:confirmPass]){
        
            UIAlertController *passErr=[UIAlertController alertControllerWithTitle:@"Password Mismatch" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
            UIAlertAction *action =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
            [passErr addAction:action];
            [self presentViewController:passErr animated:YES completion:nil];
    }
    else {
            NSLog(@"Lol");
            [self performSegueWithIdentifier:@"registerFinal" sender:nil];
        
    }
        
    
    
    
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
