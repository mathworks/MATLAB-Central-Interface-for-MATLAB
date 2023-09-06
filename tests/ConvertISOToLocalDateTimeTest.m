classdef ConvertISOToLocalDateTimeTest < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function testConversionOfDateTime(testCase)
            % test with valid isoDate
            isoDateUTC = "2022-04-08T19:03:58Z";
            expected = datetime(isoDateUTC,'InputFormat','uuuu-MM-dd''T''HH:mm:ssZ','TimeZone','local');
            expected.TimeZone = "";
            
            actual = convertISOToLocalDateTime(isoDateUTC);
            verifyEqual(testCase,actual, expected)           

           % test with invalid isoDate
           isoDateUTC = "2033-02-23T";
           actual = convertISOToLocalDateTime(isoDateUTC);
           verifyEqual(testCase,actual, "")      
        end
    end

end