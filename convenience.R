
################################################################################
#                                                                 CACHE FROM WEB
################################################################################
cache_from_web <- funciton(url, localName, dataDir="./", 
                                      overwrite=FALSE){
    # 
    # Downloads a file from the internet, and caches it once it has saved, so 
    # that future calls to this function will not download the file all over 
    # again unless it is explicitly stated that the cache should be overwritten.
    # 
    # Args: 
    # - url       = The url of the dataset located online 
    # - localName = Thee name you want the dataset to be called locally 
    #              (including extension)
    # - dataDir   = Directory where the local dataset will be saved to
    # - overwrite = If the local file already exists, should it overwrite it. 
    #               Default is FALSE: it treats the existing file as a cache of 
    #               The file. 
    # If the 
    # Requires the curl package to be installed.
    
    dataDir = "data"
    localName = "2006_US_communities_Idaho.csv"
    localPathToFile = paste(dataDir, localName, sep="/")
    
    #---------------------------------------------------------------------------
    #                     Create a new data directory if it doesnt already exist
    #---------------------------------------------------------------------------
    if(!file.exists(dataDir)){
        message("Creating a new data directory '", dataDir, "'")
        dir.create(dataDir)
    }
    
    #---------------------------------------------------------------------------
    #               Download a dataset file if it hasn't already been downloaded
    #---------------------------------------------------------------------------
    if(file.exists(localPathToFile)){
        if(!overwrite){
            dateDownloaded <- NA    # TODO: Load a datestamp from a file, so 
                                    # that it can be loaded up on start up
            message("Using existing ", localPathToFile, " file downloaded on ",
                    dateDownloaded)
        } else {
            message("About to overwrite ", localPathToFile)
        }
    } else {
        message("Downloading and saving data as ", dataFileLocal)
        download.file(fileURL, destfile=localPathToFile, method="curl")
        # Create a datestamp of the time the download was made
        dateDownloaded <- date()
        message("Download made on ", dateDownloaded)
        message("TODO: save the datestamp as a file, so it can be loaded up",
                "next time the script is run")
    }
}
