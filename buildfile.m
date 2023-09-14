function plan = buildfile
    % Create a plan from the task functions
    plan = buildplan(localfunctions);
    
    % Make the "test" task the default task in the plan
    plan.DefaultTasks = "test";

    %consider adding build as a dependency for TEST
    % Make the "release" task dependent on the check, test, and help tasks
    plan("release").Dependencies = ["check" "test" "help"];
end
    
    function checkTask(~)
        % Identify code issues
        issues = codeIssues;
        assert(isempty(issues.Issues),formattedDisplayText( ...
            issues.Issues(:,["Location" "Severity" "Description"])))
    end
    
    function testTask(~)
        % Run unit tests
        results = runtests(IncludeSubfolders=true,OutputDetail="terse");
        results.assertSuccess();
    end

    function helpTask(~)
        % Run and export the live script examples as HTML documentation
        exampleSource = fullfile("toolbox", "examples","*.mlx");
        examples = dir(exampleSource);
        examples = string({examples.name})';
        
        % add the gettingStarted.mlx
        examples = [examples ; fullfile("toolbox", "gettingStarted.mlx")];

        % Move the error handling example to the end -- it disrupts the other examples
        errorExampleIndex = find(contains(examples,"errorHandling"));
        examples(end + 1) = examples(errorExampleIndex);
        examples(errorExampleIndex) = [];

        for iExample = 1:height(examples)
            % create HTML file name
            [~,exampleFileName] = fileparts(examples(iExample));
            htmlFilePath = fullfile("toolbox", "docs", "html", exampleFileName + ".html");
            export(examples(iExample), htmlFilePath, format="html", Run=true);
        end
    end
    
    function releaseTask(~)
        % Create a release and put it in the release directory
        if ~exist("release","dir")
            mkdir("release");
        end
        opts = matlab.addons.toolbox.ToolboxOptions("toolboxPackaging.prj");

        % By default, the packaging GUI restricts the name of the getting started guide, so we fix that here.
        opts.ToolboxGettingStartedGuide = fullfile("toolbox", "gettingStarted.mlx");
        
        % Replace spaces with underscores to be GitHub friendly and move to releases directory
        newMltbxFilename = strrep(opts.ToolboxName," ","_");

        % Put the MLTBX in the release directory.
        opts.OutputFile = fullfile("release",newMltbxFilename + ".mltbx");
        
        matlab.addons.toolbox.packageToolbox(opts);
    end
    