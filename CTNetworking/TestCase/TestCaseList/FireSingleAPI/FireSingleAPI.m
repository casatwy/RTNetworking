//
//  FireSingleAPI.m
//  CTNetworking
//
//  Created by casa on 15/12/31.
//  Copyright © 2015年 casa. All rights reserved.
//

#import "FireSingleAPI.h"
#import "TestAPIManager.h"
#import <UIView+LayoutMethods.h>
#import "CTRequestGenerator.h"

@interface FireSingleAPI () <CTAPIManagerParamSource, CTAPIManagerCallBackDelegate>

@property (nonatomic, strong) TestAPIManager *testAPIManager;
@property (nonatomic, strong) TestAPIManager *twoApi;
@property (nonatomic, strong) TestAPIManager *threeApi;
@property (nonatomic, strong) TestAPIManager *foureApi;
@property (nonatomic, strong) TestAPIManager *fiveApi;
@property (nonatomic, strong) TestAPIManager *sixApi;
@property (nonatomic, strong) UILabel *resultLable;
@property (nonatomic, strong) UIButton *multithreadTest;

@end

@implementation FireSingleAPI

#pragma mark - life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.resultLable];
    [self.view addSubview:self.multithreadTest];
    [self testMultiTestLoad];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self layout];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self.testAPIManager loadData];
}

#pragma mark - private method

- (void)testMultiTestLoad {
    
    [[CTRequestGenerator sharedInstance] rest];
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [self.testAPIManager loadData];
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [self.twoApi loadData];
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [self.threeApi loadData];
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [self.foureApi loadData];
    });

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [self.fiveApi loadData];
    });
    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        
        [self.sixApi loadData];
    });


}
- (void)layout {
    
    [self layoutResultLable];
    [self layoutMultiTestButton];
}
- (void)layoutResultLable
{
    [self.resultLable sizeToFit];
    [self.resultLable centerXEqualToView:self.view];
    [self.resultLable centerYEqualToView:self.view];
}

- (void)layoutMultiTestButton {
    
    self.multithreadTest.ct_x = 100;
    self.multithreadTest.ct_y = 200;
    self.multithreadTest.ct_width = 100;
    self.multithreadTest.ct_height = 30;
}
#pragma mark - CTAPIManagerParamSource
- (NSDictionary *)paramsForApi:(CTAPIBaseManager *)manager
{
    NSDictionary *params = @{};
    
    if (manager == self.testAPIManager) {
        params = @{
                   kTestAPIManagerParamsKeyLatitude:@(31.228000),
                   kTestAPIManagerParamsKeyLongitude:@(121.454290)
                   };
    }
    
    return params;
}

#pragma mark - CTAPIManagerCallBackDelegate
- (void)managerCallAPIDidSuccess:(CTAPIBaseManager *)manager
{
    if (manager == self.testAPIManager) {
        self.resultLable.text = @"success";
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        [self layoutResultLable];
    }
}

- (void)managerCallAPIDidFailed:(CTAPIBaseManager *)manager
{
    if (manager == self.testAPIManager) {
        self.resultLable.text = @"fail";
        NSLog(@"%@", [manager fetchDataWithReformer:nil]);
        [self layoutResultLable];
    }
}

#pragma mark - getters and setters
- (TestAPIManager *)testAPIManager
{
    if (_testAPIManager == nil) {
        _testAPIManager = [[TestAPIManager alloc] init];
        _testAPIManager.delegate = self;
        _testAPIManager.paramSource = self;
    }
    return _testAPIManager;
}

- (UILabel *)resultLable
{
    if (_resultLable == nil) {
        _resultLable = [[UILabel alloc] init];
        _resultLable.text = @"loading API...";
    }
    return _resultLable;
}

- (TestAPIManager *)twoApi {
    
    if (_twoApi == nil) {
        _twoApi = [[TestAPIManager alloc] init];
        _twoApi.delegate = self;
        _twoApi.paramSource = self;
    }
    return _twoApi;
}

- (TestAPIManager *)threeApi {
    
    if (_threeApi == nil) {
        _threeApi = [[TestAPIManager alloc] init];
        _threeApi.delegate = self;
        _threeApi.paramSource = self;
    }
    return _threeApi;
}

- (TestAPIManager *)foureApi {
    
    if (_foureApi == nil) {
        _foureApi = [[TestAPIManager alloc] init];
        _foureApi.delegate = self;
        _foureApi.paramSource = self;
    }
    return _foureApi;
}
- (TestAPIManager *)fiveApi {
    
    if (_fiveApi == nil) {
        _fiveApi = [[TestAPIManager alloc] init];
        _fiveApi.delegate = self;
        _fiveApi.paramSource = self;
    }
    return _fiveApi;
}
- (TestAPIManager *)sixApi {
    
    if (_sixApi == nil) {
        _sixApi = [[TestAPIManager alloc] init];
        _sixApi.delegate = self;
        _sixApi.paramSource = self;
    }
    return _sixApi;
}
- (UIButton *)multithreadTest {
    
    if (!_multithreadTest) {
        
        _multithreadTest = [[UIButton alloc] init];
        [_multithreadTest setTitle:@"test" forState:UIControlStateNormal];
        [_multithreadTest setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [_multithreadTest addTarget:self action:@selector(testMultiTestLoad) forControlEvents:UIControlEventTouchUpInside];
    }
    return _multithreadTest;
}
@end
