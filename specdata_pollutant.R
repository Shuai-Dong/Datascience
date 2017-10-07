pollutantmean<-function(directory,pollutant,id=1:332) {
        full_list<-list.files(directory,full.names=TRUE)
        
        data<-data.frame()
        for (i in id) {
                data<-rbind(data,read.csv(full_list[i]))
        }
        data_subset<-data[,pollutant]
        mean(data_subset,na.rm=TRUE)
        
}
