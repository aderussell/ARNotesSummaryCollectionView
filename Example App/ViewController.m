//
//  ViewController.m
//  CollectionView
//
//  Created by Adrian Russell on 23/10/2014.
//  Copyright (c) 2014 Adrian Russell. All rights reserved.
//

#import "ViewController.h"
#import "ARNotesSummaryViewController.h"
#import "ARNote.h"

@implementation ViewController

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // create a new notes summary view controller, calling standard -init will use the default nib.
    ARNotesSummaryViewController *vc = [[ARNotesSummaryViewController alloc] init];
    
    // create some data to stick into the notes.
    NSMutableArray *arr = [NSMutableArray array];
    for (NSUInteger i = 0; i < 59; i++) {
        ARNote *note = [ARNote new];
        note.title = @"Title of the note";
        
        NSString *contents = @"Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. ";
        NSUInteger r = random() % contents.length;
        
        note.contents = [contents substringWithRange:NSMakeRange(0, r)];
        [arr addObject:note];
    }
    
    // set the notes array to the notes summary view controller.
    vc.notes = arr;
    
    // embed the notes summary view controller into a navigation controller, set as a form sheet and present it.
    UINavigationController *navi = [[UINavigationController alloc] initWithRootViewController:vc];
    navi.modalPresentationStyle = UIModalPresentationFormSheet;
    [self presentViewController:navi animated:YES completion:nil];
}

@end
