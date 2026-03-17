---
name: human-readable-code
description: Use this skill when reviewing, writing, or refactoring code to improve human readability.
---
# Human Readable Code Skill

## Purpose
Use this skill when reviewing, writing, or refactoring code to improve human readability.

The goal is to produce code that another developer can understand quickly without reverse-engineering the intent.

## Core Principle
Optimize for the human reader, not the computer.

A reader should be able to answer:
- What does this do?
- Why does it exist?
- How is it supposed to work?

## Guidelines

### 1. Use clear names
Prefer names that describe intent, not mechanics.

Good:
- `get_user_profile(user_id)`
- `calculate_total_price()`
- `send_password_reset_email()`

Avoid vague names like:
- `x`
- `data`
- `temp`
- `handleStuff()`

### 2. Keep functions small and focused
Each function should do one clear job.

Prefer:
1. validate input
2. transform data
3. perform action
4. return result

Split functions that combine validation, persistence, notifications, and logging unless there is a strong reason not to.

### 3. Favor consistency
Use predictable structure across the codebase.

Be consistent with:
- indentation
- import ordering
- naming conventions
- file layout
- return patterns
- error handling

Consistency lowers cognitive load.

### 4. Avoid clever code
Do not compress logic just because the language allows it.

Prefer obvious code over dense code.

If a one-liner is harder to understand than a few explicit lines, use the explicit version.

### 5. Preserve logical flow
Code should read like a sequence of understandable steps.

A good structure often looks like:
1. validate
2. prepare
3. execute
4. return

Avoid jumping between unrelated concerns.

### 6. Use meaningful abstraction
Hide complexity behind interfaces that match domain intent.

Prefer:
- `create_user(user)`
- `fetch_invoice(invoice_id)`
- `archive_project(project_id)`

Over exposing low-level implementation unless necessary.

### 7. Comment why, not what
Use comments to explain intent, constraints, tradeoffs, or non-obvious decisions.

Good comments explain:
- why this exists
- why this approach was chosen
- what edge case is being handled
- what external constraint matters

Avoid comments that merely restate the code.

### 8. Make behavior predictable
Function names, module layout, and control flow should help the reader guess what happens before reading every line.

Readable code is unsurprising.

### 9. Avoid unnecessary abstraction

### 10. Comments choice and conciseness
When you know a line of code has a deeper nature to it, a comment should be added, but it should not be
"wordy" in a fillter sense, and loose grammar or actionable phrasing is preferred to avoid having to
read too much and know exactly what the main point of the comment or complexity is. Longer length is okay,
but conciseness is key. Human eyes go to the comments first.

### 11. Boolean conditional logic syntax
Consider two different examples that are functionally equivalent, but the second uses a guard technique.

In general, for readability boolean logic, you want to use the first example. However, in many cases
like especially for missing data, using the guard technique is just fine even great.

- Example 1:
```python
    is_sale = self.type == "sale"
    is_rental = self.is_rental_conversion_eligible == False
    bom_none = self.bom == None

    def is_required(self):
        return (
            bom_none
            and is_sale
            and !is_rental
        )

```

- Example 2:
```python
    is_sale = self.type == "sale"
    is_rental = self.is_rental_conversion_eligible == False
    bom_none = self.bom == None

    def is_required(self):
        if !is_rental:
            return False

        return (
            bom_none
            and is_sale
        )
```

### 12. Dead Code Clarifications
Usually, you wouldn't want dead code, but truly, a lot of code that remains commented in a code base
is for context and understanding, OR for future uses that might not be implemented now, but make it
easier to develop later, and prevents some recalculations if time has already spent on it, and to
prevent having to redo this work.

- Do not assume commented code is dead code
- Do not assume protected variables (prefixed with `_` or `__`) are unused (for python nor js)

### 13. Allow for Human nature in comments
AI has a problem where it thinks if something is witty or sarcastic or in a "joking" attire it thinks
it should be removed, but in reality, these kind of comments are easier for humans to read and relate
to, and not only that but they can be more memorable and make the code more enjoyable to read,
which is a huge part of readability. So, if you see a comment that expresses human nature in the form
of wit or sarcasm, do not remove it: rather consider that it might add to the readability, enjoyment,
or memorability of the code.

- Encourage human nature, wit, sarcasm, and maybe a bit of human in comments.

### 14. Don't inline
Usually it's preferable to read if statements as follows:

Good (not inleine, uses else if)
```
if (logic1) {
    // do something
} else if (logic2) {
    // do something else
} else {
    // default case
}
```

Bad (inline, and no else if usage)
```
if (logic1) // do something
if (logic2) // do something else
if (logic3) // default case
```

Very important note here: if you use if statements when possible it should always prefer
using an if, else if, else etc, over using the if, if, if reuse style, why is this, this
is because if you hit a case, you can ensure that no other cases are hit, this is very
important for making code deterministic. If many different cases can be hit and that is
intentional, then using multiple if statements is okay.

### 15. If it ain't broke, don't fix it.
When modifying code:

- Prefer minimal diffs.
- Never refactor unrelated code.
- Do not rename variables unless required.
- Do not change formatting or imports unless necessary.
- Avoid modifying existing migration files.
- Preserve backwards compatibility.
- Don't remove or refactor dev comments, unless incorrect.

Even if you think a bug exists, sometimes that code has been tested and actually it's
"working as intended". Avoid changing previously existing code if possible.


## Review Checklist
Before finalizing code, check:
- Are names explicit and meaningful?
- Does each function have a single clear responsibility?
- Is the structure consistent with nearby code?
- Is any part unnecessarily clever?
- Does the control flow read naturally?
- Are abstractions named around intent?
- Do comments explain why instead of what?
- Could another developer understand this in 30 seconds?

## Refactoring Heuristics
When improving readability:
- rename unclear variables and functions
- split large functions into focused helpers
- replace nested logic with guard clauses where appropriate
- separate domain logic from I/O or framework code
- extract repeated logic into well-named functions
- refactor comments to be more to the point
- do not assume commented code is dead code
- preserve human nature in comments when it adds memorability or enjoyment
- prefer explicit intermediate variables when they improve clarity

## Output Standard
When writing or revising code with this skill:
- prioritize clarity over terseness
- preserve correctness and behavior
- improve names first
- simplify flow second
- add brief explanatory comments only where needed
- avoid unnecessary abstraction

## One-Line Test
A competent developer should be able to understand the code in about 30 seconds.
