# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and adheres to a project-specific [Versioning](/README.md).

## [Unreleased]

### Fixed

- Fixed TestsRuleset package so the main `.globalconfig` is inherited and then overwritten by the tests-specific rules and not the other way around

### Changed

- Updated `SonarAnalyzer.CSharp` to latest minor version (8.56.0.67649)
- Updated `StyleCop.Analyzers` to latest available version (1.2.0-beta.507)
- Changed `.globalconfig` file names to match NuGet package names as recommended by Microsoft
- Currently active `.globalconfig` is now linked in the solution explorer and therefore quickly accessible from within the IDE

### Added

- S1133: Deprecated code should be removed
- S2094: Classes should not be empty
- S2166: Classes named like "Exception" should extend "Exception" or a subclass
- S2198: Silly mathematical comparisons should not be made
- S2445: Blocks should be synchronized on read-only fields
- S2970: Assertions should be complete
- S3063: "StringBuilder" data should be used
- S3398: "private" methods called only by inner classes should be moved to those classes
- S3878: Arrays should not be created for params parameters
- S4545: "DebuggerDisplayAttribute" strings should reference existing members
- S4663: Comments should not be empty
 -S5856: Regular expressions should be syntactically valid

### Removed

- SA1518: Use line endings correctly at end of file

## [3.0.1] - 2023-07-12

### Added

- Notification for Slack channel upon new releases

### Changed

- Changed "S3242: Method parameters should be declared with base types" to `suggestion`
- Changed "S3257: Declarations and initializations should be as concise as possible" to `suggestion`
- Changed "S3267: Loops should be simplified with "LINQ" expressions" to `suggestion`

## [3.0.0] - 2023-06-28

### Changed

- Stopped changing all rules to error first and instead use the default rulesets of the Analyzers as the base rules
- Migrate from \*.ruleset files to \*.globalconfig files
- Migrate from \*.targets to \*. props files
- Simplified and decluttered README file

### Removed

- Removed FxCop Analyzer because it is now bundled with .NET SDK

## [2.7.1] - 2023-06-14

### Added

- Changelog

[unreleased]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.1...HEAD
[3.0.1]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.0...v3.0.1
[3.0.0]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v2.7.1...v3.0.0
[2.7.1]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v2.7.0...v2.7.1
