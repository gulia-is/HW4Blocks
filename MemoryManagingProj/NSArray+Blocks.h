//
//  NSArray+Blocks.h
//  MemoryManagingProj
//
//  Created by Gulia_Is on 16.10.16.
//  Copyright © 2016 com.ildar.itis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Blocks)
-(void)getUniqueArr:(NSArray *)someArr andCompletionBlock:(void(^)(NSArray *finalArr))completionBlock;
-(void)moveElementOfArr:(int)fromIndex andReturnArr:(int)toIndex andCompletionBlock:(void(^)(NSArray *finalArr))completionBlock;
+(void)testingOfArr:(NSArray *)someArr withSuccesBlock:(void(^)(NSArray *finalArr))successBlock andFailureBlock:(void(^)(NSError *error))failureBlock;
@end
