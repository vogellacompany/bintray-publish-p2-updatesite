bintray-publish-p2-updatesite
=============================

Shell script which allows to upload a p2 update-site to bintray. To run, close this repository and make the pushToBintray.sh file executable.
```
   chmod +x pushToBintray.sh
```  
Afterwards switch to your p2 repository you would like to upload and run the script:
```
  pushToBintray.sh username apikey owner repo package version
```

The repository owner may be an organization, so different then the user that uploads the files.

