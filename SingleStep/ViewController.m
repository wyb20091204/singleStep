//
//  ViewController.m
//  SingleStep
//
//  Created by 一波 on 2016/11/17.
//  Copyright © 2016年 一波. All rights reserved.
//

#import "ViewController.h"
#import "HealthKitManager.h"

#define ISLocalString(str) NSLocalizedString(str, @"")


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UILabel *stepLabel;

@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"Version = %.2f",[[[UIDevice currentDevice] systemVersion] doubleValue]) ;
    NSLog(@"\n%@",NSHomeDirectory());
    
       // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)stepClicked:(id)sender {
    HealthKitManager *manage = [HealthKitManager shareHealthManager];
    [manage authorizeHealthKit:^(BOOL success, NSError *error) {
        
        if (success) {
            NSLog(@"step   success");
            [manage getStepCount:^(double value, NSError *error) {
                NSLog(@"1count-->%.0f", value);
                NSLog(@"1error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.stepLabel.text = [NSString stringWithFormat:@"步数：%.0f步", value];
                });
                
            }];
        }
        else {
            NSLog(@"fail");
        }
    }];
    
    
    
    
}

- (IBAction)distanceClicked:(id)sender {
    HealthKitManager *manager = [HealthKitManager shareHealthManager];
    [manager authorizeHealthKit:^(BOOL success, NSError *error) {
       
        if (success) {
            NSLog(@"distance success");
            [manager getDistance:^(double value, NSError *error) {
                NSLog(@"2count-->%.2f", value);
                NSLog(@"2error-->%@", error.localizedDescription);
                dispatch_async(dispatch_get_main_queue(), ^{
                    self.distanceLabel.text = [NSString stringWithFormat:@"公里数：%.2f公里", value];
                });

            }];
        }
    }];
    
}

- (IBAction)addDefff:(id)sender {
    
    [[NSUserDefaults standardUserDefaults] setObject:@"1" forKey:@"YI"];
    [[NSUserDefaults standardUserDefaults] setObject:@"2" forKey:@"ER"];
    [[NSUserDefaults standardUserDefaults] setObject:@"3" forKey:@"SAN"];
    [[NSUserDefaults standardUserDefaults] setObject:@"4" forKey:@"SI"];
    
}

- (IBAction)resetDeffff:(id)sender {
    
    [self resetDefaults];
    
}


- (void)resetDefaults {
    NSUserDefaults * defs = [NSUserDefaults standardUserDefaults];
    NSDictionary * dict = [defs dictionaryRepresentation];
    for (id key in dict) {
        [defs removeObjectForKey:key];
    }
    [defs synchronize];
}

- (IBAction)alertView:(id)sender {
    
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:ISLocalString(@"alertTitle") message:ISLocalString(@"alertMessage") preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction *ok = [UIAlertAction actionWithTitle:ISLocalString(@"alertOk") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"oooookkkkkkk");
    }];
    UIAlertAction *other = [UIAlertAction actionWithTitle:ISLocalString(@"alertOther") style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"oooooothereeeeeeee");
    }];
    [alert addAction:ok];
    [alert addAction:other];
    [self presentViewController:alert animated:YES completion:nil];
    
    
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
