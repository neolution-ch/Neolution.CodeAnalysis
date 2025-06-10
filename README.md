# Neolution Code Analysis Rulesets

[![NuGet](https://img.shields.io/nuget/v/Neolution.CodeAnalysis.svg)](https://www.nuget.org/packages/Neolution.CodeAnalysis/)
[![NuGet](https://img.shields.io/nuget/v/Neolution.CodeAnalysis.TestsRuleset.svg)](https://www.nuget.org/packages/Neolution.CodeAnalysis.TestsRuleset/)

**Neolution.CodeAnalysis** provides a plug-and-play code analysis standard for .NET projects. By adding this package, you instantly enforce consistent, high-quality code with minimal setup—no need to maintain your own ruleset or configuration. The package includes:

- Pre-configured Roslyn analyzers (StyleCop, SonarSource)
- Strict and up-to-date rules for code quality and security
- Automatic conversion of warnings to errors (except in Debug)
- A single source of truth for code style and best practices
- Easy updates: just bump the package version to get the latest rules

**Why use this package?**

- Save time on code reviews by catching issues early
- Ensure all projects follow the same standards
- Reduce technical debt and improve maintainability
- Onboard new developers faster with clear, enforced guidelines
- **Flexible:** You can override any rules or severities in your own `.editorconfig` files at the project or solution level to fit your team's needs.

## Packages

- **[Neolution.CodeAnalysis](https://www.nuget.org/packages/Neolution.CodeAnalysis/):** For libraries, tools, web, UI, and other projects.
- **[Neolution.CodeAnalysis.TestsRuleset](https://www.nuget.org/packages/Neolution.CodeAnalysis.TestsRuleset/):** For test projects (less strict rules).

## Installation

Install via NuGet Package Manager:

```shell
Install-Package Neolution.CodeAnalysis
```

or for test projects:

```shell
Install-Package Neolution.CodeAnalysis.TestsRuleset
```

Or add the following to your `.csproj`:

```xml
<ItemGroup>
  <PackageReference Include="Neolution.CodeAnalysis" Version="*">
    <PrivateAssets>all</PrivateAssets>
    <IncludeAssets>runtime; build; native; contentfiles; analyzers; buildtransitive</IncludeAssets>
  </PackageReference>
</ItemGroup>
```

## Versioning

- **MAJOR**: Incompatible changes, may require significant refactoring
- **MINOR**: New rules or rule changes, may break the build
- **PATCH**: Safe to update, only disables or lowers severity of rules

See [CHANGELOG.md](./CHANGELOG.md) for details.

## License

This project is licensed under the [MIT License](./LICENSE).

## Contributing

Contributions, issues, and feature requests are welcome! Please open an issue or pull request on [GitHub](https://github.com/neolution-ch/Neolution.CodeAnalysis).

> **Note:** The ruleset is intentionally opinionated and curated by Neolution to reflect our collective experience and values. While we welcome feedback and suggestions, changes to the rules themselves are carefully considered to maintain consistency across projects. If your requirements differ significantly, you are welcome to fork the package and adapt it to your needs.

## Links

- [Source on GitHub](https://github.com/neolution-ch/Neolution.CodeAnalysis)
- [NuGet: Neolution.CodeAnalysis](https://www.nuget.org/packages/Neolution.CodeAnalysis/)
- [NuGet: Neolution.CodeAnalysis.TestsRuleset](https://www.nuget.org/packages/Neolution.CodeAnalysis.TestsRuleset/)