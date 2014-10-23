//
//  ViewController.h
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

@import UIKit;


/** The notes view controller is */
@interface ARNotesSummaryViewController : UICollectionViewController

/** Creates a Notes Summary View Controller using the specified nib as the cell for the collection view.
 @param nibName        The name of the nib that contains the NoteCollectionViewCell to use. This must not be nil.
 @param nibBundleOrNil The bundle that the nib is in.
 @return An instance of `ARNotesSummaryViewController` that will use the specified nib for the cells of the collection view.
 */
- (instancetype)initWithCellNibName:(NSString *)nibName bundle:(NSBundle *)nibBundleOrNil   NS_DESIGNATED_INITIALIZER;

/** an array of `Note` objects to display in the collection view. */
@property (nonatomic) NSArray *notes;

/** The name of the nib that contains the cell to display in the collection view. The owner of the nib must be of class `ARNoteCollectionViewCell`. */
@property (nonatomic, readonly) NSString *cellNibName;

/** The bundle that contains the cell nib. */
@property (nonatomic, readonly) NSBundle *cellNibBundle;

@end

