function items = itemFactory(itemArray)
    %ITEMFACTORY Construct appropriate class based on the artifact_type
    cItems = size(itemArray,1);
    items = Artifact.empty(0,cItems);
    for iItem = 1:cItems
        if iscell(itemArray)
            item = itemArray{iItem};
        else
            item = itemArray(iItem);
        end
        % We shouldn't need a switch if the class names matched the aritifact types
        switch item.artifact_type
            case 'question'
                items(iItem) = Question(item);
            case 'file'
                items(iItem) = File(item);
            case 'blog'
                items(iItem) = Blog(item);
            case 'problem'
                items(iItem) = Problem(item);
            case 'topic'
                switch item.scope
                    case 'community-highlights'
                        items(iItem) = CommunityHighlight(item);
                    otherwise
                        items(iItem) = CommunityContest(item);
                end
            otherwise
                items(iItem) = UnknownArtifact(item);
        end
    end
end
