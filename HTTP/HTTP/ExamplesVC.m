//
//  ExamplesVC.m
//  HTTP
//
//  Created by  tianlei on 2017/9/6.
//  Copyright © 2017年  tianlei. All rights reserved.
//

#import "ExamplesVC.h"
#import "NBNetwork.h"
#import "RespHandler.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"

@interface ExamplesVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <NSString *> *nameArray;
@property (nonatomic, strong) RespHandler *respHandler;

@end

@implementation ExamplesVC

- (RespHandler *)respHandler {

    if (!_respHandler) {
        _respHandler = [[RespHandler alloc] init];
    }
    
    return _respHandler;

}

- (void)viewDidLayoutSubviews {
    
    self.tableView.frame = self.view.bounds;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
   
    UITableView *tv = [[UITableView alloc] initWithFrame:CGRectZero style:UITableViewStylePlain];
    tv.delegate = self;
    tv.dataSource = self;
    [self.view addSubview:tv];
    self.tableView = tv;
    self.tableView.contentInset = UIEdgeInsetsMake(30, 0, 0, 0);
    
    self.nameArray = [[NSMutableArray alloc] init];
    
    [self.nameArray addObject:@"CD 请求"];
    [self.nameArray addObject:@"正常 请求"];


}



#pragma mark- delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    switch (indexPath.row) {
        case 0: {
            
            [self cdReq];
            
        } break;
        case 1: {
            [self normalReq];
            
        } break;
        case 2: {
            
            
        } break;
        case 3: {
            
            
        } break;
            
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
}

#pragma mark- 普通请求
- (void)normalReq {

    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    //
    NSSet *set = manager.responseSerializer.acceptableContentTypes;
    set = [set setByAddingObject:@"text/plain"];
    set = [set setByAddingObject:@"text/html"];
    manager.responseSerializer.acceptableContentTypes = set;
    //
    [manager GET:@"https://www.baidu.com" parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        
        
    }];
    
    

}

#pragma mark- 橙袋请求, 方式1
- (void)cdReq {

    //配置统一的BaseUrl
    [NBNetworkConfig config].baseUrl = @"http://118.178.124.16:3301/forward-service/api";

    //可以对 返回进行统一过滤
    [NBNetworkConfig config].respDelegate = self.respHandler;
   
    //获取图片上传凭证的接口
    NBCDRequest *cdReq = [[NBCDRequest alloc] init];
//    cdReq.code = @"805950";
//    cdReq.parameters[@"bizType"] = @"805063";
//    cdReq.parameters[@"kind"] = @"C";
//    cdReq.parameters[@"mobile"] = @"13868074590";
//    cdReq.parameters[@"companyCode"] = @"CD-CDZT000009";
//    cdReq.parameters[@"systemCode"] = @"CD-CDZT000009";
    
    cdReq.code = @"805806";
    cdReq.parameters[@"type"] = @"2";
    cdReq.parameters[@"companyCode"] = @"CD-CDZT000009";
    cdReq.parameters[@"systemCode"] = @"CD-CDZT000009";
    
    //请求返回是否被过滤， default YES
    cdReq.isHandleRespByDelegate = YES;
    
    //默认不会进行缓存， 打开缓存设置未NO
    cdReq.ignoreCache = NO;
    if ([cdReq checkCache]) {
        //有缓存
        id responseObject = [cdReq getCache];
        // todo
    }
    
    [SVProgressHUD showWithStatus:nil];
    [cdReq startWithSuccess:^(__kindof NBBaseRequest *request) {
        [SVProgressHUD dismiss];

        [SVProgressHUD showSuccessWithStatus:@"请求成功"];
        id responseObject =  request.responseObject;
        
    } failure:^(__kindof NBBaseRequest *request) {
        [SVProgressHUD dismiss];

        NSError *error = request.error;
        
    }];
    
}

#pragma mark- 橙袋请求, 方式2
- (void)cdReq2 {
    
    
    //获取图片上传凭证的接口
    NBCDRequest *cdReq = [[NBCDRequest alloc] init];
    cdReq.URLString = @"";
    cdReq.code = @"805951";
    cdReq.parameters[@"companyCode"] = @"";
    cdReq.parameters[@"systemCode"] = @"";
    [cdReq startWithSuccess:^(__kindof NBBaseRequest *request) {
        
        id responseObject =  request.responseObject;
        
    } failure:^(__kindof NBBaseRequest *request) {
        
        NSError *error = request.error;
        
    }];
    
}



#pragma mark- dataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return self.nameArray.count;
    
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCellId"];
    if (!cell) {
        
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"UITableViewCellId"];
        
    }
    
    cell.textLabel.text = self.nameArray[indexPath.row];
    return cell;

}


@end
