# Code review etiquette and best practices

## Introduction

This guide describes etiquette and best practices for participating in code review at Arcadia. It is intended to help reviewers provide constructive feedback and to help authors understand how to interpret and respond to the feedback they receive. Because code is usually reviewed in the context of pull requests (PRs), this document focuses on the structure and procedures of PR reviews, but the spirit of its recommendations applies to other forms of review as well.

Please first review [the source-control standard document](./standard-source-control.md) for general guidelines about how to use Git and GitHub at Arcadia. In particular, please make sure to read the "Pull requests and code reviews" section of that document, as it explains how to create and submit PRs.

### Why do we review code?

We review code to ensure that the code we write is of high quality, well-documented, and reproducible. Reviews also create a record of the motivation and logic behind the changes that are made to our repositories over time.

### The spirit of code review

As with any form of constructive or critical feedback, empathy and trust are the foundation of effective code reviews. It is important to remember that we will all be both authors and reviewers at various times and to provide and respond to feedback in a way that is respectful, constructive, and professional. In particular, it may be helpful to think of the code in a rather "cold" and objective way, as an artifact that you (whether as an author or reviewer) are working on in collaboration with others, and one that neither its author nor reviewers "own" but for which both are, collectively, responsible.

## For PR authors

### When is a PR ready to review?

A PR is ready to review when it represents a complete and coherent set of related changes. Generally, these changes should be limited to those necessary to implement a single new feature or add a single kind of new functionality to the code.

However, it is usually acceptable to include a limited number of "drive-by" changes that are unrelated to the main changes made in the PR, as long as they are minor enough that they don't overlap with the main changes or "clutter" the PR in a way that makes it hard to review. It is customary to list these drive-bys in the PR description, so that the reviewer is not surprised by the inclusion of seemingly unrelated code in the review request.

Finally, be sure to write a descriptive title and thorough description for your PR. The description should briefly explain the context and motivation for the PR, as well as summarize the changes it makes. Keep in mind that the PR title will be included in the Git commit log (this is because it is used as the message of the merge commit when the PR is merged), making it particularly important to be clear and concise.

### How big should a PR be?

This is highly context-dependent, but in general, PRs should always be small enough that the following are true:

- The PR represents a conceptually coherent set of changes.
- A reviewer can understand and review the PR in a single sitting (i.e., a few hours).

PRs that don't follow these guidelines make it more difficult for reviewers to understand all of the changes and provide meaningful feedback. In addition, large PRs tend to slow down the review process, as reviewers may need to spread their review over multiple days.

If you find that your PR is growing too large, you can always break it up into several smaller PRs that can be reviewed independently. Please reach out to the software team if you need help with this.

### Whom should I request a review from?

Everyone at Arcadia is encouraged to participate in code reviews, so you can request a review from anyone you think might be able to provide useful feedback. In general, it is a good practice to request reviews from people who can review different aspects of your PR. For example, someone on the software team might review code structure or implementation details, while a scientist on the discovery team might review conceptual approaches, analysis methods, or interpretation. If you'd like a reviewer to focus on something in particular, feel free to communicate this either in the PR description or reach out directly to them when you request a review.

### How many reviews should I request?

Usually, requesting reviews from between one and three reviewers is sufficient. If you're working closely with one other person on an early-stage project, you may want to request a review only from that person. On the other hand, if you're working on a larger project, or your PR itself is large, or your PR makes changes that may affect many people, it is usually prudent to request reviews from multiple people.

### How long should I wait for a review?

After you request a review from someone on GitHub, it is courteous to allow them around 48 (business) hours to respond. After that time, it is reasonable to reach out directly on Slack or in person to remind them of your request (and to check that they have the bandwidth to submit a review). If, in the meantime, you receive one or more approving reviews from other reviewers, it is usually acceptable to merge your PR without waiting for the remaining reviewers.

### How should I respond to review comments?

It is a good practice to acknowledge most comments. For simple comments that can be addressed with small, local changes (e.g., typos or minor bugfixes), a "thumbs up" emoji response is sufficient (and even this is not always necessary). For larger comments that require more complex changes, it is a good practice to respond with a summarization of the changes you made, to help the reviewer when they re-review your PR.

