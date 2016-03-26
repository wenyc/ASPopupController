//
//  ViewController.m
//  CyAlertControllerDemo
//
//  Created by Cyrus on 16/3/26.
//  Copyright © 2016年 Cyrus. All rights reserved.
//

#import "ViewController.h"
#import "CYAlertController/CYAlertController.h"

@interface ViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)NSArray *titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"CYAlertControllerDemo";
    
    _titleArray = @[@"PresentSystem & DismissFadeOut",
                    @"PresentBounce & DismissFadeOut",
                    @"PresentFadeIn & DismissFadeOut",
                    @"PresentExpand & DismissContract(Horizontal)",
                    @"PresentExpand & DismissContract(Vertical)",
                    @"PresentSlideDown & DismissSlideDown",
                    @"PresentSlideUp & DismissSlideUp",
                    @"PresentSlideLeft & DismissSlideLeft",
                    @"PresentSlideRight & DismissSlideRight",
                    @"CustomView"];
    
    UITableView *demoTable = [[UITableView alloc] initWithFrame:self.view.frame];
    demoTable.delegate = self;
    demoTable.dataSource = self;
    [self.view addSubview:demoTable];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text = _titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    
    CYAlertController *alert = [CYAlertController alertWithTitle:@"AlertDemo"
                                                         message:@"Hello CYAlertController 😜"
                                                     buttonTitle:@"Done"
                                                    buttonAction:^{
                                                        NSLog(@"done button clicked");
                                                    }];

    switch (indexPath.row) {
        case 0:
            alert.presentStyle = CYAlertPresentStyleSystem;
            break;
        case 1:
            alert.presentStyle = CYAlertPresentStyleBounce;
            break;
        case 2:
            alert.presentStyle = CYAlertPresentStyleFadeIn;
            break;
        case 3:
            alert.presentStyle = CYAlertPresentStyleExpandHorizontal;
            alert.dismissStyle = CYAlertDismissStyleContractHorizontal;
            break;
        case 4:
            alert.presentStyle = CYAlertPresentStyleExpandVertical;
            alert.dismissStyle = CYAlertDismissStyleContractVertical;
            break;
        case 5:
            alert.presentStyle = CYAlertPresentStyleSlideDown;
            alert.dismissStyle = CYAlertDismissStyleSlideDown;
            break;
        case 6:
            alert.presentStyle = CYAlertPresentStyleSlideUp;
            alert.dismissStyle = CYAlertDismissStyleSlideUp;
            break;
        case 7:
            alert.presentStyle = CYAlertPresentStyleSlideLeft;
            alert.dismissStyle = CYAlertDismissStyleSlideLeft;
            break;
        case 8:
            alert.presentStyle = CYAlertPresentStyleSlideRight;
            alert.dismissStyle = CYAlertDismissStyleSlideRight;
            break;
        case 9:{
            UIView *customView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 270, 400)];
            customView.backgroundColor = [UIColor brownColor];
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction)];
            [customView addGestureRecognizer:tap];
            alert = [CYAlertController alertWithCustomView:customView presentStyle:CYAlertPresentStyleBounce dismissStyle:CYAlertDismissStyleFadeOut];
            break;
        }
        default:
            break;
    }
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)tapAction {
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
