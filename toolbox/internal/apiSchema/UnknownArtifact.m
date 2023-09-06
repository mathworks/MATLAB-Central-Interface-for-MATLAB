classdef UnknownArtifact < Artifact
    %UNKNOWNARTIFACT Summary of this class goes here
    %   Detailed explanation goes here

    properties
        Fields
    end

    methods
        function obj = UnknownArtifact(item)
            %UNKNOWNARTIFACT Construct an instance of this class
            %   Detailed explanation goes here
            obj@Artifact(item);
            obj.Fields = item;
        end
    end
end