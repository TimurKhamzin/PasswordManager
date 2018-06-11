//
//  TableViewCell.m
//  timur_proj
//
//  Created by Vladislav Popov on 6/8/18.
//  Copyright © 2018 Timur Khamzin. All rights reserved.
//

#import "TableViewCell.h"

@interface TableViewCell()

@property (weak, nonatomic) IBOutlet UILabel *url;
@property (weak, nonatomic) IBOutlet UILabel *login;
@property (weak, nonatomic) IBOutlet UILabel *password;
@property (assign, nonatomic) NSInteger row;

@end

@implementation TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)configCell:(LoginData *)object row:(NSInteger)rowCell {
    self.url.text = object.url;
    self.login.text = object.login;
    self.password.text = object.password;
    self.row = rowCell;
}

@end
