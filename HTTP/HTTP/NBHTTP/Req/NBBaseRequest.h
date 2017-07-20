//
//  NBBaseRequest.h
//  HTTP
//
//  Created by  tianlei on 2017/7/11.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import <Foundation/Foundation.h>

@class NBBaseRequest;

typedef NS_ENUM(NSInteger, NBRequestMethod) {
    
    NBRequestMethodGET = 0,
    NBRequestMethodPOST = 1
    
};

typedef void(^NBRequestCompletionBlock)(__kindof NBBaseRequest *request);

@interface NBBaseRequest : NSObject

//请求
@property (nonatomic, assign) NBRequestMethod HTTPMethod;
@property (nonatomic, assign) BOOL ignoreCache;
@property (nonatomic, copy) NSString *URLString;
@property (nonatomic, strong) NSDictionary <NSString *,id> *parameters;

//响应
@property (nonatomic, strong) NSURLSessionDataTask *task;
@property (nonatomic, strong) id responseObject;
@property (nonatomic, strong) NSError *error;

/**
 成功回调
 */
@property (nonatomic, copy) NBRequestCompletionBlock success;

/**
 失败回调
 */
@property (nonatomic, copy) NBRequestCompletionBlock failure;


/**
 开始请求，并设置请求和失败回调
 @param success 成功回调
 @param failure 失败回调
 */
- (void)startWithSuccess:(NBRequestCompletionBlock)success
                 failure:(NBRequestCompletionBlock)failure;


- (void)setSuccess:(NBRequestCompletionBlock)success
           failure:(NBRequestCompletionBlock)failure;


/**
 请求开始
 */
- (void)start;


/**
 block 至为nil
 */
- (void)clearCompletionBlock;


/**
 子类继承进行参数转化
 */
- (NSDictionary <NSString *,NSString *> *)convertParameters;


/**
 缓存数据
 */
- (void)saveCache;

/**
 有缓存 YES ELSE NO
 */
- (BOOL)checkCache;

/**
 读取缓存
 @return 缓存;
 */
- (id)getCache;


@end
