# mutations_virus
<h3>Identifying amino acid predominant mutations in viruses by comparing matrices</h3>

This repository contains code and data used for the analysis performed in my Masters Dissertation.

1. <b>Trimming Long Headers</b>: Trimming the headers to unique identifiers to carry out Multiple Sequence Alignment (MSA)

2. Using CD-HIT to keep only unique sequences by removing sequences which are 100% similar:

```r
cd-hit -i <input.fasta> -o <output_90.fasta> -c 1.00 -n 5 -M 0 -T 0
```
