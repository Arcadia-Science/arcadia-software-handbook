# Standards for public GitHub repositories at Arcadia

This document describes the standards for public GitHub repositories at Arcadia. These standards are intended to ensure that the code we release is well-documented, reproducible, and easy to use. All Arcadia GitHub repositories should meet these standards prior to being made public.

## Aside about repository templates

We have Arcadia-specific templates for [Python](https://github.com/Arcadia-Science/python-analysis-template), [Snakemake](https://github.com/Arcadia-Science/snakemake-template), and [R](https://github.com/Arcadia-Science/r-analysis-template) repositories. It is strongly recommended to start new projects using these templates, as this will mean that your repository will automatically satisfy many of the requirements below.

## Standards for organization and documentation

- **Repository organization**: The repository should be well-organized with descriptive file names and a clear directory structure.
  - Scripts, notebooks, and data files should generally be in separate directories.
  - Directory names and filenames should not include spaces or special characters.
  - Avoid very long scripts or notebooks. If a script or notebook is more than 500-1000 lines long, consider breaking it up into smaller scripts or functions.
- **Descriptive README**: The repository should include a thorough and clear README that explains the context and purpose of the repo, what the code does, and how to use it.
  - The README should explain how to create the same environment that was originally used to run the code. This includes the operating system you ran the code on, the software you installed, and the version of the software.
  - The README should include an explanation of how to access or prepare any data needed to run the code.
- **Dependency versions**: The exact versions of all direct dependencies (i.e., Python and/or R packages) used in the repository should be listed. Typically, this takes the form of a Conda environment file (usually `envs/dev.yml`).
  - For Python projects, dependencies can also be listed in a `requirements.txt` file or in `pyproject.toml` if you are using a package manager like `poetry`.
  - Caveat: for libraries or packages, it may be more appropriate to specify a minimum version, rather than an exact version, for some dependencies.
- **No large files**: The repository should not include files larger than 100MB, even if they are necessary for the code to run. If you need to include large files, they should be hosted on Zenodo or an appropriate domain-specific archive (e.g., the SRA) and a link to the files should be included in the README.
- **No sensitive information**: The repository should not include any sensitive or private information like API keys or access credentials. If the code requires sensitive information to run, it should be stored in a separate configuration file that is not included in the repository. If you accidentally added sensitive information to your repository, please reach out to the software team for help. **It is not sufficient to delete the sensitive information in a subsequent commit**, as the information will still exist in the commit history.
- **License**: The repository should use the MIT license.
  - Caveat: make sure that this license is compatible with the licenses of the software/dependencies used in your project (it usually is). Please check with the software team if you are unsure about this.

## Standards for code quality

- Code should be as clear and well-documented as possible. This includes using descriptive variable names and using comments where appropriate to explain complex or non-obvious parts of the code.
- Code and documentation should be free of absolute paths (e.g. `/home/ubuntu/my_work_dir/` or `~/Desktop/my_work_dir`). Instead, use relative paths (e.g. `../data/`) or provide a way for the user to specify their own local path using a CLI argument, a configuration parameter, or an environment variable.
- Code should be formatted and linted. The specific tools used for this will depend on the language:
  - Python repositories should use `ruff` for linting and `ruff format` for formatting. (The [Python template](https://github.com/Arcadia-Science/python-analysis-template) includes this by default.)
  - R repositories should use `lintr` for linting. (The [R template](https://github.com/Arcadia-Science/r-analysis-template) includes this by default.)
  - Snakemake repositories should use `ruff` for formatting and linting and `snakefmt` to format snakefiles.

## [Optional] Additional standards for code quality

These additional standards are recommended, as they will make your code more readable, maintainable, and reproducible, but they are not strictly required.

- Variable and function names should be descriptive, accurate, and unambiguous. Avoid unnecessary abbreviations and do not use single-letter names.
- All functions should have docstrings or comments that explain what the function does, how to use it, and the purpose and type of its arguments. This is particularly important for functions that are intended to be used by others.
- Non-obvious parts of the code should include comments that explain _why_ the code is doing what it is doing (rather than _what_ it is doing). For example, when your code uses a particular algorithm, a comment should be included to explain why that particular algorithm was chosen.
- Do not comment-out blocks of code, as this makes the code hard to read and maintain. Instead, either move the code into a conditional/if block, move it to a separate branch or file, or delete it entirely.
- Python code style should adhere to [PEP8](https://www.python.org/dev/peps/pep-0008/) as much as possible. This means using `snake_case` for variable and function names, `CamelCase` for class names, and `UPPER_SNAKE_CASE` for constants.

These standards are a condensed subset of the formatting and style conventions described in more detail in [this AUG lesson](https://training.arcadiascience.com/arcadia-users-group/20240206-intro-to-formatting-and-linting/lesson/arcadia-users-group/20240206-intro-to-formatting-and-linting/).
