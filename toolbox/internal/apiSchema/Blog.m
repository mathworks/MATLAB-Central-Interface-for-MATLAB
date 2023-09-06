classdef Blog < Artifact
    properties(GetAccess=public, SetAccess = private)
        BlogName (1,1) string;
        BlogUrl (1,1) matlab.net.URI;
        CommentCount (1,1) double;
        Viewcount (1,1) double;
    end
    
    methods
        function obj = Blog(item)
            % Blog contains information about a item in Blogs
            obj@Artifact(item);

            obj.BlogName= item.blog_name;
            obj.BlogUrl = item.blog_url;
            obj.CommentCount = item.comment_count;
            obj.Viewcount = item.view_count;
        end
    end
end


