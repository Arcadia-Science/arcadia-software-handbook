# Selecting software dependencies for workflows and software

We often expect that a computational analysis we write at Arcadia will either be used again by another Arcadian or automated for high throughput studies. When this is the case, the software quality used in those analyses becomes more important than if the analysis is a one-off task used to generate a specific biological insight.

## Deciding when your task meets the re-use bar

**When working on a software tool or workflow you anticipate that you or another Arcadian will use multiple times, you need to be careful about which tools you include**. This is _not_ the same as a workflow that documents the steps taken in an analysis project and is often bespoke and specific to a given task. Examples of existing tools or workflows where we should be careful about the quality of tools we use include:

- nf-core-style Nextflow workflows like [NovelTree](https://github.com/Arcadia-Science/noveltree), [PreHGT](https://github.com/Arcadia-Science/prehgt), and [reads2genome](https://github.com/Arcadia-Science/reads2genome)
- Snakemake workflows written as re-usable tools like [ProteinCartography](https://github.com/Arcadia-Science/ProteinCartography/)
- Python packages like [plm-utils](https://github.com/Arcadia-Science/2024-plm-utils).
- Tools designed to analyze experimental data in high throughput like [arcadia-phenotypeomat-protocol]([https://github.com/Arcadia-Science/arcadia-phenotypeomat-protocol)

## Things to look for when deciding to include a tool as a dependency

A dependency is any software tool that is required to make your tool work. For example, BLAST is a dependency of ProteinCartography, and Nextflow and OrthoFinder are dependencies of NovelTree. Below we include some signals for assessing whether a software tool is high quality.

### Critical — we can’t use the tool if these criteria are not met

- **The tool has a license and the license is permissible for commercial use.** Common licenses like BSD2, BSD3, GPL3, and MIT can all be used. Some other licenses can be used as well.
  - Hint: you can search for the word "commercial" in the license. This will often take you to text about whether the software can be used commercially. If it can’t, it will usually say something like "for non-commercial use only."
- **The tool can be run on the command line without human input.** A Graphical User Interface (GUI) (including web applications like Streamlit) is not required to run the tool. The tool isn’t encoded in notebooks.
- **The tool can be run on a Linux platform.** This is a requirement\* for things dockerization and for running on AWS.
  - *It’s not actually a*requirement\* — the Mac operating systems can’t really be dockerized, but Windows can. Similarly, there are Windows operating systems on AWS but these are sometimes annoying to use.

### Important — think carefully before proceeding with the tool if these criteria are not met

- **The software code is on GitHub or another popular developer platform like GitLab or BitBucket.** Using these platforms signals that the tool is open source and likely versioned. Sometimes you'll find code on SourceForge. This is ok and potentially workable, but not the best. Sometimes you'll find code in the supplement of a paper. This is not awesome and probably signals that the tool will be hard to install or use but you can still try if you really want to.
- **The tool is easily installable.** To be able to use a tool, we need to be able to install it. Below I’ve included somewhat arbitrary gradations of what makes something easy to install. You can check these things by eye to quickly see if you think a tool will be installable, but often the best way to determine this is to install and use the tool.
  - Very easy: cross-platform installation as a conda package
  - Easy: installable from another package repository with another package manager like pip (python) or `install_packages()` (R)
  - Somewhat easy: Installable from GitHub with a package manager
  - Somewhat easy: Has a dockerfile and an available Docker container
  - Somewhat difficult: has an environment yaml file or requirements.txt file that lists versioned dependencies and has installation instructions that involve cloning the repository
  - Difficult: git clone & compile from source
  - Difficult: No installation instructions

### Nice — but not necessary if you’re willing to do the leg work to make sure the tool works

- **The tool has tests.** Tests ensure the accuracy and quality of a software tool. See [this AUG](https://training.arcadiascience.com/arcadia-users-group/20231104-testing-concepts/lesson/) for more about software tests.
  - Hint: tests will often be a `test/` or `tests` folder, either in the root of the repository or
- **The software is maintained.**
  - Hint: there is a difference in the timestamp between the first and last commit and the last commit occurred recently (~months)
  - Hint: there are responses to issues
- **The software is well-written.**
  - Hint: no `.DS_Store` files visible in any folder of the repository
  - Hint: the repository has a reasonable structure
  - Hint: the software is written in functions
  - Hint: there are no absolute paths in the software
  - Hint: the software is packaged with or has documentation for obtaining demo data so you can quickly try to run the tool.
- **Other people use the software.** This signals that other people believe in the method and that other people were able to install and use the software.
  - Hint: the GitHub repository has a lot of stars
  - Hint: the paper publishing the software has been cited frequently by other projects that used the tool.

## Ideas for finding quality software

- Search [conda](https://anaconda.org/anaconda/repo), [PyPI](https://pypi.org/), or other software package repositories with keywords relevant to your task. The search engines for different software package repositories are different so your mileage will vary. However, if you can find a tool this way, the chances are good that it will be easy to install and mediocre that the software will be high quality.
- Search Google Scholar with your keywords plus "GitHub." This may highlight studies that have published software. You can filter to recent papers or select papers that are highly cited.
- Look at the [nf-core modules](https://github.com/nf-core/modules) repository. If a tool makes it into that repo, it can be dockerized, installed on Linux, run on the command line, and is usually fairly high quality. Make sure to check the license to make sure you can use the tool. While you're there, you can look to see if an existing [nf-core workflow](https://github.com/nf-core) already meets your full analysis needs.
