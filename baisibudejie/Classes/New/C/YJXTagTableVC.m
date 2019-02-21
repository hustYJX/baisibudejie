//
//  YJXTagTableVC.m
//  baisibudejie
//
//  Created by 尤建峡 on 2019/2/21.
//  Copyright © 2019 尤建峡. All rights reserved.
//

#import "YJXTagTableVC.h"
#import <AFNetworking.h>
#import "YJXTagHeaderV.h"
#import "YJXTagM.h"
#import <MJExtension/MJExtension.h>
#import "YJXTagCell.h"

@interface YJXTagTableVC ()<TagHeaderViewDelegate>

@property (nonatomic, strong) YJXTagM *tagModel;
@property (nonatomic, strong) NSArray *tagArr;

@end

static NSString * const ID = @"tagCell";

@implementation YJXTagTableVC

#pragma mark - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([YJXTagCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 80;
    self.tableView.separatorInset = UIEdgeInsetsZero;
    [self setupHeaderView];
}

#pragma mark - 设置headerView

- (void)setupHeaderView {
    YJXTagHeaderV *headerV = [YJXTagHeaderV loadViewFromXib];
    headerV.delegate = self;
    headerV.frame = CGRectMake(0, 0, self.tableView.yjx_width, 194);
    self.tableView.tableHeaderView = headerV;
    [self loadTagDataWithUrl:@"http://d.api.budejie.com/subscribe/user/5/0/bsbdjhd-iphone-5.0.5/0-10.json"];
}

- (void)tagHeaderView:(YJXTagHeaderV *)tagHeaderView clickedBtn:(UIButton *)clickedBtn {
    switch (clickedBtn.tag) {
        case 1: /** 搞笑原创 */
            [self loadTagDataWithUrl:@"http://d.api.budejie.com/subscribe/user/5/0/bsbdjhd-iphone-5.0.5/0-10.json"];
            break;
        case 2: /** 幽默红人 */
            [self loadTagDataWithUrl:@"http://d.api.budejie.com/subscribe/user/17/0/bsbdjhd-iphone-5.0.5/0-10.json"];
            break;
        case 3: /** 生活达人 */
            [self loadTagDataWithUrl:@"http://d.api.budejie.com/subscribe/user/43/0/bsbdjhd-iphone-5.0.5/0-10.json"];
            break;
        case 4: /** 动漫原创 */
            [self loadTagDataWithUrl:@"http://d.api.budejie.com/subscribe/user/35/0/bsbdjhd-iphone-5.0.5/0-10.json"];
            break;
        case 5: /** 音乐频道 */
            [self loadTagDataWithUrl:@"http://d.api.budejie.com/subscribe/user/33/0/bsbdjhd-iphone-5.0.5/0-10.json"];
            break;
        default:
            break;
    }
}

#pragma mark - 请求推荐标签数据

- (void)loadTagDataWithUrl:(NSString *)url {
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", nil];
    NSMutableDictionary *parameters = [NSMutableDictionary dictionary];
    [manager GET:url parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        self.tagArr = [YJXTagM mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.tagArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    YJXTagCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.tagModel = self.tagArr[indexPath.row];
    return cell;
}

@end
