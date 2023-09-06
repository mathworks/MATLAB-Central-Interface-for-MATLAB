classdef searchApiTest < matlab.unittest.TestCase
    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        function SimpleRequestTest(testCase)
            import matlab.unittest.constraints.HasField
            searchResults = SearchApi.search();
            
            verifyClass(testCase,searchResults,"struct")
            verifyNotEmpty(testCase,searchResults)
            
            verifyThat(testCase,searchResults,HasField("items"))
            verifyThat(testCase,searchResults,HasField("total_found"))
            verifyThat(testCase,searchResults,HasField("has_more"))
            
            verifyNotEmpty(testCase,searchResults.items)
            verifyNotEmpty(testCase,searchResults.total_found)
            verifyNotEmpty(testCase,searchResults.has_more)
        end

        function TestResultTypes(testCase)
            query = "plotting";
            scope = "file-exchange,matlab-answers";
            created_before = datetime('12-Mar-2023 11:00:00');
            created_after = datetime('06-Mar-2022 11:00:00');
            sort_order = "created asc";
            page = 2;
            count = 15;
            searchResults = SearchApi.search(query=query,scope=scope,created_before=created_before,created_after=created_after,sort_order=sort_order,page=page,count=count);
            verifyClass(testCase,searchResults.items,"Artifact","Expected an mixed array of Artifacts")
            verifyClass(testCase,searchResults.items([searchResults.items.Type] == "question"),"Question","Expected some results to be a Question")
            verifyClass(testCase,searchResults.items([searchResults.items.Type] == "file"),"File","Expected some results to be a File")

            searchResults = SearchApi.search(scope="matlab-answers");
            verifyClass(testCase,searchResults.items,"Question","Expected first result to be a Question")

            searchResults = SearchApi.search(scope="file-exchange");
            verifyClass(testCase,searchResults.items,"File","Expected scope=file-exchange to be a File")

            searchResults = SearchApi.search(scope="blogs");
            verifyClass(testCase,searchResults.items,"Blog","Expected scope=log to be a Blog")

            searchResults = SearchApi.search(scope="cody");
            verifyClass(testCase,searchResults.items,"Problem","Expected scope=problem to be a Problem")

            searchResults = SearchApi.search(scope="community-highlights");
            verifyClass(testCase,searchResults.items,"CommunityHighlight","Expected scope=community-highlights to be a CommunityHighlight")

            searchResults = SearchApi.search(scope="community-contests");
            verifyClass(testCase,searchResults.items,"CommunityContest","Expected scope=community-contests to be a CommunityContest")
        end

        function ErrorTest(testCase)
            verifyError(testCase,@() SearchApi.search(scope="foo"), 'Scope:notSupported')
        end        
    end
end