//
//  NameOnlyCountry.h
//  Countries
//
//  Created by ChatGPT on 12.05.2025.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

// MARK: - LocalizedName
@interface LocalizedName : NSObject

@property (nonatomic, strong) NSString *official;
@property (nonatomic, strong) NSString *common;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

// MARK: - NameOnlyCountry
@interface NameOnlyCountry : NSObject

@property (nonatomic, strong) NSString *commonName;
@property (nonatomic, strong) NSString *officialName;
@property (nonatomic, strong) NSDictionary<NSString *, LocalizedName *> *nativeNames;

- (instancetype)initWithDictionary:(NSDictionary *)dict;

@end

NS_ASSUME_NONNULL_END
