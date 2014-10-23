//
//  NoteCollectionViewCell.m
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

#import "NoteCollectionViewCell.h"

@implementation NoteCollectionViewCell

- (void)awakeFromNib
{
    // don't create constraints from the autoresizing mask as it will cause problems for the constraint system.
    self.translatesAutoresizingMaskIntoConstraints = NO;
    
    // give the views a tiny little rounded corner.
    self.layer.cornerRadius = 1.0;
    
    // get the shadow properties of the view layer.
    self.layer.masksToBounds = NO;
    self.layer.shadowColor = [UIColor darkGrayColor].CGColor;
    self.layer.shadowOffset = CGSizeMake(0.0, 0.5);
    self.layer.shadowOpacity = 0.9;
    self.layer.shadowRadius =  0.5;
    
    // dont' allow the text in the contents view to be selectable.
    // This is set here as there seems to be an XCode bug that will remove all text attributes if this is checked in interface builder.
    self.contentsView.selectable = NO;
}


- (CGSize)intrinsicContentSize
{
    // calculate the total width of the view from the width of the title label and its horizontal space constraints.
    CGFloat totalWidth = self.titleLabelLeftMarginConstraint.constant + self.titleLabelWidthConstraint.constant + self.titleLabelRightMarginConstraint.constant;
    
    // get the sizes of some of the spaces.
    CGFloat leftMargin        = self.contentsViewLeftMarginConstraint.constant;
    CGFloat rightMargin       = self.contentsViewRightMarginConstraint.constant;
    CGFloat topMargin         = self.titleLabelTopMarginConstraint.constant;
    CGFloat bottomMargin      = self.contentsViewBottomMarginConstraint.constant;
    CGFloat titleBarHeight    = self.titleLabelHeightConstraint.constant;
    CGFloat spaceBetweenViews = self.contentsViewTitleLabelSpaceConstraint.constant;
    
    // get the total size that the contents text will take in the cohtent view.
    CGSize size = [self.contentsView sizeThatFits:CGSizeMake(totalWidth - leftMargin - rightMargin, FLT_MAX)];
    
    // calculate the size the cell should be using the margins and the content size.
    return CGSizeMake(totalWidth, topMargin + bottomMargin + titleBarHeight + spaceBetweenViews + size.height);
}

@end
