function [Body, StatusCode, Headers]  = sendRequest(httpMethod, relativePath, optionalArgs)
  % Base path for all API requests
  basePath = "https://api.mathworks.com/community";

  % Construct the HTTP request object
  requestObj = matlab.net.http.RequestMessage; 
  requestObj.Method = httpMethod;  
  requestObj.Header = [requestObj.Header, matlab.net.http.HeaderField("Content-Type","application/json"), matlab.net.http.HeaderField("Accept","application/json"), matlab.net.http.HeaderField("MLC-SDK-Id","ml-sdk")];

  % If created_before is present, convert to ISO 8601 format
  if isfield(optionalArgs, 'created_before')
     optionalArgs.created_before = convertToISODateTime(optionalArgs.created_before);
  end
  
   % If created_after is present, convert to ISO 8601 format
  if isfield(optionalArgs, 'created_after')
      optionalArgs.created_after = convertToISODateTime(optionalArgs.created_after);
  end

  query = string(matlab.net.QueryParameter(optionalArgs));
  
  if ~isempty(query)
     query = strcat('?', query);
  end

  % Build URI 

  url = sprintf('%s%s%s%s', basePath, relativePath, query);
  uri = matlab.net.URI(url);
            
  % Send HTTP request
  response = requestObj.send(uri);
  
  % Format and assign output variables
  StatusCode = response.StatusCode;
  Body = response.Body.Data;
  Headers = response.Header;
  if StatusCode == matlab.net.http.StatusCode.OK
    Body.items = itemFactory(Body.items);
  else 
    apiError = ApiError(Body, Headers);
    throwAsCaller(apiError);  
  end
end