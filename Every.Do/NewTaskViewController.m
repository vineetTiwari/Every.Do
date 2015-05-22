//
//  NewTaskViewController.m
//  Every.Do
//
//  Created by Vineet Tiwari on 2015-05-21.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import "NewTaskViewController.h"
#import "Task.h"

@implementation NewTaskViewController

- (IBAction)doneAction:(id)sender {

  Task *task = [[Task alloc] init];
  task.taskTitle = self.titleField.text;
  task.taskDescription = self.descriptionTextView.text;
  NSInteger priorityInt = [self.priorityField.text integerValue];
  task.priorityNumber = [NSNumber numberWithInteger:priorityInt];
  [self.delegate newTaskCreated:task];

  [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)cancelAction:(id)sender {

  [self dismissViewControllerAnimated:YES completion:nil];
}

@end
