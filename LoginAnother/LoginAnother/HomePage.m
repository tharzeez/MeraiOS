//
//  LoginPage.m
//  LoginAnother
//
//  Created by Tharzeez on 7/11/17.
//  Copyright © 2017 Tharzeez. All rights reserved.
//

#import "HomePage.h"

@interface LoginPage ()
@property (weak, nonatomic) IBOutlet UIButton *logoutButton;
@property (weak, nonatomic) IBOutlet UIButton *RetreiveButton;



@end



@implementation LoginPage
@synthesize name, userLAbel;
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setNavigationBarHidden:YES];
    // Do any additional setup after loading the view.
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    name=[defaults objectForKey:@"username"];
   // UINavigationController *navigationController=self.navigationController;
  //  NSLog(@"Views in hierarchy: %@", [navigationController viewControllers]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)logoutAction:(id)sender {
//    NSString *appDomain = [[NSBundle mainBundle] bundleIdentifier];
//    NSLog(@"%@",appDomain);
//    [[NSUserDefaults standardUserDefaults] removePersistentDomainForName:appDomain];
    NSLog(@"lol");
    UINavigationController *navigationController=self.navigationController;
    NSLog(@"Views in hierarchy: %@", [navigationController viewControllers]);
    [navigationController popToRootViewControllerAnimated:YES ];
    
    
}
- (IBAction)retreiveAction:(id)sender {
    NSUserDefaults * defs=[NSUserDefaults standardUserDefaults];
    NSString *username=[defs objectForKey:@"username"];
    userLAbel.text=username;
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
