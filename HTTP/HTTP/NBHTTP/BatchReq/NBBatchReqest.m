//
//  NBBatchReqest.m
//  HTTP
//
//  Created by  tianlei on 2017/7/20.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import "NBBatchReqest.h"
#import "NBBaseRequest.h"
#import "NBNetworkAgent.h"

@implementation NBBatchReqest {

    NSMutableArray <NBBaseRequest *>*_privateReqArray;

}

- (void)dealloc {

    
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        
        _reqArray = [[NSMutableArray alloc] init];
    }
    return self;
}


- (void)addReqFromArray:(NSArray <NBBaseRequest *> *)reqArray {


    [_privateReqArray addObjectsFromArray:reqArray];

}

- (void)addReq:(NBBaseRequest *)req {



}

- (void)startWithSuccess:(NBBatchRequestCompletionBlock)success failure:(NBBatchRequestCompletionBlock)failure {

    
    [_privateReqArray enumerateObjectsUsingBlock:^(NBBaseRequest * _Nonnull req, NSUInteger idx, BOOL * _Nonnull stop) {
        
        //
        [req startWithSuccess:^(__kindof NBBaseRequest *request) {
            
            
        } failure:^(__kindof NBBaseRequest *request) {
            
            
            
        }];
        
    }];
    
    

}



- (void)complectionWith:(NSArray <NBBaseRequest *> *)reqArray success:(void(^)())success failure:(void(^)())failure {

    if (1) {
        //
        if (success) {
            success(_reqArray);
        }
        
    } else {
    
        if (failure) {
            
            failure();
            
        }
    
    }
    

}

@end
