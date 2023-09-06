classdef ConvertToISODateTimeTest < matlab.unittest.TestCase

    methods (TestClassSetup)
        % Shared setup for the entire test class
    end

    methods (TestMethodSetup)
        % Setup for each test
    end

    methods (Test)
        % Test methods

        function testConversionOfLocalTime(testCase)
            % Due to daylight savings, the expected result won't be consistent, so we have to calculate it
            expectedResult = datetime("06/23/2023 07:00:00","InputFormat","MM/dd/uuuu HH:mm:ss","TimeZone","local");
            expectedResult.TimeZone = "UTC";
            expectedResult = string(expectedResult,"yyyy-MM-dd'T'HH:mm:ss'Z'");

            % Convert an unzoned local datetime
            testTime = datetime("06/23/2023 07:00:00","InputFormat","MM/dd/uuuu HH:mm:ss");
            verifyEmpty(testCase,testTime.TimeZone);
            actual = convertToISODateTime(testTime);
            verifyEqual(testCase,actual, expectedResult)

            % Convert a zoned local datetime
            testTime = datetime("06/23/2023 07:00:00","InputFormat","MM/dd/uuuu HH:mm:ss","TimeZone","local");
            actual = convertToISODateTime(testTime);
            verifyEqual(testCase,actual, expectedResult)

            % Convert a UTC datetime
            testTime = datetime("06/23/2023 11:00:00","InputFormat","MM/dd/uuuu HH:mm:ss","TimeZone","UTC");
            actual = convertToISODateTime(testTime);
            verifyEqual(testCase,actual, expectedResult)

            % Convert a zoned australian datetime
            testTime = datetime("06/23/2023 07:00:00","InputFormat","MM/dd/uuuu HH:mm:ss","TimeZone","local");
            testTime.TimeZone = "Australia/Sydney";
            actual = convertToISODateTime(testTime);
            verifyEqual(testCase,actual, expectedResult)
            
        end
    end

end