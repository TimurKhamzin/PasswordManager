//
//  TableViewCell.h
//  timur_proj
//
//  Created by Vladislav Popov on 6/8/18.
//  Copyright © 2018 Timur Khamzin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LoginData.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableViewCell : UITableViewCell

-(void)configCell:(LoginData*)object row:(NSInteger)rowCell;

@end

NS_ASSUME_NONNULL_END
