//
//  ViewController.m
//  LoginAnother
//
//  Created by Tharzeez on 7/10/17.
//  Copyright © 2017 Tharzeez. All rights reserved.
//

#import "ViewController.h"
#import "HomePage.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *emailField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UIButton *forgotButton;
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UIButton *regButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.

    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)forgotAction:(id)sender {
    NSLog(@"forgotButton pressed");
    [self performSegueWithIdentifier:@"forgotSegue" sender:nil];
    
    
}

- (IBAction)loginAction:(id)sender {
    NSLog(@"loginButton pressed");
    NSString *username= self.emailField.text;
    NSString *pass=self.passwordField.text;
    
    
    
    if ([username isEqualToString:@""] || [pass isEqualToString:@""] ){
        
        UIAlertController *loginerr =[UIAlertController alertControllerWithTitle:@"Empty Fields" message:@"Please fill all the details" preferredStyle:UIAlertControllerStyleAlert];
        UIAlertAction *okAction=[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
        [loginerr addAction:okAction];
        [self presentViewController:loginerr animated:YES completion:nil];
        
    }else{
        
        NSString *urlstr=@"http://demo0294613.mockable.io/action.php";
        NSURL *url =[[NSURL alloc]initWithString:urlstr];
        NSString *data=[NSString stringWithFormat:@"test=Message&this=isNotReal"];
        NSData *postData=[data dataUsingEncoding:NSASCIIStringEncoding];
        NSString *postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
        
        NSMutableURLRequest *request=[[NSMutableURLRequest alloc]init];
        [request setURL:url];
        
        [request setHTTPMethod:@"POST"];
        [request setValue:postLength forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:postData];
        
        NSURLSession *session =[NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        [[session dataTaskWithRequest:request completionHandler:^(NSData * data, NSURLResponse *response, NSError * error) {
            NSString *reply=[[NSString alloc]initWithData:data encoding:NSASCIIStringEncoding];
            NSLog(@"%@",reply);
        }]resume];

    
        NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
        [defaults setObject:username forKey:@"username"];
        [defaults setObject:pass forKey:@"password"];
        [defaults synchronize];
        NSLog(@"Data Saved");
        [self performSegueWithIdentifier:@"login" sender:nil];
        
        
    
    }
        
    
    
}

 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
     
     if ([[segue identifier]  isEqual: @"login"]) {
         LoginPage * tmpVC ;      // =[segue destinationViewController];
         tmpVC.userLAbel.text = _emailField.text;
         NSLog(@"%@",tmpVC.userLAbel.text);
     }
 }



    
    

- (IBAction)regAction:(id)sender {
    
    
    
    
    
    
    
    NSLog(@"regButton pressed");
}


@end
