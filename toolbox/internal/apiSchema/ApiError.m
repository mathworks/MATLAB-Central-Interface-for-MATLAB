classdef ApiError < MException
    properties
      Status matlab.net.http.StatusCode
      ApiErrorDetail ApiErrorDetail = ApiErrorDetail.empty();
      ResponseHeaders matlab.net.http.HeaderField;

    end
    
    methods
        function obj = ApiError(body,headers)
            status =  matlab.net.http.StatusCode(body.status);
            msgText =  ['HttpError:', num2str(status), ' ', char(status)];
            obj = obj@MException('Api:HttpError', msgText)  
            obj.Status = status;
            obj.ApiErrorDetail = ApiErrorDetail(body.error);
            obj.ResponseHeaders = headers;
        end
    end
end

