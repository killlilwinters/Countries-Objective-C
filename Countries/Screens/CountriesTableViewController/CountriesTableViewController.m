//
//  CountriesTableViewController.m
//  Countries
//
//  Created by Maksym Horobets on 13.05.2025.
//

#import "CountriesTableViewController.h"
#import "NetworkManager.h"
#import "WorldRegionEnum.h"

@interface CountriesTableViewController ()

@end

@implementation CountriesTableViewController

- (instancetype)initWithNetworkManager:(NewNetworkManager *)networkManager
                      countiesInRegion:(WorldRegion) region {
    self = [super init];
    self.networkManager = networkManager;
    self.region = region;
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Setting up a cell
    NSString * cellIdentifier = @"CountryNameCell";
    [self.tableView registerClass: [UITableViewCell class] forCellReuseIdentifier: cellIdentifier];
    
    // Making a network call
    [_networkManager sendRequestForCountriesForWorldRegion: self.region completionHandler:^(NSArray<NameOnlyCountry *> * _Nullable countries, NSError * _Nullable error) {
        self.countries = countries;
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.tableView reloadData];
        });
        return;
    }];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //#warning Incomplete implementation, return the number of sections
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //#warning Incomplete implementation, return the number of rows
    return self.countries.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CountryNameCell" forIndexPath:indexPath];
    
    // Cell configuration
    NameOnlyCountry *country = self.countries[indexPath.row];
    cell.textLabel.text = country.commonName;
    
    return cell;
}

/*
 // Override to support conditional editing of the table view.
 - (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the specified item to be editable.
 return YES;
 }
 */

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
