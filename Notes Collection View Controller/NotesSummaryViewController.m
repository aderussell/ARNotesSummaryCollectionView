//
//  ViewController.m
//
//  Created by Adrian Russell on 23/10/2014.
//  Copyright (c) 2014 Adrian Russell. All rights reserved.
//
//  This software is provided 'as-is', without any express or implied
//  warranty. In no event will the authors be held liable for any damages
//  arising from the use of this software. Permission is granted to anyone to
//  use this software for any purpose, including commercial applications, and to
//  alter it and redistribute it freely, subject to the following restrictions:
//
//  1. The origin of this software must not be misrepresented; you must not
//     claim that you wrote the original software. If you use this software
//     in a product, an acknowledgment in the product documentation would be
//     appreciated but is not required.
//  2. Altered source versions must be plainly marked as such, and must not be
//     misrepresented as being the original software.
//  3. This notice may not be removed or altered from any source
//     distribution.
//

#import "NotesSummaryViewController.h"
#import "NoteCollectionViewCell.h"
#import "Note.h"



@interface NotesSummaryViewController ()

/** A note collection cell, like the ones used in the collection view, that is used for checking what size the cell should be when drawn to the collection view. */
@property NoteCollectionViewCell *sizingCell;

// redefined privately to make them writable.
@property NSString *cellNibName;
@property NSBundle *cellNibBundle;

@end

@implementation NotesSummaryViewController

- (instancetype)init
{
    // create the notes summary view controller using the default nib.
    return [self initWithCellNibName:@"NoteCollectionViewCell" bundle:nil];
}

- (instancetype)initWithCellNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super init]) {
        // create a default title for the view controller.
        self.title = @"Notes";
        
        // set the cell nib properties.
        self.cellNibName = nibNameOrNil;
        self.cellNibBundle = nibBundleOrNil;
    }
    return self;
}


- (void)loadView
{
    // create the layout controller for the collection view.
    UICollectionViewFlowLayout *layout = [UICollectionViewFlowLayout new];
    layout.sectionInset = UIEdgeInsetsMake(20, 20, 20, 20);
    layout.itemSize = CGSizeMake(300, 146);
    
    // create the collection view itself and add it to the view controller. Note that the frame size is 0; this doesn't matter as the view will be resized to whatever space the view controller will take.
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    
    // set the background color to a nice very light gray color.
    self.collectionView.backgroundColor = [UIColor colorWithWhite:242.0/255.0 alpha:1.0];
    
    // Create a nib object for the cell using the specified cell's nib name and the bundle containing the nib
    UINib *cellNib = [UINib nibWithNibName:self.cellNibName bundle:self.cellNibBundle];
    
    
    [self.collectionView registerNib:cellNib forCellWithReuseIdentifier:@"cell"];
    
    
    // get a cell as template for sizing
    self.sizingCell = [[cellNib instantiateWithOwner:nil options:nil] objectAtIndex:0];
    self.sizingCell.translatesAutoresizingMaskIntoConstraints = NO;

    
    // add a button to the navigation bar that will close the view controller.
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Close" style:UIBarButtonItemStyleDone target:self action:@selector(close:)];
    
}

/** Configures a specified collection view cell to display the correct data when used at a specified index path.
 @param cell      The cell to add the note data to.
 @param indexPath The index path at which the cell will be shown.
 */
- (void)configureCell:(NoteCollectionViewCell *)cell forIndexPath:(NSIndexPath *)indexPath
{
    // get the note for the indexpath.
    Note *note = self.notes[indexPath.row];
    
    // get the note data to the cell.
    cell.titleLabel.text = note.title;
    cell.contentsView.text = note.contents;
}


#pragma mark - Setters & Getters

- (void)setNotes:(NSArray *)notes
{
    _notes = notes;
    [self.collectionView reloadData];
}

#pragma mark - Actions


- (void)close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


#pragma mark - UICollectionView Delegate Methods

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    [self configureCell:self.sizingCell forIndexPath:indexPath];
    return self.sizingCell.intrinsicContentSize;

}


#pragma mark - UICollectionView Data Source Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.notes.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    // get a cell to use
    NoteCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cell" forIndexPath:indexPath];
    
    // configure the cell with the data it needs for the index path
    [self configureCell:cell forIndexPath:indexPath];
    
    return cell;
}



@end
