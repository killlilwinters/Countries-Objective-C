//
//  NetworkManager.m
//  Countries
//
//  Created by Maksym Horobets on 12.05.2025.
//
// https://stackoverflow.com/questions/40016361/nsurlsession-request-and-response
//

#import "NetworkManager.h"
#import "WorldRegionEnum.h"
#import "NameOnlyCountry.h"

@implementation NetworkManager

- (instancetype)init {
    self = [super init];
    if (self) {
        
        _baseAPIEndpoint = @"https://restcountries.com/v3.1/region/";
        
    }
    
    return self;
}

- (void)sendRequestForCountriesForWorldRegion: (enum WorldRegion)region
                            completionHandler: (FetchCompletionBlock)completion {
    NSString *urlString = [self.baseAPIEndpoint stringByAppendingString: NSStringFromWorldRegion(region)];
    NSString *urlNamesString = [urlString stringByAppendingString: @"?fields=name"];
    
    NSLog(@"%@", urlNamesString);
    NSURL *url = [NSURL URLWithString: urlNamesString];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL: url
                                                           cachePolicy: NSURLRequestUseProtocolCachePolicy
                                                       timeoutInterval: 60.0];
    
    [request setHTTPMethod: @"GET"];
    
    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session
                                      dataTaskWithRequest:request
                                      completionHandler:^(NSData * data, NSURLResponse * response, NSError * error) {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        
        if (httpResponse.statusCode == 200) {
            NSError *parseError = nil;
            NSArray *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSLog(@"The response is - %@", responseDictionary);
            
            NSMutableArray<NameOnlyCountry *> *results = [[NSMutableArray<NameOnlyCountry *> alloc] init];
            for (int i = 0; (i < [responseDictionary count]); i++) {
                NSDictionary *countryData = responseDictionary[i];
                NameOnlyCountry *country = [[NameOnlyCountry alloc] initWithDictionary: countryData];
                [results addObject: country];
            }
            
            NSLog(@"The counties dict is - %@", results);
            completion(results, nil);
        } else {
            NSLog(@"Error while receiveing the data");
            completion(nil, error);
        }
    }];
    
    [dataTask resume];
}

@end
