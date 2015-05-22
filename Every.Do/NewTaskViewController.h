//
//  NewTaskViewController.h
//  Every.Do
//
//  Created by Vineet Tiwari on 2015-05-21.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import <UIKit/UIKit.h>

@class Task;

@protocol NewTaskViewDelegate<NSObject>

- (void)newTaskCreated:(Task *)task;

@end

@interface NewTaskViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UITextField *titleField;

@property (weak, nonatomic) IBOutlet UITextView *descriptionTextView;

@property (weak, nonatomic) IBOutlet UITextField *priorityField;

@property (nonatomic) id<NewTaskViewDelegate> delegate;

@end
