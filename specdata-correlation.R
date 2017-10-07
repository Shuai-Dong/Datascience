corr<-function(directory,threshold=0){
        
        files_full<-list.files(directory,full.names=TRUE)
        
        data<-numeric()
        
        for(i in 1:332){
                
                data2<-read.csv(files_full[i])
                
                s<-sum(complete.cases(data2))
                
                if(s>threshold){
                        
                        tmp<-data2[(!is.na(data2$sulfate)) & (!is.na(data2$nitrate)),]
                        
                        data<-c(data,cor(tmp$sulfate,tmp$nitrate))
                        
                }
                
        }
        
        data
        
}
