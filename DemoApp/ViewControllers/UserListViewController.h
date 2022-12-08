//
//  UserListViewController.h
//  DemoApp
//
//  Created by Admin on 08/12/2022.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN


@class UserModel;
@class LocalDatabaseQueries;
@class fetchAllUsersFromLocalDB;

@class AppDelegate;

@interface UserListViewController : UIViewController

- (void)displayMessageFromCreatedObjectiveCFile;

@end



NS_ASSUME_NONNULL_END
