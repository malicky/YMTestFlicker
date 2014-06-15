// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Photo.h instead.

#import <CoreData/CoreData.h>


extern const struct PhotoAttributes {
	__unsafe_unretained NSString *desc;
	__unsafe_unretained NSString *farm;
	__unsafe_unretained NSString *id;
	__unsafe_unretained NSString *isfamily;
	__unsafe_unretained NSString *isfriend;
	__unsafe_unretained NSString *ispublic;
	__unsafe_unretained NSString *owner;
	__unsafe_unretained NSString *secret;
	__unsafe_unretained NSString *server;
	__unsafe_unretained NSString *title;
} PhotoAttributes;

extern const struct PhotoRelationships {
} PhotoRelationships;

extern const struct PhotoFetchedProperties {
} PhotoFetchedProperties;













@interface PhotoID : NSManagedObjectID {}
@end

@interface _Photo : NSManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
- (PhotoID*)objectID;





@property (nonatomic, strong) NSString* desc;



//- (BOOL)validateDesc:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* farm;



//- (BOOL)validateFarm:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* id;



//- (BOOL)validateId:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isfamily;



@property BOOL isfamilyValue;
- (BOOL)isfamilyValue;
- (void)setIsfamilyValue:(BOOL)value_;

//- (BOOL)validateIsfamily:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSNumber* isfriend;



@property BOOL isfriendValue;
- (BOOL)isfriendValue;
- (void)setIsfriendValue:(BOOL)value_;

//- (BOOL)validateIsfriend:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* ispublic;



//- (BOOL)validateIspublic:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* owner;



//- (BOOL)validateOwner:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* secret;



//- (BOOL)validateSecret:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* server;



//- (BOOL)validateServer:(id*)value_ error:(NSError**)error_;





@property (nonatomic, strong) NSString* title;



//- (BOOL)validateTitle:(id*)value_ error:(NSError**)error_;






@end

@interface _Photo (CoreDataGeneratedAccessors)

@end

@interface _Photo (CoreDataGeneratedPrimitiveAccessors)


- (NSString*)primitiveDesc;
- (void)setPrimitiveDesc:(NSString*)value;




- (NSString*)primitiveFarm;
- (void)setPrimitiveFarm:(NSString*)value;




- (NSString*)primitiveId;
- (void)setPrimitiveId:(NSString*)value;




- (NSNumber*)primitiveIsfamily;
- (void)setPrimitiveIsfamily:(NSNumber*)value;

- (BOOL)primitiveIsfamilyValue;
- (void)setPrimitiveIsfamilyValue:(BOOL)value_;




- (NSNumber*)primitiveIsfriend;
- (void)setPrimitiveIsfriend:(NSNumber*)value;

- (BOOL)primitiveIsfriendValue;
- (void)setPrimitiveIsfriendValue:(BOOL)value_;




- (NSString*)primitiveIspublic;
- (void)setPrimitiveIspublic:(NSString*)value;




- (NSString*)primitiveOwner;
- (void)setPrimitiveOwner:(NSString*)value;




- (NSString*)primitiveSecret;
- (void)setPrimitiveSecret:(NSString*)value;




- (NSString*)primitiveServer;
- (void)setPrimitiveServer:(NSString*)value;




- (NSString*)primitiveTitle;
- (void)setPrimitiveTitle:(NSString*)value;




@end