### When do I mark a comment as resolved?

If you've resolved a review comment by making changes to the code, you can click the "resolve" button yourself. Comments that trigger a discussion should be left open until an agreement is reached, at which point either you or the reviewer can click "resolve." In general, all review comments should be resolved before a PR is merged.

### What happens if a review is discussed on Slack or in person?

If substantive discussion related to a review happens on Slack or in person, it is a good practice to summarize the discussion in a comment on the PR. This helps to create a record of the discussion and ensures that other reviewers are aware of any decisions that were made.

### What happens if I disagree with a reviewer's feedback?

PR reviews are a collaborative process. Reviewers may make mistakes, misunderstand your code, or have different opinions about what is "best" in a given context. If you disagree with a reviewer's feedback, initiate a discussion in the comment with your reasoning. See also the section above on "the spirit of code review."

### When should I open an issue instead of addressing a comment in a PR?

Some review comments may be too broad, too tangential, or insufficiently urgent to warrant addressing them in your existing PR. In these cases, the usual practice is to reach an agreement about this with the reviewer and then to open a new issue on GitHub that describes the review comment and the changes necessary to address it. This ensures that the comment is not forgotten about. It is not necessary to reference the original review comment in the issue, although it is nice to credit the reviewer.

Note that there is no need to open issues for comments that you're going to address within your existing open PR.

### When can I merge my PR?

At Arcadia, we have a policy that all PRs must be approved to be merged, so the simple answer is that you can merge your PR once it has received at least one approving review. If you expect reviews from multiple individuals (for example, focusing on different aspects of the code, as mentioned earlier), make sure to let the reviewers know this in the PR, in person, or through other channels, so that they will not overlook a PR that has already been reviewed by someone else.

Often, reviewers will request changes with their initial review. This means that, once you've addressed the reviewer's comments, they will need to re-review your PR and approve it. To do this, you can re-request a review from the reviewer on GitHub and/or ping the reviewer on Slack to let them know that you've addressed their comments and your PR is ready for them to re-review.

In other cases, a reviewer may approve your PR during their initial review while also making comments or suggestions. This usually indicates that the reviewer felt their comments were minor or inessential and it is up to you to address them at your discretion before merging.

### What if I have an approving review but other reviewers haven't finished reviewing yet?

In general, once your PR has one approving review, you may choose to merge your PR without waiting for additional reviews. Note, however, that this is context-dependent. For example, you may want to wait longer for a review from someone who has domain expertise that is particularly relevant to your PR. Or, if your PR is large and complex, it is usually prudent to wait for at least two reviews before merging, rather than relying on just one reviewer to catch all potential issues.

## For PR reviewers

### What should I look for when reviewing a PR?

In general, focus on reviewing the areas or aspects of the PR that you feel you're best positioned to review or that other reviewers are less likely to review. For reference, some of the most essential general areas to consider when reviewing PRs at Arcadia are listed below. These areas are distilled from the requirements listed in the [standards for public repos](standard-public-repos.md); refer to that document for more details.

- **Correctness**: Does the code do what it is supposed to do? Are there any bugs or errors?
- **Documentation**: Is the code well-documented? Are there clear instructions for how to use the code?
- **Dependencies**: Are all dependencies listed? Are there any dependencies that are not necessary or that could be removed?
- **Security**: Are there any security vulnerabilities in the code? Is sensitive information handled securely?
- **Error handling**: Is the code sufficiently robust in the face of errors?
- **Impact**: Are there any potential side effects of the changes that are not immediately obvious?

Depending on the nature and scope of the repository, areas related to code quality may also be important to review. Generally, these areas are less important for analysis code or one-off scripts and more important for code that is likely to be used or developed over time and/or depended on by other users. These areas include:

- **Clarity**: Is the code readable and easy to understand? Are variable names descriptive? Are comments used where necessary?
- **Consistency**: Does the code follow the same style and conventions as the rest of the project? Note: you should generally not need to comment on specific code style; checking for adherence to Arcadia's [style guidelines](https://training.arcadiascience.com/arcadia-users-group/20240206-intro-to-formatting-and-linting/lesson/#style-guides) should be automated by linters and type checkers.
- **Performance**: Is the code efficient? Are there any bottlenecks or performance issues that could easily be improved?
- **Testing**: Are there tests for critical parts of the code? Do the tests cover a reasonable set of possible cases? Are there sufficiently realistic test datasets?

