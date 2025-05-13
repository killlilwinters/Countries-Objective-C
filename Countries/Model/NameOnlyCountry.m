//
//  NameOnlyCountry.m
//  Countries
//
//  Created by ChatGPT on 12.05.2025.
//

#import "NameOnlyCountry.h"

// MARK: - LocalizedName implementation
@implementation LocalizedName

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        _official = dict[@"official"];
        _common = dict[@"common"];
    }
    return self;
}

@end

// MARK: - NameOnlyCountry implementation
@implementation NameOnlyCountry

- (instancetype)initWithDictionary:(NSDictionary *)dict {
    self = [super init];
    if (self) {
        NSDictionary *nameDict = dict[@"name"];
        _commonName = nameDict[@"common"];
        _officialName = nameDict[@"official"];

        NSDictionary *nativeDict = nameDict[@"nativeName"];
        NSMutableDictionary *parsedNativeNames = [NSMutableDictionary dictionary];
        
        for (NSString *key in nativeDict) {
            NSDictionary *nameInfo = nativeDict[key];
            LocalizedName *localized = [[LocalizedName alloc] initWithDictionary:nameInfo];
            parsedNativeNames[key] = localized;
        }

        _nativeNames = [parsedNativeNames copy];
    }
    return self;
}

@end
