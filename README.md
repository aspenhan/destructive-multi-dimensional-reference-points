# Too hard to get: the role of probabilistic expectations and cognitive complexity in reference point effects

## Research Overview

My research seeks to investigate the effects of conflicting reference points
across different dimensions of utility on effort exertion. Reference-dependent
preferences have become more prevalent in economic analysis, but models so far
have assumed additive separability across different dimensions of utility, which
implies that agents respond to reference points in each dimension individually
without consideration for the others. Challenging this assumption, I hypothesize
that agents consider multi-dimensional reference points holistically: agents are
less responsive to reference points if they have low probabilistic expectations
of being able to concurrently achieve them and/or if they have difficulty 
reconciling them into a single baseline against which to evaluate outcomes. I
incorporate these effects into the Koszegi-Rabin reference-dependent preference
model and apply it to the context of effort provision under targets, mimicking
real world work scenarios. I test my propositions through an experiment where
subjects work on a slider task with targets in performance dimensions of speed
and accuracy. Subjects are split into different treatment groups which alter
the proposed parameters, and the variations in effort exertion and task performance
across treatments are then analysed.

## **Data Description**

Data collection is ongoing, with data being collected from an online Qualtrics survey.
Key variables include task performance metrics, namely sets completed per minute
and proportion of mistakes, demographic information, feedback on the task, and
measures of loss aversion in the effort exertion/ labor supply domain.

All data is de-identified and provided with consent.

## **Main Analysis and Findings**

TBD

## **Repository structure**

* _extensions: contains quarto extensions for publication formats
    * wjschne/apaquarto: extension for APA format
* data: contains raw and processed data files, along with associated coding files used for data cleaning and wrangled
    * slider-data-raw.csv: raw data from Qualtrics of all survey responses for desired variables (de-identified)
    * slider-data-cleaned.csv: cleaned version of the raw data
    * slider-data-main.csv: subset of cleaned data for main analysis
    * loss-aversion-data.csv: subset of cleaned data for loss aversion estimation
    * raw-data-processing.R: R script for transforming slider-data-raw to slider-data-cleaned
* bibliography.bib: BibTeX file containing citations for research
* manuscript-apa.qmd: quarto manuscript of research paper in APA format
* manuscript-apa.pdf: pdf file of research paper rendered from the quarto manuscript


