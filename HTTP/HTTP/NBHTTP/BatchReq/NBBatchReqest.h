//
//  NBBatchReqest.h
//  HTTP
//
//  Created by  tianlei on 2017/7/20.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NBBaseRequest;
@class NBBatchReqest;


typedef void(^NBBatchRequestCompletionBlock)( NBBatchReqest *batchRequest);


@interface NBBatchReqest : NSObject

- (void)addReqFromArray:(NSArray <NBBaseRequest *> *)reqArray;

@property (nonatomic, copy, readonly) NSArray <NBBaseRequest *> *reqArray;

- (void)start;

- (void)startWithSuccess:(NBBatchRequestCompletionBlock)success
                 failure:(NBBatchRequestCompletionBlock)failure;

@end
