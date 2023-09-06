classdef Question < Artifact
    properties(GetAccess=public, SetAccess = private)
        AnswerCount (1,1) double;
        CommentCount (1,1) double;
        IsAccepted (1,1) logical;
        IsAnswered (1,1) logical;
        ViewCount (1,1) double;
        VoteCount (1,1) double;
    end

    methods
        function obj = Question(item)
            % Question Contains information about a question on MATLAB Answers
            obj@Artifact(item);

            obj.AnswerCount = item.answer_count;
            obj.CommentCount= item.comment_count ;
            obj.IsAccepted = item.is_accepted;
            obj.IsAnswered = item.is_answered;
            obj.ViewCount = item.view_count;
            obj.VoteCount = item.vote_count;

        end
    end
end


