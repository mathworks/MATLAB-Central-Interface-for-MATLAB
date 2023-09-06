classdef Artifact < matlab.mixin.Heterogeneous

    properties(GetAccess=public, SetAccess = private)
        Type (1,1) string;
        Author Author = Author.empty();
        CreatedDate (1,1) datetime;
        Description (1,1) string;
        Id (1,1) double;
        Scope (1,1) string;
        Tags (:,1) string;
        Title (1,1) string;
        UpdatedDate (1,1) datetime;
        Url (1,1) matlab.net.URI;
    end

    methods
        function obj = Artifact(item)
            %ARTIFACT contains common information across all items
            obj.Type = item.artifact_type;
            obj.Author = Author(item.author);
            obj.CreatedDate = convertISOToLocalDateTime(item.created_date);
            obj.Description = item.description;
            if isfield(item,"id")
                obj.Id = item.id;
            end
            obj.Scope = item.scope;
            if isfield(item,"tags")
                obj.Tags = item.tags;   
            end
            obj.Title = item.title;
            obj.UpdatedDate = convertISOToLocalDateTime(item.created_date);
            obj.Url = item.url;
        end
    end
end