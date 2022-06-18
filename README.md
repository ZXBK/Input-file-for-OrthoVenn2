# Input-file-for-OrthoVenn2
Transfer Orthogroups(OG) files from OrthoFinder into OrthoVenn2 ClusterVenn to do the visualization

## OrthoFinder : https://github.com/davidemms/OrthoFinder
## OrthoVenn2 : https://orthovenn2.bioinfotoolkits.net/home

### Note:
- Required R packages: **data.table & plyr** 
- Directory permission should be changed for creating new files
- 
### Usage:
Rscript Trans.R [file of Example] [Output File name] [Raw Name1] [New Name2] [Raw Name2] [New Name2] ...

ex:
Rscript Trans.R /Path/to/Example Name_of_output MRO Mr XP_0180 Ha XP_02 Lv LOCUS Mj maker Mn
