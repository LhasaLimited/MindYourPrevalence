# Mind your prevalence!

This repository contains the supplementary information and materials for the manuscript entitled "Mind your prevalence!" that was published in [Journal of Cheminformatics](https://doi.org/10.1186/s13321-024-00837-w).

It contains 4 files: one pdf file, one ipynb file and two R files.

The pdf file “MindYourPrevalence_SupplementaryInformation.docx” describes in detail the derivation of the performance metrics accuracy, Matthews’ correlation coefficient, positive predictivity, negative predictivity and Cohen’s kappa coefficient as functions of sensitivity, specificity and prevalence as well as their balanced version. Each plot and their corresponding function show the relationship that exists between the performance metrics and the prevalence at given values of sensitivity and specificity.

The “MindYourPrevalence.jpynb” file may be opened and executed in a JupyterLab notebook. Upon execution, an interactive plot shows the relationship between the above performance metrics and prevalence at given values of sensitivity and specificity. The values of sensitivity and specificity may be modified with sliding bars. Check boxes allow the user to select what performance metrics to display.

The two R files are R scripts that may be used in RStudio. The file “MindYourPrevalence.R” may be executed. It sources the files “UtilityFunctions.R”, so it can execute properly and shows an interactive plot with the same information and controls as above. The controls appears upon clicking on the cog icon in the top left corner of the Plots window of RStudio.

The following pieces of software were used to implement the above Supplementary Material:
- JupyterLab version 3.6.5 with Python 3.9.1 64-bit and the libraries Matplotlib version 0.1.6 [1] and ipywidgets version 8.1.1 [2]
- R version 4.0.2 (2020-06-22) [3] and the ggplot2 library version 3.2.2 [4]
- RStudio version 2023.09.0 (build 463)[5]
- Platform: x86_64-w64-mingw32/x64 (64-bit)
- Running under: Windows 10 x64 (build 19045)

# References

- [1]  J. D. Hunter (2007) Matplotlib: A 2D Graphics Environment. Comput Sci Eng 9:90–95. (https://doi.org/10.1109/MCSE.2007.55)
- [2]  Jupyter widgets community (2015) ipywidgets, a GitHub repository
- [3]  R Core Team (2021) R: A Language and Environment for Statistical Computing
- [4]  Hadley Wickham (2016) ggplot2: Elegant Graphics for Data Analysis
- [5]  Posit team (2023) RStudio: Integrated Development Environment for R


