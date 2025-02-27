## ***Too hard to get: the role of probabilistic expectations and cognitive complexity in reference point effects***

### **Research Overview**

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
model, and will test them through an experiment where subjects work on a real 
effort task with targets (i.e. reference points) in (conflicting) performance
dimensions of speed and accuracy. Subjects are split into different treatment
groups which augment their probabilistic expectations of concurrently achieving
both targets and the cognitive complexity required to reconcile them. Then, I
will analyse the likelihood of target achievements across the different groups
to verify my proposed effects.

### **Data Description**

The raw data set will be at the individual subject level and contain data on
each subject's treatment group, task performance measures (i.e. number of tasks
completed per minute, number of mistakes made, covariates (e.g. age, gender, 
education background), and responses to a survey about loss aversion. I will
transform the raw task performance measures into a categorical variable for
whether the subject achieved no targets, achieved the speed but not the accuracy
target, vice-versa, and achieved both targets, which is the dependent/ outcome
variable. I will also use the loss aversion survey responses to compute the loss
aversion levels for each subject. Finally, I will run multinomial logistic
regression to verify my hypotheses about the probabilistic expectations and
cognitive complexity effects.

### **Main Analysis and Findings**

## **Repository structure**

* _extensions: contains quarto extensions for publication formats
    * aog-article: extension for generic scholarly article format
    * wjschne/apaquarto: extension for APA format
    * elsevier: extension for Elsevier journal format
* data-raw: contains original de-identified data files obtained from surveys, firm records, and administrative databases
* data-clean: contains cleaned data files and the relevant code files which performed the cleaning (e.g. fix structure, syntax, and typos, remove unnecessary information)
* empirical-analysis: contains code files for performing more complex analysis
* manuscript-apa.qmd: reproducible research paper manuscript in APA format
* manuscript-apa.pdf: knitted research paper pdf in APA format


