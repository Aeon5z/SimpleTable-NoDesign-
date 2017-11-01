//
//  ViewController.m
//  SimpleTable
//
//  Created by user on 10/30/17.
//  Copyright © 2017 user. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <UITableViewDelegate , UITableViewDataSource>
@property (nonatomic , strong) NSArray *States;
@property (nonatomic , strong) NSArray *Capitals;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.States = @[@"Alabama" , @"Alaska" , @"Arizona" , @"Arkansas" , @"California" , @"Colorado" , @"Connecticut", @"Delaware" , @"Florida" , @"Georgia" , @"Hawaii" , @"Idaho" , @"Illinois" , @"Indiana" , @"Iowa" , @"Kansas" , @"Kentucky" , @"Louisiana" , @"Maine" , @"Maryland" , @"Massachusetts" , @"Michigan" , @"Minnesota" , @"Mississippi" , @"Missouri"];
    self.Capitals = @[@"Montgomery" , @"Juneau" , @"Phoenix" , @"Little Rock" , @"Sacramento" , @"Denver", @"Hartford" , @"Dover" , @"Tallahassee" , @"Atlanta" , @"Honolulu" , @"Boise" , @"Springfield" , @"Indianapolis" , @"Des Moines" , @"Topeka" , @"Frankfort" , @"Baton Rouge" , @"Augusta" , @"Annapolis" , @"Boston" , @"Lansing" , @"St. Paul" , @"Jackson" , @"Jefferson City"];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.States count];
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    // define the type of table cell
    static NSString * simpleTableIdentifier = @"simpleTableIdentifier";
    
    // ask the table to resuse previously used cell
    UITableViewCell * Cell = [tableView dequeueReusableCellWithIdentifier:simpleTableIdentifier];
    
    if (Cell == nil){
        Cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:simpleTableIdentifier];
    }
    UIImage *image = [UIImage imageNamed:@"star"];
    Cell.imageView.image = image;
    
    UIImage *highlightedimage = [UIImage imageNamed:@"star2"];
    Cell.imageView.highlightedImage = highlightedimage;
    
    Cell.textLabel.text = self.States[indexPath.row];
    Cell.detailTextLabel.text = self.Capitals[indexPath.row];
    //Cell.detailTextLabel.text = self.Capitals[indexPath.row];
    
    Cell.textLabel.font = [UIFont boldSystemFontOfSize:20];
    
   
    return Cell;
}


-(NSIndexPath *) tableView:(UITableView *)tableView willDeselectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0)
        return nil;
    else
        return indexPath;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *Capital = self.Capitals[indexPath.row];
    NSString *State = self.States[indexPath.row];
    NSString *message = [[NSString alloc]initWithFormat:@"you have selected %@ which has a capital of %@" ,State , Capital];
    
    NSLog(@"%@" , message);
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}


@end
