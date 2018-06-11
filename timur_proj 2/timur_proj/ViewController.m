//
//  ViewController.m
//  timur_proj
//
//  Created by Vladislav Popov on 6/8/18.
//  Copyright © 2018 Timur Khamzin. All rights reserved.
//

#import "ViewController.h"
#import "LoginData.h"
#import "TableViewCell.h"

@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (strong, nonatomic) NSMutableArray* loginData;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *urlTextField;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (strong, nonatomic) NSData* data;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.passwordTextField.secureTextEntry = YES;
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    self.loginData = [NSKeyedUnarchiver unarchiveObjectWithData:[defaults objectForKey:@"MyArr"]];
    if(!self.loginData) {
        self.loginData = [NSMutableArray new];
    }
}

- (IBAction)btnSave:(id)sender {
    NSString* url = self.urlTextField.text;
    NSString* email = self.emailTextField.text;
    NSString* password = self.passwordTextField.text;
    
    LoginData* myData = [LoginData new];
    myData.login = email;
    myData.url = url;
    myData.password = password;
    
    [self.loginData addObject:myData];
    
    self.data = [NSKeyedArchiver archivedDataWithRootObject:self.loginData];
    
    NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:self.data forKey:@"MyArr"];
    [self.tableView reloadData];
}

#pragma -mark UITableViewDataSource

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 90;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.loginData.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:@"MyCell"];
    LoginData* object = self.loginData[indexPath.row];
    [cell configCell:object row:indexPath.row];
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        //remove the deleted object from your data source.
        //If your data source is an NSMutableArray, do this
        [self.loginData removeObjectAtIndex:indexPath.row];
        self.data = [NSKeyedArchiver archivedDataWithRootObject:self.loginData];
        
        NSUserDefaults* defaults = [NSUserDefaults standardUserDefaults];
        [defaults setObject:self.data forKey:@"MyArr"];
        [self.tableView reloadData];
    }
}

@end
