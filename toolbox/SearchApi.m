%%
classdef SearchApi
    methods(Static)
        function [Body,StatusCode,Headers] = search(optionalArguments)
            
        % search  Search MATLAB Central areas for content matching specified query.
        %     Results = search(optionalArguments) 
        %     [Results,StatusCode] = search(optionalArguments)
        %     [Results,StatusCode,Headers] = search(optionalArguments)
        %
        %     Required Argument(s):
        %
        %       
        %     OptionalArgument(s):
        %         query (String) - Enter keywords to search. Separate multiple keywords with space or comma.
        %         scope (String) - A comma-separated list of MATLAB Central areas to search within.
        %         tags (String) - A comma-separated list of tags. MATLAB Central areas that do not support tags are excluded from the result set.
        %         created_before (Datetime) - Content that was created before this date and time, specified in ISO 8601 format.
        %         created_after (Datetime) - Content that was created after this date and time, specified in ISO 8601 format.
        %         sort_order (String) - &lt;p&gt;Items returned in the response can be ordered by created date, updated date, or relevance and sorted in ascending or descending order.&lt;/p&gt;&lt;p&gt;If &lt;var&gt;sort_order&lt;/var&gt; is not specified and there is no value in the query parameter, results are sorted by updated date in descending order. However, if &lt;var&gt;sort_order&lt;/var&gt; is not specified and there is a value in query, the default sort changes to relevance in descending order.&lt;/p&gt;
        %         page (Number) - The page number indicating which page of items to be returned in the result set, specified as a valid positive number.
        %         count (Number) - The number of items to return in the result set, specified as a value between 1 and 50. The default value is 10.
        %
        %      e.g. optionalArguments = struct('query', queryvalue, 'scope', scopevalue, 'tags', tagsvalue, 'created_before', created_beforevalue, 'created_after', created_aftervalue, 'sort_order', sort_ordervalue, 'page', pagevalue, 'count', countvalue)
        
        arguments
            optionalArguments.query (1,1) string;
            optionalArguments.scope (1,1) string {mustBeMemberOfValidScopes};
            optionalArguments.tags (1,1) string;
            optionalArguments.created_before (1,1) datetime {mustBeA(optionalArguments.created_before,"datetime")};
            optionalArguments.created_after (1,1) datetime {mustBeA(optionalArguments.created_after,"datetime")};
            optionalArguments.sort_order (1,1) string {mustBeMember(optionalArguments.sort_order,["created asc", "created desc", "updated asc", "updated desc", "relevance asc", "relevance desc"])};
            optionalArguments.page (1,1) double {mustBeInteger, mustBeNonzero};
            optionalArguments.count (1,1) double {mustBeInteger, mustBeNonzero, mustBeLessThanOrEqual(optionalArguments.count, 50)};
        end

        httpMethod = "GET";
        relativePath = "/v1/search";
               
        [Body,StatusCode,Headers] = sendRequest(httpMethod, relativePath, optionalArguments);

      end

    end

end

 % Custom validation function for scope
 function mustBeMemberOfValidScopes(scope)
    validScopes = ["matlab-answers", "file-exchange", "cody", "blogs", "community-contests", "community-highlights"];
    scopeArr = strtrim(split(scope,","));
    if ~all(ismember(scopeArr,validScopes))
        errID = 'Scope:notSupported'; 
        msgtext = 'Invalid value for scope argument. All values must be a member of this set:%s'; 
        ME = MException(errID,msgtext,validScopes.join(",")); 
        throw(ME); 
    end
 end







