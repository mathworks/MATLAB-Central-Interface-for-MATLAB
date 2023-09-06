classdef CommunityHighlight < Artifact
    properties(GetAccess=public, SetAccess = private)
        HighlightType (1,1) string;
        ReplyCount (1,1) double;
        ViewCount (1,1) double;
        VoteCount (1,1) double;
    end

    methods
        function obj = CommunityHighlight(item)
            % CommunityHighlight contains information about a item in
            % Community Highlights
            obj@Artifact(item);

            obj.HighlightType= item.highlight_type ;
            obj.ReplyCount = item.reply_count;
            obj.ViewCount = item.view_count;
            obj.VoteCount = item.vote_count;
        end
    end
end


