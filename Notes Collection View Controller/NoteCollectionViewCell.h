//
//  NoteCollectionViewCell.h
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

/** This is a cell that will displayed inside of a NotesSummaryViewController. */
@interface NoteCollectionViewCell : UICollectionViewCell

/** The label in wihch to display the note title. */
@property IBOutlet UILabel *titleLabel;

/** The text view in which to display the note content. */
@property IBOutlet UITextView *contentsView;

/** @name Constraints */

/** A constraint that keeps the titleLabel a fixed distance from the top of the cell view. */
@property IBOutlet NSLayoutConstraint *titleLabelTopMarginConstraint;

/** A constraint that keeps the titleLabel a fixed distance from the right of the cell view. */
@property IBOutlet NSLayoutConstraint *titleLabelRightMarginConstraint;

/** A constraint that keeps the titleLabel a fixed distance from the left of the cell view. */
@property IBOutlet NSLayoutConstraint *titleLabelLeftMarginConstraint;

/** A constraint that specifies the width of the titleLabel. */
@property IBOutlet NSLayoutConstraint *titleLabelWidthConstraint;

/** A constraint that specifies the height of the titleLabel. */
@property IBOutlet NSLayoutConstraint *titleLabelHeightConstraint;

/** A constraint that keeps the contents text view a fixed distance from the bottom of the cell view. */
@property IBOutlet NSLayoutConstraint *contentsViewBottomMarginConstraint;

/** A constraint that keeps the contents text view a fixed distance from the right of the cell view. */
@property IBOutlet NSLayoutConstraint *contentsViewRightMarginConstraint;

/** A constraint that keeps the contents text view a fixed distance from the left of the cell view. */
@property IBOutlet NSLayoutConstraint *contentsViewLeftMarginConstraint;

/** A constraint that specifies the width of the contents text view. */
@property IBOutlet NSLayoutConstraint *contentsViewWidthConstraint;

/** A constraint that keeps the the titleLabel and context text view a set distance apart, vertically. */
@property IBOutlet NSLayoutConstraint *contentsViewTitleLabelSpaceConstraint;

@end