### How should I provide feedback?

Feedback should always take the form of comments made on the PR itself on GitHub. Comments should usually be on specific lines of code or blocks of code, rather than general comments about the PR as a whole. It can be helpful to provide "suggestions" (inline edits) directly, in case of small comments such as typo fixes or a clarification to a code comment; this lets the author accept the changes with a click. Rarely, it may be necessary to provide general feedback about the PR as a whole (for example, about a feature that may be missing or a naming convention that is used in many places), but this should be done sparingly.

It is good practice to provide context and reasoning in PR comments, rather than just point out an issue with the code. Aside from helping the author understand the comment, this turns the PR into an educational opportunity to improve code practices at Arcadia. For example, instead of saying "this function should take a random seed as an argument", say "this function should take a random seed as an argument and pass it to the underlying calls, so that its output is deterministic across runs."

Remember that feedback should always focus on the code itself, not on the author. Avoid using language that is accusatory, judgmental, or personal. Instead, use language that is objective, specific, and constructive. For example, instead of saying "you should have split this code into multiple functions" or "this code should be split into multiple functions", say "I feel that this code would be clearer if it where split into multiple functions" and then include a suggestion about what you think those multiple functions could be.

Finally, if you observe a particularly elegant piece of code, or if you learned something new while reviewing a PR, do leave a brief note of appreciation as a PR comment; this reinforces the goal of code review as a collaborative process that improves engineering quality at Arcadia.

### How should I prioritize my feedback?

Before making a comment, first think carefully about whether the comment warrants the author's attention. In particular, think about whether your comment is likely to improve the code in a meaningful way _for other developers_ or whether it is instead more a reflection of personal preference. For example, comments about variable names are often subjective (as long as the name is descriptive), but comments about _inconsistent_ variable names are usually worth making, as they are likely to make the code hard to understand for others.

#### What is a "nit"?

For comments that you feel are worth making but that you wish to indicate are either minor or may be subjective, the prefix "nit" (short for "nitpick") is often used. For example, "Nit: capitalize this figure label" or "Nit: use `dataframe.empty()` instead of `len(dataframe) == 0`". Usually, it is understood that the author may choose to accept or reject such comments at their discretion, without further discussion.

### When should I approve a PR?

You'll likely notice at least a few important issues during your initial review that must be addressed before the PR can be merged (note that these could be "minor but major," like typos in variable names). In these cases, you should submit your initial review with a "changes requested" status. Once the author has adequately addressed your feedback, you'll need to re-review the PR and submit a second, approving review. Usually, this step is a formality and does not involve additional comments or changes.

If, on the other hand, your initial review does not surface any critical issues, then it is acceptable to skip the re-review process and submit your initial review as an approval (sometimes called "approving with comments"). In this case, there is usually an implicit understanding that any comments in your review are minor enough that the author can address them at their descretion.

## [For authors] Additional tips

### Keeping PRs up-to-date

It may be necessary to keep your PR up-to-date with the `main` branch if other PRs are merged while your PR is being reviewed. To do this, you can merge `main` into your PR branch. If there are conflicts, you'll need to resolve them before you can merge `main` into your PR branch. If you're not sure how to resolve a conflict, reach out to the software team for help.

### How to continue working while waiting for review

If you need to work on code unrelated to the PR you are waiting to be reviewed, you can create a new branch as usual that starts from the `main` branch in your repo.

To continue working on code that is added or modified by your open PR, you can create a new branch that _starts from your open PR branch_ (rather than the `main` branch). Once your initial PR is merged, you can then merge `main` into this new branch to update it, and later open a new, second PR from this branch to `main`. This PR will then contain only the changes that you made after your initial PR was opened.

Note, however, that this approach can be painful if you merge PRs using the "squash and merge" method instead of the "merge commit" method because there will be no shared history between `main` and your second branch. This means that you can end up with a lot of merge conflicts when merging `main` into your second branch. If you run into this problem, please reach out the software team for assistance.
