# IRCollectTool

A quick and dirty PowerShell script to collect and analyse artefacts from a Windows system

## Install

The install script will clone the relevant tools into the the repo directory and can then be used by the script.

You will have to manually download and copy the [KAPE](https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape) application into the folder 



## Usage 

The script will run a series of tools and will provide and option to save the results to either a network share or locally to the script folder 

## Tools currently included

- [Kansa](https://github.com/davehull/Kansa) 
- [KAPE](https://www.kroll.com/en/services/cyber-risk/incident-response-litigation-support/kroll-artifact-parser-extractor-kape) (Needs to be manually added) 
- [DeepBlueCLI](https://github.com/sans-blue-team/DeepBlueCLI)
- [WinPmem](https://github.com/Velocidex/WinPmem)

