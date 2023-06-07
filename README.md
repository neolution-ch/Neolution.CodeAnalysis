# Neolution Code Analysis rulesets
We maintain two (opinionated) rulesets for all our projects and distribute them, including 3rd-party Roslyn Analyzers (StyleCop and SonarSource) in two respective NuGet packages.

- For Libraries, Tools, Web, UI and other projects
  - [Neolution.CodeAnalysis](https://www.nuget.org/packages/Neolution.CodeAnalysis/)
- For projects containing automated tests (less strict rules)
  - [Neolution.CodeAnalysis.TestsRuleset](https://www.nuget.org/packages/Neolution.CodeAnalysis.TestsRuleset/)

## Our decisions and opinions
The base ruleset consists of the default ruleset of the Roslyn Analyzers we include in the NuGet package and those used in our build tools.

- We include our own opinionated ruleset with adjusted Analyzer severities as a [Global AnalyzerConfig](https://learn.microsoft.com/en-us/dotnet/fundamentals/code-analysis/configuration-files#global-analyzerconfig)
- In all build configurations other that `Debug`, warnings will be converted to errors.
- We include our own [stylecop.json](https://github.com/DotNetAnalyzers/StyleCopAnalyzers/blob/master/documentation/Configuration.md) configuration file.

## Versioning
Given a version number MAJOR.MINOR.PATCH, an incremented number for:

- MAJOR version means there are incompatible changes with the previous version,
- MINOR version means functionality and rules were added, and
- PATCH version means that the changes are all completely backwards compatible. Usually when rules were removed or lowered in severity.

### What this means in practice
1. You can (and should) always update the package to the latest PATCH version whenever you have the chance to do it. Applying a PATCH update should never break the build. 
2. Updating to the latest MINOR version can break the build. But you can expect to have Roslyn code fixes available for the changes that are needed to fix the build. Therefore, the effort should be minimal.
3. For MAJOR updates, detailed migration paths will be provided.