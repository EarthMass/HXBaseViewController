//
//  BaseNavVCDemo.m
//  TestProject
//
//  Created by Guohx on 16/5/20.
//
//

#import "BaseNavVCDemo.h"
#import "OneVC.h"
#import "TwoVC.h"
#import "WithoutBarVC.h"

@interface BaseNavVCDemo ()<UITableViewDelegate, UITableViewDataSource> {
    UITableView * tableV;
    NSArray * titleArr;
    NSArray * classArr;
}

@end

@implementation BaseNavVCDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initNav];
   
    
    
    titleArr = @[@"OneVC",@"TwoVC",@"WithoutBarVC"];
    classArr = @[[OneVC class],
                 [TwoVC class],
                 [WithoutBarVC class]
                 ];
    
    CGRect tableVFrame = self.view.frame;
    tableVFrame.origin.y = 0;
    tableVFrame.size.height = tableVFrame.size.height;
    
    tableV = [[UITableView alloc] initWithFrame:tableVFrame style:UITableViewStylePlain];
    tableV.delegate = self;
    tableV.dataSource = self;
    [self setExtraCellLineHidden:tableV];
    [self.view addSubview:tableV];
    
    tableV.backgroundColor = [UIColor clearColor];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark- init
- (void)initNav {
    
    self.navBarTranslucent = NO;
    self.title = @"导航栏";
    self.rightStr = @"右阿牛你";
    self.hiddenLeftBtn = YES;
    self.backStr = @"1212";
    self.statusBarTextIsWhite = YES;
    
    self.navBarColor = [UIColor redColor];
    self.navTitleTextAttributes = @{NSForegroundColorAttributeName:[UIColor whiteColor]};
//    self.navBgImage = [UIImage imageNamed:@"bgNavImage.jpg"];

//    self.navShadowImage =  [UIImage imageNamed:@"bgNavImage.jpg"];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark-
#pragma mark -TableView DataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return titleArr.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
        static NSString *CellIdentifier = @"CustomCell";
        //自定义cell类
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
        if (cell == nil) {
            //通过xib的名称加载自定义的cell
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:CellIdentifier];
        }
    cell.textLabel.text = titleArr[indexPath.row];
    
    
    //选中状态
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //指示类型
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
    
}

#pragma mark TableView Delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    //点击cell操作

    [self.navigationController pushViewController:[[classArr objectAtIndex:indexPath.row] new] animated:YES];
    
}

- (void)setExtraCellLineHidden: (UITableView *)tableView{
    //隐藏多余的cell分割线
    UIView *view =[ [UIView alloc]init];
    view.backgroundColor = [UIColor clearColor];
    [tableView setTableFooterView:view];
    //    [tableView setTableHeaderView:view];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    //cell高度
    return 45.0f;
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
