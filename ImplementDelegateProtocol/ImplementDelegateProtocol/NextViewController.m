//
//  NextViewController.m
//  ImplementDelegateProtocol
//
//  Created by Carlos Santiago Cruz on 6/1/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "NextViewController.h"

@interface NextViewController ()
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@end

@implementation NextViewController
{
    NSInteger counter;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = UIColor.whiteColor;
}

- (IBAction)backButtonTapped:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)buttonTapped:(id)sender {
    counter = counter+1;
    if ([self.delegate respondsToSelector:@selector(buttonDidTapped:)])
    {
        [self.delegate buttonDidTapped:counter];
    }
}

@end
