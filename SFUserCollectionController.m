//
//  SFUserCollectionController.m
//  GithubToGo
//
//  Created by Spencer Fornaciari on 1/28/14.
//  Copyright (c) 2014 Spencer Fornaciari. All rights reserved.
//

#import "SFUserCollectionController.h"
#import "SFNetworkController.h"

@interface SFUserCollectionController ()

@property (nonatomic) NSMutableArray *searchResults;
@property (weak, nonatomic) IBOutlet UISearchBar *userSearchBar;
@property (weak, nonatomic) IBOutlet UICollectionView *userCollectionView;

@end

@implementation SFUserCollectionController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.userSearchBar.delegate = self;
    self.userCollectionView.delegate = self;
    self.userCollectionView.dataSource = self;
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 8;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [[UICollectionViewCell init] dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    
    cell.backgroundColor = [UIColor redColor];
    
    return cell;
}

- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    searchBar.keyboardType = UIKeyboardTypeWebSearch;
    
    [searchBar resignFirstResponder];
    [self githubSearch:searchBar.text];
}

- (void)githubSearch:(NSString *)string
{
    NSLog(@"%@", string);
    self.searchResults = (NSMutableArray *)[[SFNetworkController sharedController] reposForSearchString:string];
    if (self.searchResults == nil) {
        
    } else {
        [self.userCollectionView reloadData];
    }
    
}

//-(UICollectionViewCell)

@end
