//
//  HCLeftViewController.m
//  HEVA Coredata
//
//  Created by Tanguy Hélesbeux on 07/12/2015.
//  Copyright © 2015 Tanguy Hélesbeux. All rights reserved.
//

#import "HCLeftViewController.h"

// Model
#import "HCModelManager.h"
#import "HCHospital.h"

@interface HCLeftViewController ()

@end

@implementation HCLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.fetchedResultsController = [[HCModelManager defaultModel] hospitalsFetchResultsController];
}

#pragma mark - Table view data source

- (HCHospital *)hospitalForIndexPath:(NSIndexPath *)indexPath {
    return [self.fetchedResultsController objectAtIndexPath:indexPath];
}

#define CELL_IDENTIFIER @"hospitalCell"

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CELL_IDENTIFIER];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CELL_IDENTIFIER];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    
    HCHospital *hospital = [self hospitalForIndexPath:indexPath];
    cell.textLabel.text = hospital.name;
    
    return cell;
}

@end
