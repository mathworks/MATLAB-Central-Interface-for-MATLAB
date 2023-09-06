classdef File < Artifact
    properties(GetAccess=public, SetAccess = private)
        CommentCount (1,1) double;
        DownloadCount (1,1) double;
        Rating (1,1) double;
        RatingCount (1,1) double;
        Version (1,1) string;
    end

    methods
        function obj = File(item)
            % File contains information about a item in File Exchange
            obj@Artifact(item);

            obj.CommentCount= item.comment_count ;
            obj.DownloadCount = item.download_count;
            obj.Rating = item.rating;
            obj.RatingCount = item.rating_count;
            obj.Version = item.version;
        end
    end
end


