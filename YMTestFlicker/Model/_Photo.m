// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to Photo.m instead.

#import "_Photo.h"

const struct PhotoAttributes PhotoAttributes = {
	.desc = @"desc",
	.farm = @"farm",
	.id = @"id",
	.isfamily = @"isfamily",
	.isfriend = @"isfriend",
	.ispublic = @"ispublic",
	.owner = @"owner",
	.secret = @"secret",
	.server = @"server",
	.title = @"title",
};

const struct PhotoRelationships PhotoRelationships = {
};

const struct PhotoFetchedProperties PhotoFetchedProperties = {
};

@implementation PhotoID
@end

@implementation _Photo

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Photo" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Photo";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Photo" inManagedObjectContext:moc_];
}

- (PhotoID*)objectID {
	return (PhotoID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];
	
	if ([key isEqualToString:@"isfamilyValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isfamily"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}
	if ([key isEqualToString:@"isfriendValue"]) {
		NSSet *affectingKey = [NSSet setWithObject:@"isfriend"];
		keyPaths = [keyPaths setByAddingObjectsFromSet:affectingKey];
		return keyPaths;
	}

	return keyPaths;
}




@dynamic desc;






@dynamic farm;






@dynamic id;






@dynamic isfamily;



- (BOOL)isfamilyValue {
	NSNumber *result = [self isfamily];
	return [result boolValue];
}

- (void)setIsfamilyValue:(BOOL)value_ {
	[self setIsfamily:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsfamilyValue {
	NSNumber *result = [self primitiveIsfamily];
	return [result boolValue];
}

- (void)setPrimitiveIsfamilyValue:(BOOL)value_ {
	[self setPrimitiveIsfamily:[NSNumber numberWithBool:value_]];
}





@dynamic isfriend;



- (BOOL)isfriendValue {
	NSNumber *result = [self isfriend];
	return [result boolValue];
}

- (void)setIsfriendValue:(BOOL)value_ {
	[self setIsfriend:[NSNumber numberWithBool:value_]];
}

- (BOOL)primitiveIsfriendValue {
	NSNumber *result = [self primitiveIsfriend];
	return [result boolValue];
}

- (void)setPrimitiveIsfriendValue:(BOOL)value_ {
	[self setPrimitiveIsfriend:[NSNumber numberWithBool:value_]];
}





@dynamic ispublic;






@dynamic owner;






@dynamic secret;






@dynamic server;






@dynamic title;











@end
