function unzonedDateTime = convertISOToLocalDateTime(iso8601UTC)
    try
         % Create the datetime from the UTC ISO 8601 string
          unzonedDateTime = datetime(iso8601UTC,'InputFormat','uuuu-MM-dd''T''HH:mm:ssZ','TimeZone','UTC');
         % Convert to local time
          unzonedDateTime.TimeZone = "local";
         % Remove the time zone to make it easier for MATLAB users to work with
          unzonedDateTime.TimeZone = "";
    catch ME
        if (strcmp(ME.identifier,'MATLAB:datetime:ParseErr'))
            unzonedDateTime = "";
        end
    end
end
