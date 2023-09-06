classdef CommunityContest < Artifact
    properties(GetAccess=public, SetAccess = private)
        ReplyCount (1,1) double;
        ViewCount (1,1) double;
        VoteCount (1,1) double;
    end

    methods
        function obj = CommunityContest(item)
            % CommunityContest contains information about a item in
            % Community Contests
            obj@Artifact(item);

            obj.ReplyCount = item.reply_count;
            obj.ViewCount = item.view_count;
            obj.VoteCount = item.vote_count;
        end
    end
end


