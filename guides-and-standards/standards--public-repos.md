# Standards for public GitHub repositories at Arcadia

This document describes the standards for public GitHub repositories at Arcadia. These standards are intended to ensure that the code we release is well-documented, reproducible, and usable. All Arcadia GitHub repositories should meet these standards prior to being made public.

## Aside about repository templates

We have Arcadia-specific templates for [Python](https://github.com/Arcadia-Science/python-analysis-template), [R](https://github.com/Arcadia-Science/r-analysis-template), [Snakemake](https://github.com/Arcadia-Science/snakemake-template), and [Nextflow](https://github.com/Arcadia-Science/nextflow-template-repository) repositories. It is strongly recommended to start new projects using these templates, as this will mean that your repository will automatically satisfy many of the requirements below.

## Standards for organization and documentation

- **Clear repository organization**: The repository should be well-organized with descriptive and consistent file names and a clear directory structure, and directory names and filenames should not include spaces or special characters. Check out the template repositories mentioned above for examples of how to organize repositories.
- **Descriptive README**: The repository should include a thorough and clear README that explains the context and purpose of the repo, what the code does, and how to use it.
  - For repos accompanying pubs, the repo should clearly indicate that it accompanies a pub and must include a link to the pub itself.
  - The README should explain how to create the same environment that was originally used to run the code. This includes the operating system you ran the code on and the software tools and packages you installed, along with their versions. When possible, provide an automated way to create the environment. Usually, this means providing a conda environment file that can be used with `conda env create`. When an automated approach is not possible (for example, for packages that are not conda-installable), provide clear step-by-step instructions along with the list of software and versions that need to be installed manually.
  - The README should include an explanation of how to access or prepare any data needed to run the code that is not included in the repository.
  - Check out the README in the [Python project template](https://github.com/Arcadia-Science/python-analysis-template) for an example of a thorough README.
- **Pinned dependency versions**: The exact versions of all direct dependencies (i.e., Python and/or R packages) used in the repository should be listed. This usually takes the form of a Conda environment file (usually `envs/dev.yml`).
  - For Python projects, a Python-specific package manager can also be used (we prefer [Poetry](https://python-poetry.org)). In these cases, dependencies may be listed in `requirements.txt`, `uv.ock`, or in `pyproject.toml` instead of in a Conda environment file.
  - Caveat: when developing libraries or packages, it may be more appropriate to specify a minimum version, rather than an exact version, for some dependencies, so that users of the package can install the latest versions of its dependencies.
- **No absolute filepaths**: All code and documentation should be free of absolute paths (e.g. `/home/ubuntu/my_work_dir/` or `~/Desktop/my_work_dir`). Instead, use relative paths (e.g. `../data/`) or provide a way for the user to specify their own local path using a CLI argument, a configuration parameter, or an environment variable.
- **No large files**: The repository should not include files larger than 100MB, even if they are necessary for the code to run. If you need to include large files, they should be hosted on Zenodo or an appropriate domain-specific archive (e.g., the SRA). In rare cases where neither of these options are possible or appropriate, a custom public S3 bucket can be used. In all cases, a link to the files should be included in the README.
- **No sensitive information**: The repository should not include any sensitive or private information like API keys or access credentials. See [the section below](#about-sensitive-information) for more information on this.
- **License**: The repository should use the MIT license, if possible. Please refer to [this notion page](https://www.notion.so/arcadiascience/Coding-at-Arcadia-Software-Licensing-Policy-9054a0b178d74a42a7a4ad41de46a671?pvs=4) for more information.
  - Caveat: the MIT license is compatible with most, but not all, other open-source software licenses. If your project uses software with an incompatible license, you will need to use a different license. Please check with both the legal team and the software team if you are unsure about this.
- **CITATION.cff**: We encourage all **pub-related** repositories to include a CITATION.cff file in the repo which contains the citation for the pub. This will be automatically generated when the first byline sign-off request is sent. You will receive a Slack message with a link to download it from the [Current pubs](https://airtable.com/appN7KQ55bT6HHfog/pagC0lEtFxTO510BP?u3Ldt=allRecords) page on Airtable.
- **No long source code files** Avoid very long scripts or notebooks. For typical Python and R projects, "very Long" usually means a length of around 1000 lines. Longer files are almost always better off broken up into separate files/modules of related code.
- **Code quality**: Code should be clear and well-documented. This includes using descriptive variable names and using comments where appropriate to explain complex or non-obvious parts of the code.

## About sensitive information

When a repository is made public, its entire commit history and all of its PRs - whether they were merged or not - are also made public. **This means that any sensitive information that was included in the repository at any point in time, even in PRs that were never merged, will be publicly accessible.**

If the code in a repository requires sensitive information to run, it should be stored in a separate configuration file that is not included in the repository. If you accidentally added sensitive information to your repository, please reach out to the software team for help. **It is not sufficient to delete the sensitive information by overwriting it in a subsequent commit**, as the information will still exist in the commit history and/or closed PRs.

## [Optional] Standards for code quality

These additional standards are recommended, as they will make your code more readable, maintainable, and reproducible, but they are not required. They are condensed from the formatting and style conventions described in more detail in [this AUG lesson](https://training.arcadiascience.com/arcadia-users-group/20240206-intro-to-formatting-and-linting/lesson/).

- Variable and function names should be unambiguous and should not include unnecessary abbreviations.
- Avoid single-letter variable names except in for-loops or in other local contexts in which their meaning is unambiguous.
- All functions should have docstrings or comments that explain what the function does, how to use it, and the purpose and type of its arguments. This is particularly important for functions that are intended to be used by others.
- Non-obvious parts of the code should include comments that explain _why_ the code is doing what it is doing (rather than _what_ it is doing). For example, when your code uses a particular algorithm, a comment should be included to explain why that particular algorithm was chosen.
- Do not comment-out blocks of code, as this makes the code hard to read and maintain. Instead, either move the code into a conditional/if block, move it to a separate branch or file, or delete it entirely.
- Python code style should adhere to [PEP8](https://www.python.org/dev/peps/pep-0008/) as much as possible. This means using `snake_case` for variable and function names, `CamelCase` for class names, and `UPPER_SNAKE_CASE` for constants.
