//
//  ViewController.m
//  ImplementDelegateProtocol
//
//  Created by Carlos Santiago Cruz on 6/1/19.
//  Copyright © 2019 Carlos Santiago Cruz. All rights reserved.
//

#import "InitialViewController.h"
#import "NextViewController.h"

@interface InitialViewController () <NextViewControllerDelegate, UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *acceptButton;
@property (weak, nonatomic) IBOutlet UILabel *infoLabel;
@property (strong, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *button;
@end

@implementation InitialViewController
{
    NextViewController *nextViewController;
}

-(id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if(self)
    {
        _textField = [[UITextField alloc] init];
        return self;
        
    }
    return nil;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.blueColor;
    self.infoLabel.text = @"wait for the tap on the second view";
    
    [self returnNSArray];
    [self returnNSArrayFromNSMutableArray];
    
    [self createSurnameTextField];
    _textField.delegate = self;
}

-(void)createSurnameTextField
{
    _textField.frame = CGRectMake(self.view.frame.size.width/3, 300, 150, 30);
    _textField.borderStyle = UITextBorderStyleRoundedRect;
    _textField.clearButtonMode = UITextFieldViewModeWhileEditing;
    _textField.placeholder = @"Inserte surname";
    [self.view addSubview:_textField];
}

- (IBAction)acceptButtonTapped:(id)sender
{   // method always displays the view controller modally.
    // The view controller that calls this method might not ultimately handle the presentation but the presentation is always modal.
    // This method adapts the presentation style for horizontally compact environments.
    
    nextViewController = [[NextViewController alloc] init];
    nextViewController.delegate = self;
    [self presentViewController:nextViewController animated:NO completion:nil];
    
}
-(void)buttonDidTapped:(NSInteger)times
{
    NSString *infoString = [NSString stringWithFormat:@"the button on nextViewController was tapped: %ld times", (long)times];
    _infoLabel.text = infoString;
}

-(NSArray *)returnNSArray
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    mutableArray[0] = @"primer elemento";
    mutableArray[1] = @"segundo elemento";
    mutableArray[2] = @"tercer elemento";
    NSArray *newArray = [[NSArray alloc] initWithArray:mutableArray];
    NSLog(@"%@", newArray);
    NSLog(@"It works on Xcode 10!");
    return  newArray;
}

-(NSArray *)returnNSArrayFromNSMutableArray
{
    NSMutableArray *mutableArray = [[NSMutableArray alloc] init];
    mutableArray[0] = @"primer elemento";
    mutableArray[1] = @"segundo elemento";
    mutableArray[2] = @"tercer elemento";
    NSLog(@"It works returning directly the NSMutableArray instance %@", mutableArray);
    return mutableArray;
}
- (IBAction)ChangeInfoLabel:(id)sender {
    _infoLabel.hidden = NO;
    NSString *message = [[NSString alloc] initWithFormat:@"Hello my name is: %@", _textField.text ];
    _infoLabel.text = message;
}

- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField
{
    NSLog(@"Editing is about to begin");
    _infoLabel.hidden = YES;
    return YES;
}

- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    _textField.backgroundColor = [UIColor yellowColor];
    NSLog(@"Editing has began");
}

-(BOOL)textFieldShouldEndEditing:(UITextField *)textField
{
    NSLog(@"Editing is about to end");
    _textField.backgroundColor = [UIColor whiteColor];
    return YES;
}

- (void)textFieldDidEndEditing:(UITextField *)textField
{
    NSLog(@"Editing Ended");
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [textField resignFirstResponder];
    self.view.backgroundColor = [UIColor yellowColor];
    _infoLabel.hidden = NO;
    return YES;
}

- (BOOL)textFieldShouldClear:(UITextField *)textField
{
    NSLog(@"Clear buttton pressed");
    self.view.backgroundColor = [UIColor redColor];
    return YES;
}

-(IBAction)userDoneEnteringText:(id)sender
{
    NSLog(@" what action ?");
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Tocaste view from self");
    [self.textField resignFirstResponder];
    self.view.backgroundColor = [UIColor blackColor];
}

- (void)viewDidDisappear:(BOOL)animated
{
    self.view.backgroundColor = [UIColor whiteColor];
    NSLog(@"The view did disappear");
}

@end
