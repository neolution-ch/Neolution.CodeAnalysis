# Neolution Code Analysis rulesets

We maintain two general rulesets for all our projects and distribute them including the Analyzers (StyleCop, FxCop and SonarSource) in two respective NuGet packages.

- For Libraries, Tools, Web, UI and other projects
  - [Neolution.CodeAnalysis](https://www.nuget.org/packages/Neolution.CodeAnalysis/)
- For projects with automated testing 
  - [Neolution.CodeAnalysis.TestsRuleset](https://www.nuget.org/packages/Neolution.CodeAnalysis.TestsRuleset/)

## General decisions
When compiling a project with one of the packages installed, expect them to behave differently in different build configurations.

The following applies in general:
- In **Release** configuration (default configuration for build pipelines) all the rules are set to `Error`. The build will fail if at least one Analyzer raises a `Warning` or an `Error`.
- In **Debug** configuration all the rules are set to `None`. This will allow for much faster compilation time, but the build will never fail due to an Analyzer rule. Also, raised `Warning`'s will never fail the build, only `Error`'s do.

However, there are a few exceptions to the statements above.
- Rules that match the ID `*WithoutSuggestion` must always be set to `None`. They are redundant to the rule number without the "WithoutSuggestion" suffix.
- Rules that match the ID `IDE*` must never raise `Error`. Change to `Warning` instead. They are never executed on build servers. 
- Rules that match the ID `IDE*` must never be set to `Hidden`. Change it to `Information` or track the change in this document if you want to disable it.

## Versioning
Given a version number MAJOR.MINOR.PATCH, an incremented number for:

- MAJOR version means there are incompatible changes with the previous version,
- MINOR version means functionality and rules were added, and
- PATCH version means that the changes are all completely backwards compatible. Usually when rules were removed or lowered in severity.

### What this means in practice
1. You can (and should) always update the package to the latest PATCH version whenever you have the chance to do it. Applying a PATCH update should never break the build. 
2. Updating to the latest MINOR version can break the build. But you can expect to have Roslyn code fixes available for the changes that are needed to fix it again. Thus it requires minor efforts, relative to the projects size. 
3. For MAJOR updates, detailed migration paths will be provided.

## Exceptions for Release configuration
As stated in *General decisions*, in **Release** configuration, all rules will throw `Error`. With the following exceptions:

<table>
  <thead>
    <tr>
      <th>Rule ID</th><th>Action</th><th>Description/Title</th><th>Reason/Remarks</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>S4055 <br/> CA1303</td>
      <td>None</td>
      <td>Literals should not be passed as localized parameters</td>
      <td>Localization is not needed in every project and for every message. This rule disallows string literals everywhere e.g. for log messages, content that does not need to be translated etc.</td>
    </tr>
    <tr>
      <td>S1451 <br/> SA1633</td>
      <td>None</td>
      <td>Each source file should start with a header stating file ownership and the license which must be used to distribute the application</td>
      <td>Header is not needed for each file. If the source code of a project will be distributed, the text can be added to each file individually at a later point in time to satisfy this rule.</td>
    </tr>
    <tr>
      <td>SX1309 <br/> SX1309S</td>
      <td>None</td>
      <td>A field name in C# does not begin with an underscore.</td>
      <td>Field names must not begin with an underscore. The `this.` qualifier is used in favor of the underscore</td>
    </tr>
    <tr>
      <td>SX1101 <br/> IDE0003</td>
      <td>None</td>
      <td>Do not prefix local calls with `this.`.</td>
      <td>Always prefix local calls with "this.". The "this." qualifier is used in favor of the underscore.</td>
    </tr>
    <tr>
      <td>IDE0008</td>
      <td>None</td>
      <td>Use explicit type</td>
      <td>Do not force explicit type usage. Prefer using the implicit type (var) but you can use the explicit type to improve reading flow and comprehension.</td>
    </tr>
    <tr>
      <td>S1309</td>
      <td>Info</td>
      <td>Track uses of in-source issue suppressions</td>
      <td>Suppressions should be allowed, but still tracked.</td>
    </tr>
    <tr>
      <td>CA1014 <br/> S3992 <br/> S3990</td>
      <td>None</td>
      <td>Mark assemblies with CLSCompliant</td>
      <td>It is not needed to mark assemblies with CLSCompliant. We actively use libraries that are not compliant. If we mark our assemblies as CLS compliant we cannot use these anymore.</td>
    </tr>
    <tr>
      <td>S2221 <br/> CA1031</td>
      <td>None</td>
      <td>"Exception" should not be caught when not required by called methods</td>
      <td>This rule probably originates from Java where you have to declare the Exception that will be throwed by a method and will subsequently being checked by the compiler.</td>
    </tr>
    <tr>
      <td>CA2210</td>
      <td>None</td>
      <td>Assemblies should have valid strong names</td>
      <td>Strong names are usually not needed for our typical deployments.</td>
    </tr>
    <tr>
      <td>CA1020</td>
      <td>None</td>
      <td>Avoid namespaces with few types</td>
      <td>It happens often that a namespace contains only a few classes, but is extended later during development. Merging it with some parent namespace at first and extracting to separate namespace later (when there are enough classes), is just a pain and unnecessary waste of time.</td>
    </tr>
    <tr>
      <td>CA1024</td>
      <td>None</td>
      <td>Use properties where appropriate</td>
      <td>Developers can make a correct decision when the property is a better option than a method.</td>
    </tr>
    <tr>
      <td>CA1054 <br/> CA1056 <br/> S3996 <br/> S3994</td>
      <td>None</td>
      <td>URI properties or parameters should not be strings</td>
      <td>The team decided to drop this rule due to inconveniences resulting from System.Uri not having a parameterless constructor.</td>
    </tr>
    <tr>
      <td>CA2234</td>
      <td>None</td>
      <td>Pass System.Uri objects instead of strings</td>
      <td>Dropped in favor of S4005</td>
    </tr>
    <tr>
      <td>S3235</td>
      <td>None</td>
      <td>Redundant parentheses should not be used</td>
      <td>The team decided to drop this rule because most of the team members are used to write redundant parentheses.</td>
    </tr>
    <tr>
      <td>CA2227 <br/> S4004</td>
      <td>None</td>
      <td>Collection properties should be read only</td>
      <td>The team decided to drop this rule due to the additional effort that is needed to write methods that add items for these type of properties.</td>
    </tr>
    <tr>
      <td>IDE0045 <br/> IDE0046</td>
      <td>None</td>
      <td>Convert to conditional expression</td>
      <td>Conflicts with rule S3358.</td>
    </tr>
    <tr>
      <td>CA1506</td>
      <td>None</td>
      <td>Avoid excessive class coupling</td>
      <td>Even if this rule might sound useful, in practice it was generating too many false-positives. Also, EF LINQ Queries are very prone to this. Unit and Integration tests must setup and configure numerous dependencies.</td>
    </tr>
    <tr>
      <td>S4018</td>
      <td>None</td>
      <td>Generic methods should provide type parameters</td>
      <td>Using the generic argument as return type does not lead to bugs. Only when using the method, you need to write a little more explicit code.</td>
    </tr>
    <tr>
      <td>CA1822</td>
      <td>None</td>
      <td>Mark members as static</td>
      <td>Dropped in favor of S2325.</td>
    </tr>
    <tr>
      <td>SA1609</td>
      <td>None</td>
      <td>PropertyDocumentationMustHaveValue</td>
      <td>The documentation of the value is doomed to become a hollow echo of the name and the summary.</td>
    </tr>
    <tr>
      <td>SA1133</td>
      <td>None</td>
      <td>DoNotCombineAttributes</td>
      <td>The team voted to deactivate this rule on 28.02.2019.</td>
    </tr>
    <tr>
      <td>CA1308 <br/> S4040</td>
      <td>None</td>
      <td>Normalize strings to uppercase</td>
      <td>Too many false positives for paths, URLs etc.</td>
    </tr>
    <tr>
      <td>S1135</td>
      <td>Info</td>
      <td>Track uses of "TODO" tags</td>
      <td>Still show it to the developer in his IDE.</td>
    </tr>
    <tr>
      <td>CS1591</td>
      <td>None</td>
      <td>Missing XML comment for publicly visible type or member 'Type_or_Member'</td>
      <td>Can be deactivated because SA1600 already checks for the XML comment.</td>
    </tr>
    <tr>
      <td>IDE0058</td>
      <td>None</td>
      <td>C# Expression value is never used</td>
      <td>Is reporting way too many false negatives.</td>
    </tr>
    <tr>
      <td>S1541 <br/> CA1502</td>
      <td>None</td>
      <td>Methods and properties should not be too complex</td>
      <td>Deactivated in favor of the more thoughtful rule S3776 (Cognitive Complexity of methods should not be too high).</td>
    </tr>
    <tr>
      <td>SA1629</td>
      <td>None</td>
      <td>Documentation text should end with a period</td>
      <td>Does not add too much quality and developers find it too annoying to comply with this.</td>
    </tr>
    <tr>
      <td>IDE0065</td>
      <td>None</td>
      <td>Misplaced using directive</td>
      <td>Placing using directives outside of the namespace conflicts with our code style.</td>
    </tr>
    <tr>
      <td>CA1001</td>
      <td>None</td>
      <td>Types that own disposable fields should be disposable</td>
      <td>Dropped in favor of S2931.</td>
    </tr>
    <tr>
      <td>CA1307 <br/> S4058</td>
      <td>None</td>
      <td>Overloads with a "StringComparison" parameter should be used.</td>
      <td>Generated too many false positives for EF queries.</td>
    </tr>
    <tr>
      <td>CA2201</td>
      <td>None</td>
      <td>Do not raise reserved exception types</td>
      <td>Deactivated in favor of S112</td>
    </tr>
    <tr>
      <td>IDE0001</td>
      <td>None</td>
      <td>Name can be simplified</td>
      <td>Can lead to conflicting scenarios in the using directives with SA1135.</td>
    </tr>
    <tr>
      <td>S103</td>
      <td>None</td>
      <td>Lines should not be too long</td>
      <td>Developers should be in charge to decide when the line is too long. Horizontal scrolling is not a big issue anymore with todays display sizes and resolutions.</td>
    </tr>
    <tr>
      <td>S109</td>
      <td>Info</td>
      <td>Magic numbers should not be used</td>
      <td>Developers are advised to add a comment to demystify the meaning of such a number.</td>
    </tr>
    <tr>
      <td>S2228</td>
      <td>None</td>
      <td>Magic numbers should not be used</td>
      <td>This rule has been superseded by S106. (Specification)[https://jira.sonarsource.com/browse/RSPEC-2228]</td>
    </tr>
    <tr>
      <td>SA1005</td>
      <td>None</td>
      <td>Single line comments should begin with single space</td>
      <td>Dropped in favor of S125.</td>
    </tr>
    <tr>
      <td>CS8019 <br/> IDE0005</td>
      <td>None</td>
      <td>Unnecessary using directive</td>
      <td>Dropped in favor of S1128.</td>
    </tr>
    <tr>
      <td>CA1062</td>
      <td>None</td>
      <td>Validate arguments of public methods</td>
      <td>Dropped in favor of S3900.</td>
    </tr>
    <tr>
      <td>CA1305</td>
      <td>None</td>
      <td>Specify IFormatProvider</td>
      <td>Dropped in favor of S4056.</td>
    </tr>
    <tr>
      <td>IDE0052</td>
      <td>None</td>
      <td>Unread "private" fields should be removed</td>
      <td>Dropped in favor of S4487</td>
    </tr>
    <tr>
      <td>S1301</td>
      <td>None</td>
      <td>"switch" statements should have at least 3 "case" clauses</td>
      <td>Removed based on team vote. They prefer <code>switch</code> even if it has only one <code>case</code> clause.</td>
    </tr>
    <tr>
      <td>S4142</td>
      <td>None</td>
      <td>Duplicate values should not be passed as arguments</td>
      <td>This rule is marked as deprecated by SonarSource, and will eventually be removed.</td>
    </tr>
    <tr>
      <td>S1227</td>
      <td>None</td>
      <td>break statements should not be used except for switch cases</td>
      <td>We enforce multiple rules to force developers to write simple functions. In simple functions, break statements should not be too problematic concerning readability.</td>
    </tr>
    <tr>
      <td>S1075</td>
      <td>Info</td>
      <td>URIs should not be hardcoded</td>
      <td>The suggestion is helpful, but should not be enforced in all cases.</td>
    </tr>
    <tr>
      <td>CA2200</td>
      <td>None</td>
      <td>Rethrow to preserve stack details</td>
      <td>Dropped in favor of S3445.</td>
    </tr>
    <tr>
      <td>CA1002</td>
      <td>None</td>
      <td>Do not expose generic lists</td>
      <td>Dropped in favor of  S3956</td>
    </tr>
  </tbody>
</table>

## Exceptions for Debug configuration
As stated in *General decisions*, in **Debug** configuration, all rules are set to `None`. Exceptions defined for **Release** configurations also apply here. Additionally, in order to support early refactoring of your code, the follwoing rules will be always be executed in this configuration:

<table>
  <thead>
    <tr>
      <th>Rule ID</th><th>Action</th><th>Description/Title</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>S107</td>
      <td>Warning</td>
      <td>Methods should not have too many parameters</td>
    </tr>
    <tr>
      <td>S134</td>
      <td>Warning</td>
      <td>Control flow statements "if", "switch", "for", "foreach", "while", "do"  and "try" should not be nested too deeply</td>
    </tr>
    <tr>
      <td>S138</td>
      <td>Warning</td>
      <td>Functions should not have too many lines of code</td>
    </tr>
    <tr>
      <td>S1067</td>
      <td>Warning</td>
      <td>Expressions should not be too complex</td>
    </tr>
    <tr>
      <td>S1151</td>
      <td>Warning</td>
      <td>"switch case" clauses should not have too many lines of code</td>
    </tr>
    <tr>
      <td>S1200</td>
      <td>Warning</td>
      <td>Classes should not be coupled to too many other classes (Single Responsibility Principle)</td>
    </tr>
    <tr>
      <td>S1244</td>
      <td>Warning</td>
      <td>Floating point numbers should not be tested for equality</td>
    </tr>
    <tr>
      <td>S2360</td>
      <td>Warning</td>
      <td>Optional parameters should not be used</td>
    </tr>
    <tr>
      <td>S3776</td>
      <td>Warning</td>
      <td>Cognitive Complexity of methods should not be too high</td>
    </tr>
    <tr>
      <td>S4017</td>
      <td>Warning</td>
      <td>Method signatures should not contain nested generic types</td>
    </tr>
    <tr>
      <td>S4049</td>
      <td>Warning</td>
      <td>Properties should be preferred</td>
    </tr>
    <tr>
      <td>CA5351</td>
      <td>Warning</td>
      <td>Do Not Use Broken Cryptographic Algorithms</td>
    </tr>
    <tr>
      <td>CA5386</td>
      <td>Warning</td>
      <td>Avoid hardcoding SecurityProtocolType value</td>
    </tr>
    <tr>
      <td>CA5394</td>
      <td>Warning</td>
      <td>Do not use insecure randomness</td>
    </tr>
    <tr>
      <td>SA1200</td>
      <td>Error</td>
      <td>Using directives should be placed correctly</td>
    </tr>
    <tr>
      <td>CS8602</td>
      <td>Warning</td>
      <td>Dereference of a possibly null reference.</td>
    </tr>
    <tr>
      <td>CS8603</td>
      <td>Warning</td>
      <td>Possible null reference return.</td>
    </tr>
    <tr>
      <td>CS8604</td>
      <td>Warning</td>
      <td>Possible null reference argument.</td>
    </tr>
    <tr>
      <td>CS8605</td>
      <td>Warning</td>
      <td>Unboxing a possibly null value.</td>
    </tr>
    <tr>
      <td>CS8607</td>
      <td>Warning</td>
      <td>A possible null value may not be used for a type marked with [NotNull] or [DisallowNull]</td>
    </tr>
    <tr>
      <td>CS8608</td>
      <td>Warning</td>
      <td>Nullability of reference types in type doesn’t match overridden member.</td>
    </tr>
    <tr>
      <td>CS8609</td>
      <td>Warning</td>
      <td>Nullability of reference types in return type doesn’t match overridden member.</td>
    </tr>
    <tr>
      <td>CS8610</td>
      <td>Warning</td>
      <td>Nullability of reference types in type of parameter doesn’t match overridden member.</td>
    </tr>
    <tr>
      <td>CS8611</td>
      <td>Warning</td>
      <td>Nullability of reference types in type of parameter doesn’t match partial method declaration.</td>
    </tr>
    <tr>
      <td>CS8612</td>
      <td>Warning</td>
      <td>Nullability of reference types in type doesn’t match implicitly implemented member.</td>
    </tr>
    <tr>
      <td>CS8613</td>
      <td>Warning</td>
      <td>Nullability of reference types in return type doesn’t match implicitly implemented member.</td>
    </tr>
    <tr>
      <td>CS8614</td>
      <td>Warning</td>
      <td>Nullability of reference types in type of parameter doesn’t match implicitly implemented member.</td>
    </tr>
    <tr>
      <td>CS8615</td>
      <td>Warning</td>
      <td>Nullability of reference types in type doesn’t match implemented member.</td>
    </tr>
    <tr>
      <td>CS8616</td>
      <td>Warning</td>
      <td>Nullability of reference types in return type doesn’t match implemented member.</td>
    </tr>
    <tr>
      <td>CS8617</td>
      <td>Warning</td>
      <td>Nullability of reference types in type of parameter doesn’t match implemented member.</td>
    </tr>
    <tr>
      <td>CS8618</td>
      <td>Warning</td>
      <td>Non-nullable field is uninitialized. Consider declaring as nullable.</td>
    </tr>
    <tr>
      <td>CS8619</td>
      <td>Warning</td>
      <td>Nullability of reference types in value doesn’t match target type.</td>
    </tr>
    <tr>
      <td>CS8620</td>
      <td>Warning</td>
      <td>Argument cannot be used for parameter due to differences in the nullability of reference types.</td>
    </tr>
    <tr>
      <td>CS8621</td>
      <td>Warning</td>
      <td>Nullability of reference types in return type doesn’t match the target delegate.</td>
    </tr>
    <tr>
      <td>CS8622</td>
      <td>Warning</td>
      <td>Nullability of reference types in type of parameter doesn’t match the target delegate.</td>
    </tr>
    <tr>
      <td>CS8624</td>
      <td>Warning</td>
      <td>Argument cannot be used as an output for parameter due to differences in the nullability of reference types.</td>
    </tr>
    <tr>
      <td>CS8625</td>
      <td>Warning</td>
      <td>Cannot convert null literal to non-nullable reference type.</td>
    </tr>
    <tr>
      <td>CS8629</td>
      <td>Warning</td>
      <td>Nullable value type may be null.</td>
    </tr>
    <tr>
      <td>CS8631</td>
      <td>Warning</td>
      <td>The type cannot be used as type parameter in the generic type or method. Nullability of type argument doesn’t match constraint type.</td>
    </tr>
    <tr>
      <td>CS8632</td>
      <td>Warning</td>
      <td>The annotation for nullable reference types should only be used in code within a ‘#nullable’ annotations context.</td>
    </tr>
    <tr>
      <td>CS8633</td>
      <td>Warning</td>
      <td>Nullability in constraints for type parameter doesn’t match the constraints for type parameter in implicitly implemented interface method'.</td>
    </tr>
    <tr>
      <td>CS8634</td>
      <td>Warning</td>
      <td>The type cannot be used as type parameter in the generic type or method. Nullability of type argument doesn’t match ‘class’ constraint.</td>
    </tr>
    <tr>
      <td>CS8643</td>
      <td>Warning</td>
      <td>Nullability of reference types in explicit interface specifier doesn’t match interface implemented by the type.</td>
    </tr>
    <tr>
      <td>CS8644</td>
      <td>Warning</td>
      <td>Type does not implement interface member. Nullability of reference types in interface implemented by the base type doesn’t match.</td>
    </tr>
    <tr>
      <td>CS8645</td>
      <td>Warning</td>
      <td>Interface is already listed in the interface list with different nullability of reference types.</td>
    </tr>
    <tr>
      <td>CS8655</td>
      <td>Warning</td>
      <td>The switch expression does not handle some null inputs.</td>
    </tr>
    <tr>
      <td>CS8656</td>
      <td>Warning</td>
      <td>Call to non-readonly member.</td>
    </tr>
    <tr>
      <td>CS8667</td>
      <td>Warning</td>
      <td>Partial method declarations have inconsistent nullability in constraints for type parameter.</td>
    </tr>
    <tr>
      <td>CS8714</td>
      <td>Warning</td>
      <td>The type cannot be used as type parameter in the generic type or method. Nullability of type argument doesn’t match ‘notnull’ constraint.</td>
    </tr>
  </tbody>
</table>

# Tests Ruleset
Tests are used mostly internally and allow for much laxer rules. The *\*.TestsRuleset* package includes a modified ruleset for both **Debug** and **Release**. The following rules are different to their respective configuration.

<table>
  <thead>
    <tr>
      <th>Rule ID</th><th>Action</th><th>Description/Title</th><th>Reason/Remarks.</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td>CA1707</td>
      <td>None</td>
      <td>Identifiers should not contain underscores</td>
      <td>We use underscores in test method names to make them easier to read.</td>
    </tr>
    <tr>
      <td>S112</td>
      <td>None</td>
      <td>Do not raise reserved exception types</td>
      <td>In Tests we should be able to raise any Exception we like.</td>
    </tr>
    <tr>
      <td>CA1031</td>
      <td>None</td>
      <td>Do not catch general exception types</td>
      <td>Since we can raise any Exception we like In Tests we should also be able to catch any Exception we like.</td>
    </tr>
    <tr>
      <td>CA2000</td>
      <td>None</td>
      <td>Dispose objects before losing scope</td>
      <td>Tests are never run continuously in a production environment. Resources are freed as soon as the Test run ends, so there is no need to worry about the pitfalls of not freeing resources.</td>
    </tr>
    <tr>
      <td>S131</td>
      <td>None</td>
      <td>"switch/Select" statements should contain a "default/Case Else" clauses</td>
      <td>There is no need for defensive programming in Tests</td>
    </tr>
    <tr>
      <td>S126</td>
      <td>None</td>
      <td>"if ... else if" constructs should end with "else" clauses</td>
      <td>There is no need for defensive programming in Tests</td>
    </tr>
    <tr>
      <td>CA2007</td>
      <td>None</td>
      <td>Do not directly await a Task</td>
      <td>This warning is intended for libraries, where the code may be executed in arbitrary environments and where code shouldn't make assumptions about the environment or how the caller of the method may be invoking or waiting on it</td>
    </tr>
  </tbody>
</table>