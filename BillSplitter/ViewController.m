//
//  ViewController.m
//  BillSplitter
//
//  Created by Marc Maguire on 2017-05-13.
//  Copyright © 2017 Marc Maguire. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UILabel *label;
@property (weak, nonatomic) IBOutlet UILabel *sliderLabel;



@end

@implementation ViewController

//split the bill evenly between people at restaurant
//need to know amount of people, total bill amount, tip amount, tip percent


- (void)viewDidLoad {
    [super viewDidLoad];
    self.slider.minimumValue = 2.0;
    self.slider.maximumValue = 8.0;
    
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(calculateSplitAmount:) name:UITextFieldTextDidChangeNotification object:nil];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)calculateSplitAmount:(id)sender {
    
    NSNumberFormatter *formatter = [[NSNumberFormatter alloc]init];
    [formatter setNumberStyle:NSNumberFormatterDecimalStyle];
    [formatter setMaximumFractionDigits:2];
    
    NSDecimalNumber *billAmount = [[NSDecimalNumber alloc]initWithString:self.textField.text];
    NSDecimalNumber *peopleToDivide = [[NSDecimalNumber alloc]initWithFloat:self.slider.value];
    NSDecimalNumber *totalBill = [billAmount decimalNumberByDividingBy:peopleToDivide];

    
    self.label.text = [NSString stringWithFormat:@"Cost per person: $%@.",[formatter stringFromNumber:totalBill]];
    
    
}

- (IBAction)sliderValueChanged:(UISlider *)sender {
    if (sender.value > 2.0 && sender.value < 2.49){
        sender.value = 2;
    } else if ((sender.value > 2.5 && sender.value < 3.0) || (sender.value > 3.0  && sender.value < 3.49)) {
        sender.value = 3.0;
    } else if ((sender.value > 3.5 && sender.value < 4.0) || (sender.value > 4.0  && sender.value < 4.49)) {
        sender.value = 4.0;
    } else if ((sender.value > 4.5 && sender.value < 5.0) || (sender.value > 5.0  && sender.value < 5.49)) {
        sender.value = 5.0;
    } else if ((sender.value > 5.5 && sender.value < 6.0) || (sender.value > 6.0  && sender.value < 6.49)) {
        sender.value = 6.0;
    } else if ((sender.value > 6.5 && sender.value < 7.0) || (sender.value > 7.0  && sender.value < 7.49)) {
        sender.value = 7.0;
    } else if ((sender.value > 7.5 && sender.value < 8.0) || (sender.value > 8.0  && sender.value < 8.49)) {
        sender.value = 8.0;
    }
    self.sliderLabel.text = [NSString stringWithFormat:@"Number of people: %.0f",sender.value];
}

@end
