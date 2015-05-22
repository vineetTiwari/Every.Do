//
//  DetailViewController.m
//  Every.Do
//
//  Created by Vineet Tiwari on 2015-05-21.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import "TaskDescriptionViewController.h"

@interface TaskDescriptionViewController ()

@end

@implementation TaskDescriptionViewController

#pragma mark - Managing the detail item

- (void)setDetailItem:(Task *)newTask {
  if (self.task != newTask) {
    self.task = newTask;

    // Update the view.
    [self configureView];
  }
}

- (void)configureView {
  // Update the user interface for the detail item.
  if (self.task) {

    NSNumber *priorityNum = [self.task priorityNumber];
    self.priorityLabel.text = [priorityNum stringValue];
    self.titleLabel.text = [self.task taskTitle];
    self.descriptionLabel.text = [self.task taskDescription];

  }
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

@end
