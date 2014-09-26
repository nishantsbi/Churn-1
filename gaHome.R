rga.open(instance="ga", where="~/ga.rga")
#gaProfiles <- ga$getProperties() #
id_SFL_Android <- 67829698
id_SFL_Retail <- 75522817
id_SFL_Web <- 24104029 #UA-511060-5
id_SFL_Wap <- 24104308
id_SFL_HTML5 <- 74630936 #UA-37575570-6
event_SFL_Android_Locate <- list(category="Locates",action="Locate", label=c("Locate Started","Locate Succeeded","Failed Locate")) 



#bugs/gaps
## web
### no locate events
### no cancel events
### no signup complete event
### no schedule CRUD event
### no place CRUD event
