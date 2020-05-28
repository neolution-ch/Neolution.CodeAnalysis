Neolution Ruleset
=================

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
      <td>Header is not needed for each file. The developers are not used to writing headers for each source code file. Furthermore, the default template of Visual Studio also comes without a header. Forcing this rule generates work without value. If the source code of a project will be distributed, the text can be added to each file individually at a later point in time to satisfy this rule.</td>
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
      <td>CA2234 <br/> CA1056 <br/> S3996 <br/> S3994</td>
      <td>None</td>
      <td>URI properties or parameters should not be strings</td>
      <td>Team decided to drop this rule due to inconveniences resulting from System.Uri not having a parameterless constructor.</td>
    </tr>
    <tr>
      <td>S3235</td>
      <td>None</td>
      <td>Redundant parentheses should not be used</td>
      <td>Team decided to drop this rule because most of the team members are used to write redundant parentheses.</td>
    </tr>
    <tr>
      <td>CA2227 <br/> S4004</td>
      <td>None</td>
      <td>Collection properties should be read only</td>
      <td>Team decided to drop this rule due to the additional effort that is needed to write methods that add items for these type of properties.</td>
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
      <td>We prefer S2325 over this rule.</td>
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
      <td>Deactivated in favor of better rule S3776 (Cognitive Complexity of methods should not be too high).</td>
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
      <td>Favor S2931 instead of this rule.</td>
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
      <td>IDE0050</td>
      <td>None</td>
      <td>Convert anonymous type to tuple</td>
      <td>Since tuple names cannot be resolved on runtime, this creates problematic false positives (e.g. Serialization).</td>
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
      <td>Dvelopers should be in charge to decide when the line is too long. Horizontal scrolling is not such a big issue anymore with todays display sizes and resolutions.</td>
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
      <td>S1128 <br/> IDE0005</td>
      <td>None</td>
      <td>Unnecessary using directive</td>
      <td>Dropped in favor of CS8019.</td>
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
      <td>IDE0010</td>
      <td>Info</td>
      <td>Add missing cases for switch</td>
      <td>The rule is not always desired, but the quick fix can be helpful, </td>
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
      <td>Removed based on team vote. Some developers prefer "switch" even if it has only one "case" clause.</td>
    </tr>
  </tbody>
</table>

Tests Ruleset
=============

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
  </tbody>
</table>