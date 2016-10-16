//
//  NSArray+Blocks.m
//  MemoryManagingProj
//
//  Created by Gulia_Is on 16.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import "NSArray+Blocks.h"

@implementation NSArray (Blocks)
-(void)getUniqueArr:(NSArray *)someArr andCompletionBlock:(void(^)(NSArray *finalArr))completionBlock{
    NSArray *firstArr = [NSArray arrayWithArray:self];
    NSArray *secondArr = [NSArray arrayWithArray:someArr];
    NSMutableArray *uniqueArr = [NSMutableArray new];
    
    for (int i = 0; i < firstArr.count; i++){
        for (int j = 0; j < secondArr.count; j++){
            if([firstArr[i] isEqual:secondArr[j]]){
                break;
            } else [uniqueArr addObject:firstArr[i]];
        }
    }
    for (int j = 0; j < secondArr.count; j++){
        for (int i = 0; i < firstArr.count; i++){
            if([secondArr[j] isEqual:firstArr[i]]){
                break;
            } else [uniqueArr addObject:secondArr[j]];
        }
    }
    completionBlock(uniqueArr);
}

-(void)moveElementOfArr:(int)fromIndex andReturnArr:(int)toIndex andCompletionBlock:(void(^)(NSArray *finalArr))completionBlock{
    if(fromIndex<self.count&toIndex<self.count){
        NSMutableArray *mutableCopy = [self mutableCopy];
        [mutableCopy removeObjectAtIndex:fromIndex];
        [mutableCopy insertObject:self[fromIndex] atIndex:toIndex];
        completionBlock(mutableCopy);
    } else {
        NSError *error = [NSError errorWithDomain:@"The requested value of index greater than the number of elements in the array" code:1 userInfo:nil];
        NSLog(@"%@", error);
    }
}
+(void)testingOfArr:(NSArray *)someArr withSuccesBlock:(void(^)(NSArray *finalArr))successBlock andFailureBlock:(void(^)(NSError *error))failureBlock{
    if (!someArr){
        NSError *error = [NSError errorWithDomain:@"Array is nil" code:1 userInfo:nil];
        failureBlock(error);
        return;
    }
    //    NSLog(@"Number of elements in array are %lu", (unsigned long)someArr.count);
    //    for (int i = 0; i < someArr.count; i++){
    //    NSLog(@"%i:%lu", i, (unsigned long)someArr.count);
    //    }
    successBlock(someArr);
}

@end
