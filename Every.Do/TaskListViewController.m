//
//  MasterViewController.m
//  Every.Do
//
//  Created by Vineet Tiwari on 2015-05-21.
//  Copyright (c) 2015 vinny.co. All rights reserved.
//

#import "TaskListViewController.h"
#import "TaskDescriptionViewController.h"
#import "Task.h"
#import "TaskTableViewCell.h"

@interface TaskListViewController ()

@property NSMutableArray *tasksArray;
@end

@implementation TaskListViewController

- (void)awakeFromNib {
  [super awakeFromNib];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view, typically from a nib.

  self.navigationItem.leftBarButtonItem = self.editButtonItem;

//  UIBarButtonItem *addButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd target:self action:@selector(insertNewObject:)];
//  self.navigationItem.rightBarButtonItem = addButton;

  // create the swipe gesture recognizer
  UISwipeGestureRecognizer *swipeRightRecognizer = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRight:)];
  [self.tableView addGestureRecognizer:swipeRightRecognizer];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
  if (!self.tasksArray) {
      self.tasksArray = [[NSMutableArray alloc] init];
  }

  Task *task = [Task taskWithTitle:@"Test Task" description:@"Test Task Description" andPriorityNumber:@1];
  [self.tasksArray insertObject:task atIndex:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
  if ([[segue identifier] isEqualToString:@"showDetail"]) {
      NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
      Task *task = self.tasksArray[indexPath.row];
      [[segue destinationViewController] setTask:task];
  } else if ([[segue identifier] isEqualToString:@"presentModally"]){



    UINavigationController *navController = [segue destinationViewController];
    NewTaskViewController *newTaskViewController = [navController.viewControllers firstObject];
    
    newTaskViewController.delegate = self;
  };
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
  return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
  return self.tasksArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
  TaskTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

  Task *task = self.tasksArray[indexPath.row];
  cell.task = task;
  cell.titleLabel.text = [task taskTitle];
  cell.descriptionLabel.text = [task taskDescription];
  NSNumber *priorityNum = [task priorityNumber];
  cell.priorityLabel.text = [priorityNum stringValue];

  return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
  // Return NO if you do not want the specified item to be editable.
  return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
  if (editingStyle == UITableViewCellEditingStyleDelete) {
      [self.tasksArray removeObjectAtIndex:indexPath.row];
      [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
  } else if (editingStyle == UITableViewCellEditingStyleInsert) {
      // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
  }
}

- (void)swipeRight:(UISwipeGestureRecognizer *)sender {


}

- (void)newTaskCreated:(Task *)task {

  if (!self.tasksArray) {
    self.tasksArray = [[NSMutableArray alloc] init];
  }
  
  [self.tasksArray insertObject:task atIndex:0];
  NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
  [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

}

@end
