# Selecting software dependencies for workflows and software

We often expect that a computational analysis we write at Arcadia will either be used again by another Arcadian or automated for high throughput studies. In these sorts of projects, we expect that the tools we use may one day be incorporated into a workflow or package. When this is the case, the software quality used in those analyses becomes more important than if the analysis is a one-off task used to generate a specific biological insight.

## Deciding when your task meets the re-use bar

**When working on a software tool or workflow you anticipate that you or another Arcadian will use multiple times, you need to be careful about which tools you include**. This is _not_ the same as a workflow that documents the steps taken in an analysis project and is often bespoke and specific to a given task. Examples of existing tools or workflows where we should be careful about the quality of tools we use include:

- nf-core-style Nextflow workflows like [NovelTree](https://github.com/Arcadia-Science/noveltree), [PreHGT](https://github.com/Arcadia-Science/prehgt), and [reads2genome](https://github.com/Arcadia-Science/reads2genome)
- Snakemake workflows written as re-usable tools like [ProteinCartography](https://github.com/Arcadia-Science/ProteinCartography/)
- Python packages like [plm-utils](https://github.com/Arcadia-Science/2024-plm-utils).
- Tools designed to analyze experimental data in high throughput like [arcadia-phenotypeomat-protocol](https://github.com/Arcadia-Science/arcadia-phenotypeomat-protocol)

## Things to look for when deciding to include a tool as a dependency

A dependency is any software tool that is required to make your tool work. For example, BLAST is a dependency of ProteinCartography and OrthoFinder is a dependency of NovelTree. Below we include some signals for assessing whether a software tool is high quality.

### Critical criteria (we can’t use the tool if it does not meet these criteria)

- **The tool has a license and the license is permissible for commercial use.** Common licenses like BSD2, BSD3, GPL3, and MIT can all be used. Some other licenses can be used as well.
  - Hint: you can search for the word "commercial" in the license. This will often take you to text about whether the software can be used commercially. If it can’t, it will usually say something like "for non-commercial use only." If you're unsure, reach out to Katie.
- **The tool can be run on the command line without human input.** A Graphical User Interface (GUI) (including web applications like Streamlit) is not required to run the tool. The tool isn’t encoded in notebooks.
- **The tool can be run on a Linux platform.** This is a requirement\* for things needing dockerization and for running on AWS.
  - *It's not actually a*requirement\* — the Mac operating systems can't really be dockerized, but Windows can. Similarly, there are Windows operating systems on AWS but these are sometimes annoying to use.

### Important criteria (think carefully before proceeding if the tool does not meet these criteria)

- **The software code is on GitHub or another popular developer platform like GitLab or BitBucket.** These platforms are widely used for versioning software and indicate that the tool is open source. Tools using these platforms are also more likely to be regularly updated and maintained. Software found on SourceForge can still be viable, although this platform is less commonly used for new projects. Tools hosted here may not be maintained as actively, which can lead to outdated dependencies and less community support. Code provided in the supplements of academic papers often lacks extensive documentation and user support, which can make installation and integration more challenging. If someone chooses to provide their code in a supplement instead of providing a URL to a GitHub repository, they may not be aware of general software engineering tools that can help improve the quality of code (tests, linting, etc.). If this code is packaged with a license that makes the re-use terms clear, you can still try and use it if there are no other tools available that accomplish your goals.
- **The tool is easily installable.** To be able to use a tool, we need to be able to install it. Below I’ve included somewhat arbitrary gradations of what makes something easy to install. You can check these things by eye to quickly see if you think a tool will be installable, but often the best way to determine this is to install and use the tool.
  - Very easy: cross-platform installation as a conda package
  - Easy: installable from another package repository with another package manager like pip or poetry (python) or `install_packages()` (R)
  - Somewhat easy: Installable from GitHub with a package manager
  - Somewhat easy: Has a dockerfile (a recipe from which a Docker container can be built)
  - Somewhat difficult: has an environment yaml file or requirements.txt file that lists versioned dependencies and has installation instructions that involve cloning the repository
  - Difficult: git clone & compile from source
  - Difficult: No installation instructions
- **The software is maintained.**
  - Hint: there is a difference in the timestamp between the first and last commit and the last commit occurred recently (~months)
  - Hint: there are responses to issues
  - Hint: look for a history of closed Pull Requests
  - Hint: look at the "insights" page on GitHub. The "contributors" tab will show contributions over time
- **Other people use the software.** This signals that other people believe in the method and that other people were able to install and use the software.
  - Hint: the GitHub repository has a lot of stars
  - Hint: the paper publishing the software has been cited frequently by other projects that used the tool.

### Criteria that are nice to have (but not necessary if you’re willing to do the leg work to make sure the tool works)

- **The tool has tests.** Tests ensure the accuracy and quality of a software tool. See [this AUG](https://training.arcadiascience.com/arcadia-users-group/20231104-testing-concepts/lesson/) for more about software tests.
  - Hint: tests will often be a `test/` or `tests` folder, either in the root of the repository or
- **The software is well-written.**
  - Hint: no `.DS_Store` files visible in any folder of the repository
  - Hint: the repository has a reasonable structure with clear and descriptive filenames
  - Hint: the code is well-organized, includes comments and docstrings, and appears to be readable
  - Hint: there are no absolute paths in the software
  - Hint: the software is packaged with or has documentation for obtaining demo data so you can quickly try to run the tool.

## Ideas for finding quality software

- Search [conda](https://anaconda.org/anaconda/repo), [PyPI](https://pypi.org/), or other software package repositories with keywords relevant to your task. The search engines for different software package repositories are different so your mileage will vary. However, if you can find a tool this way, the chances are good that it will be easy to install and mediocre that the software will be high quality.
- Search GitHub directly for repositories that match your keywords. Starting from the search bar, you can search for different combinations of key words that you think other people might use to describe the software they wrote that does the things you're interested in. GitHub will return results in code, repositories, issues, etc. Click on some of the matches to see if they lead you to quality software.
- Search Google Scholar with your keywords plus "GitHub." This may highlight studies that have published software. You can filter to recent papers or select papers that are highly cited.
- Look at the [nf-core modules](https://github.com/nf-core/modules) repository. If a tool makes it into that repo, it can be containerized, installed on Linux, and run on the command line. Make sure to check the license to make sure you can use the tool. While you're there, you can look to see if an existing [nf-core workflow](https://github.com/nf-core) already meets your full analysis needs.
