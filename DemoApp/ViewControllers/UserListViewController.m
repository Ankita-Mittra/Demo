//
//  UserListViewController.m
//  DemoApp
//
//  Created by Admin on 08/12/2022.
//

#import "UserListViewController.h"
#import "DemoApp-Swift.h"
#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface UserListViewController () <UITableViewDataSource, UITableViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *allUsersTableiew;
@property (strong, nonatomic) DetailsViewController *userDetailsVC;
@property NSArray *users ;
@property (strong, nonatomic) LocalDatabaseQueries *getUsers;

@end

@implementation UserListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) displayMessageFromCreatedObjectiveCFile {
NSLog(@"Hello. . . ");
NSLog(@"This Message From Created Objective-C File with Swift Project");
}


- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    
    static NSString *TableIdentifier = @"UserCustomTableViewCell";//@"TableIdentifier";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:
                             TableIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableIdentifier];
    }
    cell.textLabel.text = self.users[indexPath.row];
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
//    _userDetailsVC = [[UserDetailsViewController alloc]init];
//
//    //    UIViewController *vc = [[UserDetailsViewController alloc] init];
//    //
//
//    [self.presentingViewController: _userDetailsVC animated:YES];
//    [self.navigationController pushViewController:_userDetailsVC animated:YES];
    
    
    
    DetailsViewController *vc = [[self storyboard] instantiateViewControllerWithIdentifier: @"DetailsViewController"];

    UINavigationController *navBar = [[UINavigationController alloc]initWithRootViewController:vc];
    
    [self presentViewController:navBar animated:YES completion:nil];
}

@end
