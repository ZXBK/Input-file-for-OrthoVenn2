# Input-file-for-OrthoVenn2
Transfer Orthogroups(OG) files from OrthoFinder into OrthoVenn2 ClusterVenn to do the visualization

## OrthoFinder : https://github.com/davidemms/OrthoFinder
## OrthoVenn2 : https://orthovenn2.bioinfotoolkits.net/home

### Note:
- Required R packages: **data.table & plyr** 
- Directory permission should be changed for creating new files


### Usage:
```bash
docker run -itd --name NameIt -v  $PWD:/in -w /in davidemms/orthofinder:2.5.4 bash
docker exec -it NameIt bash
nohup orthofinder -f /in/ -t 20 -a 20 -M msa &
```
- faa should be in directory: /in 
- The OG files will be in: /in/OrthoFinder/Results_Oct04/Orthogroup_Sequences/

---

Rscript Trans.R [Path to OGs] [Output File name] [Raw Name1] [New Name1] [Raw Name2] [New Name2] ...
```bash
Rscript Trans.R /Example_file OutPutFile MRO Mr XP_0180 Ha XP_02 Lv LOCUS Mj maker Mn
```
- OutPutFile will be in /Example_file/
- Using "ClusterVenn" funciton on [OrthoVenn2](https://orthovenn2.bioinfotoolkits.net/cluster-venn) and upload OutPutFile
- "Raw Name" and "New Name" column is mainly for demand from OrthoVenn2 format
