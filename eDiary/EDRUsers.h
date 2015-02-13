//
//  EDRUsers.h
//  eDiary
//
//  Created by Thiruppathi Gandhi on 2/12/15.
//  Copyright (c) 2015 Thiruppathi Gandhi. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface EDRUsers : NSManagedObject

@property (nonatomic, retain) NSNumber * userId;
@property (nonatomic, retain) NSString * userName;
@property (nonatomic, retain) NSString * password;
@property (nonatomic, retain) NSString * email;

@end
