# Causal_Uganda

## Code for Analysis
Code for the final project of the course "Introduction to Causal Inference", entitled "Entrepreneurship in Uganda".

It has been provided in two formats; an RStudio project and an interactive Jupyter notebook.

If you have the `conda` package manager, e.g. via Miniconda or Anaconda, you can create a virtual environment with all of the dependencies for the code installed, by running in the terminal (with pwd `Causal_Uganda`):

```
conda env create -f virtual_environment.yaml
```

Then, to activate this virtual environment, input into the terminal:

```
conda activate causal_uganda
```

Now you have all of the dependencies for this project installed. To run the code, do one of the following:

### Jupyter Notebook

```
jupyter notebook ./report/Notebook.ipynb
```

### RStudio

```
conda install RStudio
RStudio
```

Then, from within the RStudio GUI, open the file `Causal_1_Uganda.Rproj`.

## Balance Table

This is available as an Excel Spreadsheet in this directory: `SEED_balance_table.xlsx`. It is also viewable as a Jupyter notebook, `data_cleaning.ipynb`, which also gives the code importing and converting the Excel spreadsheet. This was what was used, with some modifications, to create the version presented in the report.

## Report

The files for creating the report are available in the `report` directory. That directory includes the Jupyter notebook with the code for the analysis, the causal diagram produced by the R script `Uganda_DAG.R` in the main directory, and all of the LaTeX files used to compile the report document. The master LaTeX file is `./report/LaTeX-files/main/report.tex`. Compiling that file will reproduce the entire report. The final result `report.pdf` is also included in the root directory.

## Presentation Slides

This is `presentation.pdf`.