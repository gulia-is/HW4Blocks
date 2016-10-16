//
//  ViewController.m
//  MemoryManagingProj
//
//  Created by Ildar Zalyalov on 01.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "ViewController.h"
#import "NSArray+Blocks.h"

@interface ViewController ()
@property(strong, nonatomic) NSArray *myFirstArr;
@property(strong, nonatomic) NSArray *mySecondArr;
@property(strong, atomic) NSString *firstString;
@property(strong, atomic) NSMutableString *firstMutableString;
@property(readonly) NSString *onlyReadableString;
@property (nonatomic, assign) int *value;
@end

@implementation ViewController

-(NSString *)getFirstString{
    return _firstString;
}

-(void)setFirstNewString:(NSString *)firstNewString{
    @synchronized (self) {
        _firstString = firstNewString;
    }
}

-(NSString *)getFirstMutableString{
    return _firstMutableString;
}

-(void)setFirstNewMutableString:(NSMutableString*)firstMutableString{
    _firstMutableString = [firstMutableString copy];
}

-(int *)getIntValue{
    return _value;
}

- (void)setIntValue:(int *)newValue {
    _value = (newValue < 0) ? 0 : newValue;
}

-(NSArray *)myFirstArr{
    if (!_myFirstArr){
        _myFirstArr = @[@"One", @"Two", @"Three", @"Four", @"Five"];
    }
    return _myFirstArr;
}

-(NSArray *)mySecondArr{
    if (!_mySecondArr){
        _mySecondArr = @[@"One", @"Three", @"Seven", @"Six", @"Ten"];
    }
    return _mySecondArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.myFirstArr getUniqueArr:self.mySecondArr andCompletionBlock:^(NSArray *finalArr){
        NSLog(@"%@", finalArr);
    }];
    [self.myFirstArr moveElementOfArr:1 andReturnArr:3 andCompletionBlock:^(NSArray *finalArr) {
        NSLog(@"%@", finalArr);
    }];
    [NSArray testingOfArr:_myFirstArr withSuccesBlock:^(NSArray *finalArr) {
        NSString *stringToLog;
        for (int i = 0; i < finalArr.count; i++){
            stringToLog = [NSString stringWithFormat:@"%i:%@", i, finalArr[i]];
        } NSLog(@"@%", stringToLog);
    } andFailureBlock:^(NSError *error) {
        NSLog(@"%@", error);
    }]; 
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
