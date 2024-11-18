# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and adheres to a project-specific [Versioning](/README.md).

## [Unreleased]

## [3.2.1] - 2024-11-18

### Fixed

- Do not treat NU1901, NU1902, NU1903 and NU1904 warnings as errors in "Release" configuration

## [3.2.0] - 2024-10-11

### Changed

- Updated SonarAnalyzer.CSharp to version 9.20.0.85982

### Added

- S2925: "Thread.Sleep" should not be used in tests
- S3363: Date and time should not be used as a type for primary keys
- S6561: Avoid using "DateTime.Now" for benchmarking or timing operations
- S6562: Always set the "DateTimeKind" when creating new "DateTime" instances
- S6575: Use "TimeZoneInfo.FindSystemTimeZoneById" without converting the timezones with "TimezoneConverter"
- S6580: Use a format provider when parsing date and time
- S6588: Use the "UnixEpoch" field instead of creating "DateTime" instances that point to the beginning of the Unix epoch
- S6607: The collection should be filtered before sorting by using "Where" before "OrderBy"
- S6609: "Min/Max" properties of "Set" types should be used instead of the "Enumerable" extension methods
- S6610: "StartsWith" and "EndsWith" overloads that take a "char" should be used instead of the ones that take a "string"
- S6612: The lambda parameter should be used instead of capturing arguments in "ConcurrentDictionary" methods
- S6613: "First" and "Last" properties of "LinkedList" should be used instead of the "First()" and "Last()" extension methods
- S6617: "Contains" should be used instead of "Any" for simple equality checks
- S6618: "string.Create" should be used instead of "FormattableString"
- S6640: Using unsafe code blocks is security-sensitive
- S6797: Blazor query parameter type should be supported
- S6798: [JSInvokable] attribute should only be used on public methods
- S6800: Component parameter type should match the route parameter type constraint
- S6803: Parameters with SupplyParameterFromQuery attribute should be used only in routable components

### Removed

- S2228: Console logging should not be used
- S2255: Writing cookies is security-sensitive
- S3884: "CoSetProxyBlanket" and "CoInitializeSecurity" should not be used
- S4564: ASP.NET HTTP request validation feature should not be disabled
- S4784: Using regular expressions is security-sensitive
- S4787: Encrypting data is security-sensitive
- S4818: Using Sockets is security-sensitive
- S4823: Using command line arguments is security-sensitive
- S4829: Reading the Standard Input is security-sensitive
- S4834: Controlling permissions is security-sensitive

## [3.1.2] - 2024-10-03

### Removed

- (Tests ruleset only) S4144: Methods should not have identical implementations, because when using parameterised tests it can make sense to have different test methods with different parametrization but using the same implementation.

## [3.1.1] - 2024-09-20

### Changed

- Updated `S1133` to `suggestion`, because while we do want deprecated code to be removed eventually, marking code as obsolete should not immediately break the build.

## [3.1.0] - 2024-09-19

### Fixed

- Fixed TestsRuleset package so the main `.globalconfig` is inherited and then overwritten by the tests-specific rules and not the other way around

### Changed

- Updated `SonarAnalyzer.CSharp` to latest minor version (8.56.0.67649)
- Changed from `StyleCop.Analyzers` package to `StyleCop.Analyzers.Unstable` and update to latest available version (1.2.0.556)
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
- S5856: Regular expressions should be syntactically valid
- CA2000: Dispose objects before losing scopes

### Removed

- SA1518: Use line endings correctly at end of file

## [3.0.5] - 2023-09-28

### Fixed

- Misplaced `Configuration` element in `*.props` file in previous release, causing all projects to fail build

## [3.0.4] - 2023-09-27

### Fixed

- If build configuration is not passed explicitly, it should be like passing `Debug`

### Changed

- The XML documentation can be generated in all build configurations, there is no need to restrict it.

## [3.0.3] - 2023-07-20

### Fixed

- In some cases the XML documentation file had a bad file name when the `$(AssemblyName)` variable was not set during the build process

## [3.0.2] - 2023-07-17

### Fixed

- Fixed TestsRuleset so the tests-specific rules override the regular rules and not the other way around

### Removed

- CA2253: Named placeholders should not be numeric values
- CA2254: Template should be a static expression
- SA1518: Use line endings correctly at end of file (removed in favor of S113)

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

[unreleased]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.2.1...HEAD
[3.1.0]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.5...v3.1.0
[3.0.5]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.4...v3.0.5
[3.0.4]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.3...v3.0.4
[3.0.3]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.2...v3.0.3
[3.0.2]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.1...v3.0.2
[3.0.1]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.0.0...v3.0.1
[3.0.0]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v2.7.1...v3.0.0
[2.7.1]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v2.7.0...v2.7.1
[3.2.1]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.2.0...v3.2.1
[3.2.0]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.1.2...v3.2.0
[3.1.2]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.1.1...v3.1.2
[3.1.1]: https://github.com/neolution-ch/Neolution.CodeAnalysis/compare/v3.1.1-alpha.0...v3.1.1
