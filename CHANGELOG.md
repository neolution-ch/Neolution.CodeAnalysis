# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and adheres to a project-specific [Versioning](/README.md).

## [Unreleased]

### Added

- Notification for Slack channel upon new releases

### Changed

- Changed "S3267: Loops should be simplified with "LINQ" expressions" to `suggestion`
- Changed "S3257: Declarations and initializations should be as concise as possible" to `suggestion`

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

[unreleased]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.0...HEAD
[3.0.0]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v2.7.1...v3.0.0
[2.7.1]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v2.7.0...v2.7.1
