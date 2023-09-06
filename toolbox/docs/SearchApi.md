# Search
```matlab
SearchAPI.search
```

## Methods
* [Search](SearchApi.md#search)

# Search
Search MATLAB Central artifacts that match a specified query. Areas you can search include MATLAB Answers, File Exchange, Blogs, Cody, Community Highlights, and Community Contests. All parameters are optional. When no parameters are specified, all results from MATLAB Central are returned.

### Parameters

Name | Type | Description  | Notes
------------- | ------------- | ------------- | -------------
 **query** | **String**| Enter keywords to search. Separate multiple keywords with space or comma. | [optional] 
 **scope** | **String**| A comma-separated list of MATLAB Central areas to search within. | [optional] [default to all]
 **tags** | **String**| A comma-separated list of tags. MATLAB Central areas that do not support tags are excluded from the result set. | [optional] 
 **created_before** | **String**| Content that was created before this date and time, specified in ISO 8601 format. | [optional] 
 **created_after** | **String**| Content that was created after this date and time, specified in ISO 8601 format. | [optional] 
 **sort_order** | **String**| Items returned in the response can be ordered by created date, updated date, or relevance and sorted in ascending or descending order.| [optional] [If sort_order is not specified and there is no value in the query parameter, results are sorted by updated date in descending order. However, if sort_order is not specified and there is a value in query, the default sort changes to relevance in descending order.]
 **page** | **String**| The page number indicating which page of items to be returned in the result set, specified as a valid positive number. | [optional] [default to 1]
 **count** | **String**| The number of items to return in the result set, specified as a value between 1 and 50. The default value is 10. | [optional] [default to 10]

### Example Usage
```matlab
searchResults = SearchApi.search
items = search_results.items
```
### Return type

[**SearchResults**](schemaDocs/SearchResults.md)

Each of the items returned can be one of the following artifact types:

* [Question](schemaDocs/Question.md)
* [File](schemaDocs/File.md)
* [Problem](schemaDocs/Problem.md)
* [Blog](schemaDocs/Blog.md)
* Topic which can be a [**CommunityHighlight**](schemaDocs/CommunityHighlight.md) or [**CommunityContest**](schemaDocs/CommunityContest.md)

The value for the scope parameter determines which artifacts are returned.

### Possible Errors

When the API returns a non 2XX response code, an [ApiError](schemaDocs/ApiError.md) is thrown. The ApiError object is an extension of the MException object and contains all the fields from MException and additional retrievable fields with information on how to handle the error.
See [API Documentation](https://api.mathworks.com/community) for more details on possible error codes.

