
#import <Foundation/Foundation.h>

@interface DVersionComparator : NSObject
- (instancetype)init;

+ (DVersionComparator *)defaultComparator;

- (NSComparisonResult)compareVersion:(NSString *)versionA toVersion:(NSString *)versionB;

@end
