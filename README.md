
[![View MATLAB-Central-Interface-for-MATLAB on File Exchange](https://www.mathworks.com/matlabcentral/images/matlab-file-exchange.svg)](https://www.mathworks.com/matlabcentral/fileexchange/135567-matlab-central-interface-for-matlab)

# MATLAB Central Interface for MATLAB
The toolbox provides easy to use MATLAB&reg; functions that simplify the process of making requests to the [MATLAB Central (MathWorks&reg; Community) APIs](https://api.mathworks.com/community/docs). Whether you are using the APIs for data-analysis/reporting or for building custom MATLAB apps, the toolbox provides for a smooth integration.

- MATLAB Central Interface for MATLAB
  - [Requirements](#requirements)
  - [Installation](#installation)
  - [Usage](#usage)
  - [SDK Reference](#sdk-reference)
    - [Search](#search)

## Installation

1. Install the toolbox by using the Add-on explorer in MATLAB or by downloading the  **MATLAB_Central_Interface_For_MATLAB.mltbx** file attached to the latest release on GitHub, then doubleclicking on it.

## Quick Usage

1. Create a MATLAB script or live-script called 'Quickstart'.

2. Add the following lines of code to your script

```matlab
searchResults = SearchApi.search(scope="matlab-answers");
items = searchResults.items
```
3. Save and Run the script.

4. If the code executed successfully, you should see the 'items' being displayed which calls the Seach endpoint from the MATLAB Central Public APIs.

This is just a quick overview -- install and look at gettingStarted.mlx and the examples directory for more information on using the Toolbox.

## SDK Reference

Class | Method | HTTP request | Description
------------ | ------------- | ------------- | -------------
*SearchApi* | [**search**](toolbox/docs/SearchApi.md#search) | **GET** /v1/search | Search MATLAB Central areas for content matching specified query

### Search
* [Search]

The Search collection offers a single method called `search` which offers a powerful way to programmatically search MATLAB Central. 

If you are looking to  get data from  different MATLAB Central areas like MATLAB Answers, File Exchange, Cody, Community Highlights, Community Contests and Blogs with a single call, this would be the function to use. The function also supports many optional parameters that allow you to further filter the data returned, including limiting the scope to specific MATLAB Central areas.

[Search]:toolbox/docs/SearchApi.md

## Errors

When the API returns a non 2XX response code, an [ApiError](toolbox/docs/schemaDocs/ApiError.md) is thrown. The ApiError object is an extension of the MException object and contains all the fields from MException and additional retrievable fields with information on how to handle the error.
See [API Documentation](https://api.mathworks.com/community) for more details on possible error codes.

## Contribution
We are excited to hear any feedback you have for us and welcome contributions in the form of issues.

## License

The license is available in the License file within this repository

Copyright &copy; 2023 The MathWorks, Inc.
