# Standards for public GitHub repositories at Arcadia

This document describes the standards for public GitHub repositories at Arcadia. These standards are intended to ensure that the code we release is well-documented, reproducible, and easy to use. All Arcadia GitHub repositories should meet these standards prior to being made public.

## Aside about repository templates

We have Arcadia-specific templates for [Python](https://github.com/Arcadia-Science/python-analysis-template), [Snakemake](https://github.com/Arcadia-Science/snakemake-template), and [R](https://github.com/Arcadia-Science/r-analysis-template) repositories. It is strongly recommended to start new projects using these templates, as this will mean that your repository will automatically satisfy many of the requirements below.

## Standards for organization and documentation

- **Directory structure**: The repository should be well-organized with descriptive file names and a clear directory structure. For example, scripts, notebooks, and data files should generally be in separate directories. Directory names and filenames should not include spaces or special characters.
- **Descriptive README**: The repository should include a thorough and clear README that explains the context and purpose of the repo, what the code does, and how to use it. In particular, the README should include the following:
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

- Variable and function names should be descriptive and meaningful. Avoid ambiguous or unnecessary abbreviations and avoid single-letter variable names.
- All functions should have docstrings that explain _what_ the function does. These do not have to be extensive; they just need to give the reader a basic understanding of the purpose of the function.
- Non-obvious parts of the code should include comments that explain _why_ the code is doing what it is doing (rather than _what_ it is doing). For example, when your code runs a particular algorithm, a comment should be included to explain why that particular algorithm was chosen.
- Code should not include any absolute paths (e.g. `/home/ubuntu/my_work_dir/` or `~/Desktop/my_work_dir`). Instead, use relative paths (e.g. `../data/`) or provide a way for the user to specify their own local path using a CLI argument, a configuration parameter, or an environment variable.

### Python and Snakemake repositories

- Code style should adhere to [PEP8](https://www.python.org/dev/peps/pep-0008/) as much as possible. This means using `snake_case` for variable and function names, `CamelCase` for class names, and `UPPER_SNAKE_CASE` for constants.
- `ruff` should be used for formatting and linting (our [Python template](https://github.com/Arcadia-Science/python-analysis-template) includes this by default).

### R repositories

- `lintr` should be used for linting. (our [R template](https://github.com/Arcadia-Science/r-analysis-template) includes this by default).
