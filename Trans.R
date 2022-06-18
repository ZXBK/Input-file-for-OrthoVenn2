library(plyr)
library(data.table)
args <- commandArgs(trailingOnly = TRUE)
file_pw <- args[1]
save_name <- args[2]
#### check path
if (file.exists(file_pw)){
  setwd(file_pw)
}else{
  stop("Hold on!!! Directory is not existed",call.=FALSE)
}
print(paste0("Current direction:",getwd()))
Tog_number <- dir()
print(paste0("Number of OGs: ",length(Tog_number)))

#### check sub name
Name_list <- args[3:length(args)]
print(paste0("Number of Substitution Name:",length(Name_list)/2))
if(length(Name_list) %%2 !=0){
  stop("Hold on!!! Check Substitution Names",call.=FALSE  )
}
print(Name_list)

### Working
rdf <- data.frame()
for(og_name in Tog_number){
  og_raw <- fread(cmd=paste("grep '>'",og_name),data.table = FALSE,header = FALSE, fill=TRUE)
  for(i in 1:length(rownames(og_raw))){ # remove symbol
    og_raw[i,1] <-  sub(">","",og_raw[i,1])
  }
  for(i in 1:(length(Name_list)/2)){ # substitute name
    RawName <- Name_list[i*2-1]
    SubName <- Name_list[i*2]
    og_raw[grep(RawName,og_raw$V1),2]=SubName
  }
  og_raw$V3 <- paste(og_raw$V2,og_raw$V1,sep="|") #combine the output
  rdf <- rbind.fill(rdf,data.frame(t(og_raw$V3)))
}
write.table(rdf,file=save_name,sep="\t",quote=FALSE,row.names = FALSE,col.names = FALSE,na="")
