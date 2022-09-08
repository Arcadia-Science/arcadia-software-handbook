# Source control

- This policy describes core software engineering policies at Arcadia Science, as it pertains to version control and data management.

## Git

- [Git](https://git-scm.com/) is a free and open source distributed version control system.
- Version control is the practice of tracking and managing changes to software code. This means we can easily see who made what change when and potentially revert to earlier version of the code.
- Since version control tools like Git work across platforms, it also makes access to code repositories easy and consistent across environments.
- In the end, version control is an essential tool of collaboration for large teams to build complex software.

## GitHub

- [GitHub](https://github.com/) is built on top of Git and is our primary version control service. We have an [Arcadia Science account](https://github.com/Arcadia-Science) and we expect that team members will maintain their code in repositories under this team account.
- On GitHub, the default branch for a repository is called `main`. We should not deviate from this convention, unless there’s a good reason to do so.
- When working on GitHub repositories, Arcadia Science team members should not commit changes directly to the `main` branch. Instead commits happen as described below to facilitate code review.

### Repositories

At Arcadia Science, repositories should follow basic guidelines.

- **Repository location**: Repositories for code written at Arcadia should be in the GitHub organization [Arcadia-Science](https://github.com/Arcadia-Science).
- **Naming repositories:** Repository names are hyphenated. Example: [Arcadia-Science/arcadia-twitter-collections](https://github.com/Arcadia-Science/arcadia-twitter-collections).
- **Default repository settings**: Each repository should have the following settings (we’re working on making this a default template, but in the mean time please try and check this set of boxes when you create a new repo):

<img width="768" alt="Default repository settings" src="https://user-images.githubusercontent.com/2692053/189210914-32052663-e2d3-4ab6-a418-1d1aca6a9afd.png">

- **README**: Repositories should contain a descriptive README document.
- **Branches**: At Arcadia Science, we work on repositories using branches and not forks. Forks are error-prone and can go out-of-sync in the case of renamings etc.
  - The default branch name is `main.`
- **Working in branches**
  - For each code change, feature or a fix, create a new branch. The branch names should be all lowercase and should follow this naming convention: `<your initials>/<brief description of the code change>`. Example: `fmc/policy-source-control`.
  - Make your change and push it to the branch.
  - Create a pull request into the repository owned by Arcadia Science. If your pull request is not ready for review, but you’d like to still open one, you can open a draft pull request.
  - Name potential reviewers for your pull request.
  - Once at least one Arcadian has approved your pull request, you may merge your pull request.
  - Once your pull request is merged, please delete your branch to keep the Github branches/tags clean and tidy.
- **Archiving repositories:** As much as possible, you should refrain from deleting repositories so other members (past and future) of Arcadia can see what worked and what hasn’t. If a repository is no longer useful, instead of deleting you can make it read-only by following the instructions [here](https://docs.github.com/en/repositories/archiving-a-github-repository/archiving-repositories).
- **Openness**: By default, repositories should be public from creation. If you do work in a private repository, assume that it will one day become public. The exception to this rule may be IP-protected work Arcadia does. In this case, please consult our legal counsel.
- **Licensing:** TBD

### Pull Requests & Code reviews

- **Getting Code into Arcadia Science Repositories:** Code moves from feature branches to the main branch through a process of code review. Code review is handled through pull requests. The process is described briefly below. Feel free to ask for guidance if you are uncomfortable with the process. We will revoke write access for failing to adhere to these rules.
- **Why do code reviews?** It increases the code quality two-fold: 1) because you know your work will be reviewed, you pay more attention and 2) because someone else (or multiple people) carefully look at a piece of code. It increases accountability and visibility. Effectively, you’re creating a paper-trail of changes and decisions around those. A potential complaint could be that it’s a time sink and to be honest it is. But the benefits outweigh that cost.
- **What is a pull request?** Pull requests are the heart of collaboration on GitHub. When you open a pull request, you're proposing your changes and requesting that someone review and pull in your contribution and merge them into their branch. Pull requests show diffs, or differences, of the content from both branches. The changes, additions, and subtractions are shown in different colors. Want to see what it looks like? [Here’s an example](https://github.com/Arcadia-Science/2022-mtx-not-in-mgx-pairs/pull/3).
- **Composition of Pull Requests:** Each pull request may contain one or more code changes as long as they focus on a specific task. In keeping with good source control practice, each change or commit should contain all changes necessary for a particular fix or update. In addition, each pull request should relate to no more than one functional area in the code base you are updating. Keeping the pull request focused to one area will most likely keep them short. Short pull requests make it easier for your reviewers to provide thoughtful and quick feedback. Quick feedback means you can quickly address concerns and get your pull request merged. In general, shorter and more focused pull requests are better than longer ones.
- **Reviewing Pull Requests:** We expect that all team members will participate in review of pull requests. If you get named by the submitter, it's courteous to review the request. People can get busy or miss the review submission. It’s the responsibility of the person seeking review to pursue the reviewer to make sure code changes are committed in a timely manner. While all code-related discussion should occur publicly on GitHub, it is appropriate to nudge people about reviews or check about their timeline using DMs in slack.
  - Potential suggested code review checklist: [https://github.com/greenelab/onboarding/blob/master/extras/code_review_checklist.md](https://github.com/greenelab/onboarding/blob/master/extras/code_review_checklist.md)
- **Merging Pull Requests:** Once your code is reviewed and pull request is approved, it's time to merge your changes. There are 3 methods of merging a PR via git: **Merge** will create a merge commit that joins two branches together. **Rebase** rewrites history on top of a branch to create a linear history. **Squash and merge** creates a single new squashed commit that encompasses all commits in the feature branch. At Arcadia Science, we use the first option and merge pull requests by creating a merge commit. You can enforce this policy by updating your repository settings to look like this:
<img width="786" alt="Pull request merge policy" src="https://user-images.githubusercontent.com/2692053/189219208-891f3bd2-e4d7-476b-b9a1-1d795879f2b9.png">


### What not to keep under version control

- You should never commit any private information to your repository. No exceptions!
- This could include sensitive business materials or information, credentials of any sort (personal or company-wide). If you mistakenly commit any sort of credential or other sensitive information to a Github repository, there may be ways to reverse the commit or rewrite the git history. So please ping [@Feridun Mert Celebi](https://github.com/mertcelebi) for help.
  - It’s safe to assume that you’ll have to revoke and regenerate your committed credentials to make sure those can’t be used by others.

### Data management

- For publicly available data, scripts used to download and process these data should be preserved, as should the versions of items used in processing (e.g. probe to gene mappings). This code should be version controlled. Where possible, intermediate files of reasonable size can be stored to facilitate re-use, but the process to regenerate these files from publicly available data should be preserved.
  - Reasonable size is 100MB for storing files on Github.
- When we generate data, they should be stored in a location where they are replicated and uploaded to the relevant database as soon as possible (e.g. raw sequencing data uploaded to the Sequence Read Archive). If possible, the code should be updated to match the above. For more on this, please see the relevant publishing documentation [here](https://www.notion.so/arcadiascience/Sharing-Data-eca60da150f04a7a905a8540871f0364).

### Review templates

- For each change, it’s easy to provide a default template for the developer to fill when creating the pull request.
- For this, create a file called `PULL_REQUEST_TEMPLATE.md` under the `.github` directory of your project.
- Example pull request template file can be found [here](../.github/PULL_REQUEST_TEMPLATE.md).

### [Optional] Code owners

- For projects with a lot of coordination between team members, it may make sense to define individuals or teams that are responsible for sections of code in a repository. This would make it easier to seek the appropriate code review before merging a pull request.
- You can accomplish this by using the [Code Owners](https://docs.github.com/en/repositories/managing-your-repositorys-settings-and-features/customizing-your-repository/about-code-owners) feature of Github by creating a `CODEOWNERS` file under the `.github` directory of your project.
- Example codeowners template file can be found [here](../.github/CODEOWNERS).

### [Optional] Reviewing Jupyter notebooks using the ReviewNB tool

Jupyter notebooks are great data science tools as they combine code, output, and written notes into a single document. They support code written in Python, R, and Julia, and can be coaxed to execute bash as well. Given that they are natively rendered by GitHub, they are a good option to record computational experiments. However, in a pull request, notebooks quickly become unwieldy because they include not only the code you wrote and ran but also code that specifies the format of the document. This makes wading through a diff painful. We have enabled the [ReviewNB tool](https://www.reviewnb.com/) to produce better diffs from Jupyter notebooks.

## Guidelines for collaborating on codebases with collaborators who are not Arcadians

- Before any of this, please consult our legal counsel to make sure there are not licensing and legal problems with your collaboration.
- If you’re working on an Arcadia Science repository with outside collaborators, the repository is most likely already public. If so, that’s great! If the repository is private, you can include the Github account to the repository as an “outside collaborator”.
- Either way, the rules in this policy as it pertains to code review and working in branches apply to outside collaborators as well.
- If you plan to actively work on a repository with outside collaborators, it’s recommended to add `CONTRIBUTING.MD` and `CODE_OF_CONDUCT.md` files to the root of the repository to set expectations ahead of time. Default templates for these will be available soon.

## Common pitfalls & tricks to overcome them

It’s entirely possible to get stuck in a squiggly quagmire of git branches and have no idea to work your way out. If this happens to you, we’ve all been there, don’t panic! Google is a good first option to see if you can identify a solution. If not, post in the #software slack channel to get help from a fellow Arcadian. See below for some common pitfalls and some strategies to avoid or overcome them.

- **Adding too many files or the wrong files into a commit.** Git has two strategies to help you avoid adding the wrong files into your repository. First, there is a file, `.gitignore`, in which you can specify file names or paths (including with regex!) that should always be ignored by git. It might make sense to add things like `*.fastq.gz` to this file to avoid adding large sequencing files to GitHub. Second, instead of doing something like `git add` , it’s generally good practice to type out the names of the files you want to add explicitly (`git add 01-analyze-seq-data.ipynb`) so you don’t accidentally add something unintended. If you do add something you didn’t mean to, you can always remove it later!
- **Starting from the wrong branch.** A branch can start from the `main` branch of a GitHub repo, or any other branch that already exists. Before you start a new branch, check that you’re on the branch you want to start from with `git branch`. If you’re not, use `git checkout <branch name>`to get to the branch you want to start with before creating a new one.
  - You can also customize your terminal of choice to show the current branch name by following the instructions [here](https://askubuntu.com/questions/730754/how-do-i-show-the-git-branch-with-colours-in-bash-prompt).
- **Merge conflicts.** When two pull requests touch the same line of code in different ways, this usually creates a merge conflict. If you’re working on a project mostly alone, you can avoid merge conflicts by only working on one section of code per branch. If this isn’t possible, or if you’re working with multiple people, have no fear! GitHub can walk you through resolving the merge conflict by having you select the lines of code you wish to keep.

## Tutorials

- There are approximately billions of Git and GitHub tutorials online. Here are some that I found interesting:
  - Very quick, bare bones of Git in 2 minutes: [https://www.garyrobinson.net/2014/10/git-in-two-minutes-for-a-solo-developer.html](https://www.garyrobinson.net/2014/10/git-in-two-minutes-for-a-solo-developer.html)
  - This set of hour long tutorials by Github: [https://skills.github.com/](https://skills.github.com/)
  - A more detailed tutorial written by Hubspot: [https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners](https://product.hubspot.com/blog/git-and-github-tutorial-for-beginners)
  - A good explainer on pull requests and how to navigate them: [https://docs.github.com/en/get-started/quickstart/hello-world](https://docs.github.com/en/get-started/quickstart/hello-world)

## Credits

- Many sections of this policy document are shamelessly copied from the [onboarding documentation of Casey Greene’s lab](https://github.com/greenelab/onboarding/blob/master/onboarding.md). Many thanks to Casey Greene for sharing this document and allowing us to use it.
