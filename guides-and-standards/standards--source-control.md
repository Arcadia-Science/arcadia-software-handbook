# Standards for source control

This document describes the software engineering standards related to version control at Arcadia Science.

## Table of contents

- [Standards for source control](#standards-for-source-control)
  - [Table of contents](#table-of-contents)
  - [About Git and GitHub](#about-git-and-github)
  - [Core standards](#core-standards)
    - [Repositories](#repositories)
    - [Public repositories](#public-repositories)
    - [Repository templates](#repository-templates)
    - [Working on branches](#working-on-branches)
    - [Default repository settings](#default-repository-settings)
    - [Pull Requests (PRs) and code reviews](#pull-requests-prs-and-code-reviews)
    - [What not to keep under version control](#what-not-to-keep-under-version-control)
    - [Data management](#data-management)
    - [Review templates](#review-templates)
    - [\[Optional\] Code owners](#optional-code-owners)
    - [\[Optional\] Reviewing Jupyter notebooks using the ReviewNB tool](#optional-reviewing-jupyter-notebooks-using-the-reviewnb-tool)
  - [Guidelines for collaborating on codebases with collaborators who are not Arcadians](#guidelines-for-collaborating-on-codebases-with-collaborators-who-are-not-arcadians)
  - [Common pitfalls and tricks to overcome them](#common-pitfalls-and-tricks-to-overcome-them)
  - [Tutorials](#tutorials)
  - [Credits](#credits)

## About Git and GitHub

Version control is the practice of tracking and managing changes to software code. This means we can easily see who made what change when and potentially revert to earlier version of the code. It is an essential collaboration tool for large teams to build complex software. [Git](https://git-scm.com/) is a free and open source distributed version control system. Since version control tools like Git work across platforms, it also makes access to code repositories easy and consistent across environments.

[GitHub](https://github.com/) is built on top of Git and is our primary version control service. We have an [Arcadia Science account](https://github.com/Arcadia-Science) and we expect that team members will maintain their code in repositories under this team account.

## Core standards

- [Arcadia Science](https://www.arcadiascience.com/) uses [Git](https://git-scm.com/) and [GitHub](https://github.com/) for version control.
- Repositories on GitHub should be private by default and created under the `Arcadia-Science` organization.
- Code and documentation should be added to repositories throughout a project, not at the time of publication.
- Work is done in branches and integrated into the main branch through pull requests.
- All Pull Requests should be reviewed by at least one other Arcadian and merged by the author of the pull request upon approval.
- Code associated with a pub is tagged in a release and archived on [Zenodo](https://zenodo.org/).

### Repositories

At Arcadia Science, repositories should follow basic guidelines.

- **Repository location**: Repositories for code written at Arcadia should be under the [Arcadia-Science GitHub organization](https://github.com/Arcadia-Science) and not under personal accounts.
- **Private by default**: Repositories should be private by default. If you need to make a repository public, please consult with the software team.
- **Repository names:** Repository names are lower case and hyphenated. (e.g. `arcadia-software-handbook`). The names of analysis repositories should be prefixed with the year of the project (e.g. `2024-worm-tracking`).
- **README**: Repositories should contain a descriptive README document.
- **License**: Each repository should have a license file. The default license for Arcadia Science repositories is [the MIT license](https://github.com/Arcadia-Science/python-analysis-template/blob/main/LICENSE).
- **Archiving repositories:** If a repository is no longer useful, make it read-only by archiving it. Follow the instructions [here](https://docs.github.com/en/repositories/archiving-a-github-repository/archiving-repositories).
- **No deleted repositories:** Never delete repositories. This ensures that other members (past and future) of Arcadia can see what worked and what hasn’t.

### Public repositories

Additional standards apply to public repositories to ensure that the code we release is reusable by others and that the computational artifacts we release are reproducible by others. These standards are described in a separate document [here](./standards--public-repos.md).

### Repository templates

We have Arcadia-specific templates for [Python](https://github.com/Arcadia-Science/python-analysis-template), [R](https://github.com/Arcadia-Science/r-analysis-template), [Snakemake](https://github.com/Arcadia-Science/snakemake-template), and [Nextflow](https://github.com/Arcadia-Science/nextflow-template-repository) repositories. It is strongly recommended to start new projects using these templates, as this will mean that your repository will automatically satisfy most of the requirements listed above.

### Working on branches

- We work on repositories using branches and not forks.
- The default branch name is `main`.
- For each code change, feature, or bugfix, create a new branch. Branch names should be all lowercase and should follow this naming convention: `<your initials>/<brief-description-of-changes>`. Example: `fmc/add-source-control-standards`.
- Make your change and push it to the branch.
- Create a pull request in the repository on GitHub. If your pull request is not ready for review, but you’d like to still open one, you can open a draft pull request.
- Before asking for reviews on a pull request, make sure your code is tested and runs successfully.
- Tag potential reviewers for your pull request.
- Once at least one Arcadian has approved your pull request, you may merge your pull request.
- Once your pull request is merged, please delete your branch to keep the Github branches/tags clean and tidy.

### Default repository settings

Each repository should have the following settings. Please check this set of boxes when you create a new repo:

<img width="768" alt="Default repository settings" src="https://user-images.githubusercontent.com/2692053/189210914-32052663-e2d3-4ab6-a418-1d1aca6a9afd.png">

### Pull Requests (PRs) and code reviews

- **Getting code into Arcadia Science Repositories:** Code moves from feature branches to the main branch through a process of code review. Code review is handled through pull requests. The process is described briefly below. Feel free to ask for guidance if you are uncomfortable with the process. We will revoke write access for failing to adhere to these rules.
- **Why do code reviews?** Code reviews increase code quality in several ways:
  1. Because you know your work will be reviewed, you pay more attention to the changes you make.
  2. Because someone else (or multiple people) carefully look at your code, errors and bugs are more likely to be caught, and accountability and visibility are increased.
  3. It creates a paper-trail of the rationale, discussions, and decisions arounds each set of changes.
- **What is a pull request?** Pull requests are the heart of collaboration on GitHub. When you open a pull request, you're proposing your changes and requesting that someone review and pull in your contribution and merge them into their branch. Pull requests show "diffs," or differences, of the content from both branches. The changes, additions, and subtractions are shown in different colors. Want to see what it looks like? [Here’s an example](https://github.com/Arcadia-Science/2022-mtx-not-in-mgx-pairs/pull/3).
- **Composition of Pull Requests:** Ideally, each pull request should relate to a single functional area in the codebase. Keeping the pull request focused to one area will help keep them short. In general, shorter and more focused pull requests are better than longer ones, as they are easier and faster to review. However, the meaning of "short" is language-, project-, and context-dependent. Sometimes, short PRs may not be feasible, especially in data science or analysis projects.
- **Reviewing Pull Requests:** Pull requests should be reviewed promptly. We expect everyone to participate in PR reviews, but it is the responsibility of the PR author to follow up with reviewers to ensure timely reviews. Please refer to our [code review guide](../guides-and-standards/guide--code-review.md) for details about the conventions and best practices we follow to ensure that reviews are effecient, effective, and respectful.
- **Merging Pull Requests:** Once your code is reviewed and pull request is approved, it's time to merge your changes. There are 3 methods of merging a PR on GitHub:
  - **Merge** will create a merge commit that joins the PR branch with the main branch. This option preserves the most amount of context as it includes all of the individual commits in the PR.
  - **Rebase** rewrites history on top of the main branch to create a linear history. This preserves individual commits but not the point at which the PR was merged, which could be confusing. This method is not recommended.
  - **Squash and merge** creates a single new "squashed" commit on the main branch that encompasses all commits in the PR. This is useful for maintaining a clean and linear history.
- The choice of merge method is up to the repository owners. If you are unsure, ask the software team for guidance.

### What not to keep under version control

**Never commit any private or sensitive information to your repository. No exceptions!** This could include confidential business information or credentials like passwords or API tokens. If you accidentally committed sensitive information to your repository, please reach out to the software team for help. **It is not sufficient to delete sensitive information by overwriting it in a subsequent commit**, as the information will still exist in the commit history and/or closed PRs. If the sensitive information included credentials like passwords or API tokens, please revoke and regenerate the credentials to make sure that they can’t be used by others.

If the code in a repository requires sensitive information to run, it should be stored in a separate configuration file that is explicitly not included in the repository by adding its name to the `.gitignore` file.

### Data management

- For publicly available data, scripts used to download and process these data should be preserved, as should the versions of items used in processing (e.g. probe to gene mappings). This code should be version controlled. Where possible, intermediate files of reasonable size can be stored to facilitate re-use, but the process to regenerate these files from publicly available data should be preserved.
- Files under 100MB in size can be stored in the repository.
- Private files over 100MB should be stored in a cloud storage service (e.g. an S3 bucket or Google Drive) and instructions to access the files should be included in the README.
- Public files should be stored in a public archive (e.g. the Sequence Read Archive), in a Zenodo repository, or in a publicly-accessible S3 bucket. Reach out to the software team for help with this.
- When we generate data, they should be stored in a location where they are replicated and uploaded to the relevant database as soon as possible (e.g. raw sequencing data uploaded to the Sequence Read Archive). If possible, the code should be updated to match the above. For more on this, please see the relevant publishing documentation [here](https://www.notion.so/arcadiascience/Sharing-Data-eca60da150f04a7a905a8540871f0364).

### Review templates

It's a best practice to provide a default template for the developer to fill out when creating the pull request. This can be done by creating a file called `PULL_REQUEST_TEMPLATE.md` under the `.github` directory of your project. An example pull request template file can be found [here](../.github/PULL_REQUEST_TEMPLATE.md).

### [Optional] Code owners

For projects with a lot of coordination between team members, it may make sense to define individuals or teams that are responsible for sections of code in a repository. This may make it easier to seek the appropriate code review before merging a pull request. You can accomplish this by using the [Code Owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) feature of Github by creating a `CODEOWNERS` file under the `.github` directory of your project. An example codeowners template file can be found [here](../.github/CODEOWNERS).

### [Optional] Reviewing Jupyter notebooks using the ReviewNB tool

Jupyter notebooks are great data science tools as they combine code, output, and written notes into a single document. They support code written in Python, R, and Julia, and can be coaxed to execute bash as well. Given that they are natively rendered by GitHub, they are a good option to record computational experiments. However, in a pull request, notebooks quickly become unwieldy because they include not only the code you wrote and ran but also code that specifies the format of the document. This makes wading through a diff painful. We have enabled the [ReviewNB tool](https://www.reviewnb.com/) to produce better diffs from Jupyter notebooks.

## Guidelines for collaborating on codebases with collaborators who are not Arcadians

- Before beginning a collaboration, please consult with your manager and our legal counsel to make sure there are not licensing and legal problems with your collaboration.
- If you’re working on an Arcadia Science repository with outside collaborators, the repository is most likely already public. If so, that’s great! If the repository is private, you can include the Github account to the repository as an “outside collaborator”.
- Either way, the rules in this document as it pertains to code review and working in branches apply to outside collaborators as well.
- If you plan to actively work on a repository with outside collaborators, it’s recommended to add `CONTRIBUTING.MD` and `CODE_OF_CONDUCT.md` files to the root of the repository to set expectations ahead of time. Default templates for these will be available soon.

## Common pitfalls and tricks to overcome them

Git is notoriously difficult to use. It’s easy to get stuck in a quagmire of git branches and have no idea how to work your way out. If this happens to you, we’ve all been there, don’t panic! ChatGPT and/or Google are a good first option to see if you can identify a solution. If not, post in the #software-questions Slack channel to get help from fellow Arcadian. See below for some common pitfalls and some strategies to avoid or overcome them.

- **Adding too many files or the wrong files into a commit.** Git has two strategies to help you avoid adding the wrong files into your repository. First, there is the `.gitignore` file in which you can specify file names or paths (including with regex!) that should always be ignored by Git. It might make sense to add things like `*.fastq.gz` to this file to avoid adding large sequencing files to GitHub. Second, instead of doing something like `git add` , it’s generally good practice to type out the names of the files you want to add explicitly (`git add 01-analyze-seq-data.ipynb`) so you don’t accidentally add something unintended. If you do add something you didn’t mean to, you can always remove it later!
- **Starting from the wrong branch.** A branch can start from the `main` branch of a GitHub repo, or any other branch that already exists. Before you start a new branch, check that you’re on the branch you want to start from with `git branch`. If you’re not, use `git checkout <branch name>` to get to the branch you want to start with before creating a new one. It is helpful to customize your terminal of choice to always show the current branch name. See instructions [here](https://askubuntu.com/questions/730754/how-do-i-show-the-git-branch-with-colours-in-bash-prompt).
- **Merge conflicts.** When two pull requests touch the same line of code in different ways, this usually creates a merge conflict. If you’re working on a project mostly alone, you can avoid merge conflicts by only working on one section of code per branch. If this isn’t possible, or if you’re working with multiple people, have no fear! GitHub can walk you through resolving the merge conflict by having you select the lines of code you wish to keep.

## Tutorials

There are approximately billions of Git and GitHub tutorials online. Here are some that I found interesting:

- Very quick, bare bones of Git in 2 minutes: [https://www.garyrobinson.net/2014/10/git-in-two-minutes-for-a-solo-developer.html](https://www.garyrobinson.net/2014/10/git-in-two-minutes-for-a-solo-developer.html)
- This set of hour long tutorials by Github: [https://skills.github.com/](https://skills.github.com/)
- A more detailed tutorial written by Hubspot: [https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)
- A good explainer on pull requests and how to navigate them: [https://docs.github.com/en/get-started/quickstart/hello-world](https://docs.github.com/en/get-started/quickstart/hello-world)

## Credits

Many sections of this document are shamelessly copied from the [onboarding documentation of Casey Greene’s lab](https://github.com/greenelab/onboarding/blob/master/onboarding.md). Many thanks to Casey Greene for sharing this document and allowing us to use it.
