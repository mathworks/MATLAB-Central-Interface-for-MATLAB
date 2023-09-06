classdef ApiErrorDetail
    properties
        ErrorCode string
        Message string
        Details string
    end
    
    methods
        function obj = ApiErrorDetail(error)
            obj.ErrorCode = error.error_code;
            obj.Message = error.message;
            obj.Details = error.details;
        end
    end
end

