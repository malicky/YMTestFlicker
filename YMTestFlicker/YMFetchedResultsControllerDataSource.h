#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@class  NSFetchedResultsController;

@protocol YMFetchedResultsControllerDataSourceDelegate

- (void)configureCell:(id)cell withObject:(id)object;
- (void)detailViewWithObject:(id)object;

@end

@interface YMFetchedResultsControllerDataSource : NSObject <UICollectionViewDataSource,
                                                            UICollectionViewDelegate,
                                                            UICollectionViewDelegateFlowLayout,
                                                            NSFetchedResultsControllerDelegate>
@property (nonatomic, strong) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, weak) id<YMFetchedResultsControllerDataSourceDelegate> delegate;

- (id)initWithTableView:(UICollectionView*)tableView;
- (id)objectAtIndexPath:(NSIndexPath*)indexPath;
- (void)reuseIdentifier:(NSString *)reuseIdentifier;
- (void)reloadData;

@end
