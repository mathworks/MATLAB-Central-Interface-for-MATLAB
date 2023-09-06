 % Convert datetime to ISO8601 dates
 function isoDateStr = convertToISODateTime(date)
    % convert zone or unzoned date to local timezone and then convert to UTC 
     date.TimeZone = "local"; 
     date.TimeZone = "UTC";
     isoDateStr = string(date,"yyyy-MM-dd'T'HH:mm:ss'Z'");
 end
