# mutations_virus
<h3>Identifying amino acid predominant mutations in viruses by comparing matrices</h3>

This repository contains code and data used for the analysis performed in my Masters Dissertation.

<b>Functions in Final_Code</b>:

1. <b>Trimming Long Headers</b>: Trimming the headers to unique identifiers to carry out Multiple Sequence Alignment (MSA)

For example, for HBV:
```r
Input: HBV_preS_300_400_829.fasta
Output: HBV_preS_trim.fasta
```

2. Using CD-HIT to keep only unique sequences by removing sequences which are 100% similar:

```r
cd-hit -i <input.fasta> -o <output_90.fasta> -c 1.00 -n 5 -M 0 -T 0
```

For example, for HBV:
```r
Input: HBV_preS_trim.fasta
Output: HBV_preS_90.fasta
```

3. <b>Length Criteria</b>: Filtering the sequences based on length of protein sequences

For example, for HBV:
```r
Input: HBV_preS_90.fasta
Output: HBV_preS_len_range.fasta
```

4. <b>Removing Ambiguous sequences</b>: Removing sequences containing ambiguous characters

For example, for HBV:
```r
Input: HBV_preS_len_range.fasta
Output: HBV_preS_pure_seq.fas
```

5. Carrying out MSA:

```r
mafft input.fasta > output.fasta
```

For example, for HBV:
```r
Input: HBV_preS_pure_seq.fas
Output: HBV_preS_msa.fasta
```

6. <b>Removing sequences with long gaps for MSA</b>: Finding sequences in MSA file that contain gaps > 10 and removed all those sequences from the fasta file

For example, for HBV:
```r
Input: HBV_preS_pure_seq.fas, HBV_preS_msa.fasta
Output: HBV_preS_gap_filter.fasta
```

7. Carrying out MSA again:

```r
mafft input.fasta > output.fasta
```

For example, for HBV:
```r
Input: HBV_preS_gap_filter.fasta
Output: HBV_preS_gap_filter_msa.fasta
```

8. <b>Making Substitution Matrix</b>: 

<br>a. Making substitution matrix (PAM 250) based on Point Accepted Mutation (PAM) algorithm</br>
<br>b. Performing chi-squared test to find whether the matrices compared are significantly different or not</br>
<br>c. To find which values (amino acid substitutions) are significantly different:</br>
<ul>
  <li>Finding Average differences between Matrix</li>
  <li>Calculating Standard Deviation (SD)</li>
  <li>Finding difference matrix</li>
</ul>

Considering those substitutions as significant for which the values in the difference matrix are greater than SD

9. <b>Calculating Entropy at every sequence position</b>: Calculating entropy helps in finding which positions in protein sequences are highly variable and which are conserved.

10. <b>Filter variable positions</b>: Filtering out positions which are highly variable

<b>Matrix</b>: Contains Matrices derived from protein sequences. Matrices with name ending 'wr' are matrices whose values are not rounded (wr - without rounding)

<b>nil_selection_pressure</b>: Acting as a control when comparing Protein under Selection Pressure and Dayhoff PAM 250

<b>Presentations and Report</b>: Contains the Final Report containing all the details of the analysis as well as the Presentations presented in my Masters Dissertation.