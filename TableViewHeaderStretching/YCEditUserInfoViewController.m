//
//  YCEditUserInfoViewController.m
//  TableViewHeaderStretching
//
//  Created by mr.scorpion on 16/5/4.
//  Copyright © 2016年 mr.scorpion. All rights reserved.
//

#import "YCEditUserInfoViewController.h"
#define ScreenWidth [[UIScreen mainScreen] bounds].size.width
#define Screenheight [[UIScreen mainScreen] bounds].size.height
#define kImageOriginHight 220

@interface YCEditUserInfoViewController ()
<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) UIImageView *headImageView;
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@end

@implementation YCEditUserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor redColor];
    
    self.tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    [self.view addSubview:self.tableView];
    
    self.headImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"stranger_background"]];
    self.headImageView.frame = CGRectMake(0, 0, ScreenWidth, kImageOriginHight);
    
    UIVisualEffect *blurEffect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.visualEffectView = [[UIVisualEffectView alloc] initWithEffect:blurEffect];
    self.visualEffectView.frame = self.headImageView.bounds;
    [self.headImageView addSubview:self.visualEffectView];
    [self.tableView addSubview:self.headImageView];
    self.tableView.showsVerticalScrollIndicator = NO;
    UILabel *title = [[UILabel alloc] initWithFrame:CGRectMake(0, 100, ScreenWidth, 30)];
    title.textAlignment = NSTextAlignmentCenter;
    title.text = @"zhaozihui@gmail.com";
    [self.tableView addSubview:title];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * showUserInfoCellIdentifier = @"ShowUserInfoCell";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:showUserInfoCellIdentifier];
    if (cell == nil)
    {
        // Create a cell to display an ingredient.
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                      reuseIdentifier:showUserInfoCellIdentifier];
    }
    
    // Configure the cell.
    cell.textLabel.text=@"Test";
    return cell;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGFloat yOffset  = scrollView.contentOffset.y;
    
    if (yOffset < 0) {
        CGRect f = self.headImageView.frame;
        f.origin.y = yOffset;
        f.size.height =  -yOffset + kImageOriginHight;
        f.origin.x = -(f.size.height*ScreenWidth/kImageOriginHight -  ScreenWidth)/2;
        f.size.width = f.size.height*ScreenWidth/kImageOriginHight;
        self.headImageView.frame = f;
        self.visualEffectView.frame = self.headImageView.bounds;
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
