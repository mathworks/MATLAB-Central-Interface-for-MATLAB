classdef Problem < Artifact
    properties(GetAccess=public, SetAccess = private)
        CommentCount (1,1) double;
        LikeCount (1,1) double;
        SolverCount (1,1) double;
    end

    methods
        function obj = Problem(item)
            % Problem contains information about a item in Cody
            obj@Artifact(item);

            obj.CommentCount = item.comment_count;
            obj.LikeCount = item.like_count;
            obj.SolverCount = item.solver_count;
        end
    end

end


