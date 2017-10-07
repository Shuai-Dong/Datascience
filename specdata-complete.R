complete<-function(directory,id=1:332){
        full_list<-list.files(directory,full.names=TRUE)
        data<-data.frame()
        nobs<-numeric()
        
        for (i in id){
                data<-read.csv(full_list[i])
                nobs<-c(nobs,sum(complete.cases(data)))
        }        
        data.frame(id=id,nobs=nobs)
}
