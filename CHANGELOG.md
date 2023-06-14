# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/)
and adheres to a project-specific [Versioning](/README.md).

## [Unreleased]

### Changed

- Stopped changing all rules to error first and instead use the default rulesets of the Analyzers as the base ru
- Migrate from *.ruleset files to *.globalconfig files
- Migrate from *.targets to *. props files
- Simplified and decluttered README file

### Removed

- Removed FxCop Analyzer because it is now bundled with .NET SDK
