//
//  RegistrationViewController.m
//  LoginAnother
//
//  Created by Tharzeez on 7/13/17.
//  Copyright © 2017 Tharzeez. All rights reserved.
//

#import "RegistrationViewController.h"

@interface RegistrationViewController ()
@property (weak, nonatomic) IBOutlet UITextField *fName;
@property (weak, nonatomic) IBOutlet UITextField *lastName;
@property (weak, nonatomic) IBOutlet UISegmentedControl *genderSegment;
@property (weak, nonatomic) IBOutlet UITextField *DOB;
@property (weak, nonatomic) IBOutlet UITextField *username;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *confirmPassword;

@end

@implementation RegistrationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.navigationController setNavigationBarHidden:NO];
    [_genderSegment removeAllSegments];
    [_genderSegment insertSegmentWithTitle:@"Male" atIndex:0 animated:YES];
    [_genderSegment insertSegmentWithTitle:@"Female" atIndex:1 animated:YES];
    [_genderSegment insertSegmentWithTitle:@"Others" atIndex:2 animated:YES];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)registerAction:(id)sender {
    
    fname=_fName.text;
    lName=_lastName.text;
    dob=_DOB.text;
    gender=_genderSegment.selectedSegmentIndex;
    email=_username.text;
    pass=_password.text;
    confirmPass=_confirmPassword.text;
    
    
    if( [fname isEqualToString:@""] || [lName isEqualToString:@""] || [dob isEqualToString:@""] ||
       [email isEqualToString:@""] || [pass isEqualToString:@""] || [confirmPass isEqualToString:@""] ||
       (gender !=NULL) ){
        
        UIAlertController *alert =[UIAlertController alertControllerWithTitle:@"Empty Fields" message:@"Please fill in all the fields" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil ];
        [alert addAction:action];
        [self presentViewController:alert animated:YES completion:nil];
        
    }else if ( ![pass isEqualToString:confirmPass]){
        
        UIAlertController *passErr=[UIAlertController alertControllerWithTitle:@"Password Mismatch" message:@"" preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *action =[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [passErr addAction:action];
        [self presentViewController:passErr animated:YES completion:nil];
        
    }else{
        NSString *name=@"Tharzeez";
        NSData *postData=[name dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
        NSString *postLength =[NSString stringWithFormat:@"%lu",(unsigned long)[postData length]];
        NSURL *url=[NSURL URLWithString:@"http://demo1537300.mockable.io/mynew"];
        NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
        [request setURL:url];
        [request setHTTPMethod:@"POST"];
        [request setHTTPBody:postData];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        
        
        NSURLSession *session=[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        
        [[session dataTaskWithURL:url completionHandler:^(NSData *  data, NSURLResponse *  response, NSError *  error) {
            NSString *reply =[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"%@",reply);
        
        }]resume];
        
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
