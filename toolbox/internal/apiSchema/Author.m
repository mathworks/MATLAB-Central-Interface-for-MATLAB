classdef Author
    properties
        AuthorId (1,1) double;
        AuthorUrl (1,1) matlab.net.URI;
        AuthorName (1,1) string;
    end
    
    methods
        function obj = Author(author_info)
            %% construct
            %% Description: Construct a struct that represents the Author model with keys defined and defaults populated.
            obj.AuthorId = author_info.author_id;
            obj.AuthorUrl = author_info.author_url;
            obj.AuthorName = author_info.author_name;
        end
    end
end

           