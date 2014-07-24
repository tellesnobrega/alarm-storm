require(plyr)
require(ggplot2)
metrics = function(directory, messages, separator) {
  dados_1.1 = read.csv(paste(directory,"worker-ack-1.log", sep="/"), sep=separator, header = TRUE)
  dados_1.2 = read.csv(paste(directory,"worker-ack-2.log", sep="/"), sep=separator, header = TRUE)
  dados_1.3 = read.csv(paste(directory,"worker-ack-3.log", sep="/"), sep=separator, header = TRUE)
  dados_1.4 = read.csv(paste(directory,"worker-ack-4.log", sep="/"), sep=separator, header = TRUE)
  dados_1.5 = read.csv(paste(directory,"worker-ack-5.log", sep="/"), sep=separator, header = TRUE)
  dados_1.6 = read.csv(paste(directory,"worker-ack-6.log", sep="/"), sep=separator, header = TRUE)
  dados_1.7 = read.csv(paste(directory,"worker-ack-7.log", sep="/"), sep=separator, header = TRUE)
  
  dados_1 = ddply(dados_1.1, .(hour, minute, second, event), summarize, total=sum(total))
  dados_2 = ddply(dados_1.2, .(hour, minute, second, event), summarize, total=sum(total))
  dados_3 = ddply(dados_1.3, .(hour, minute, second, event), summarize, total=sum(total))
  dados_4 = ddply(dados_1.4, .(hour, minute, second, event), summarize, total=sum(total))
  dados_5 = ddply(dados_1.5, .(hour, minute, second, event), summarize, total=sum(total))
  dados_6 = ddply(dados_1.6, .(hour, minute, second, event), summarize, total=sum(total))
  dados_7 = ddply(dados_1.7, .(hour, minute, second, event), summarize, total=sum(total))
  
  dados = rbind(dados_1, dados_2, dados_3, dados_4, dados_5, dados_6, dados_7)
  
  grouped = ddply(dados, .(hour,minute,second,event), summarize,total_sent = sum(total))
  
  return(grouped)
  
}

root_path = "/local/storm/experimentos/experimento7"

get_event_df = function(df) {
  event = subset(df, event=="EventSent")
  return(event)
}

get_ack_df = function(df) {
  ack = subset(df, event=="AckSent")
  return(ack)
}

trim_df = function(df) {
  trim = df[10:length(df$total_sent)-1,]
  return(trim)
}

analysis = function(df_ack, df_event,messages, df) {
  mean_ack = mean(df_ack$total_sent)
  sd_ack = mean(df_ack$total_sent)
  mean_event = mean(df_event$total_sent)
  sd_event = mean(df_event$total_sent)
  df <- rbind(df, data.frame(MessagesPerSecond=messages, Mean_Ack=mean_ack, SD_Ack=sd_ack, Mean_Event=mean_event, SD_Event=sd_event))
  return(df)
}

create_frame = function(list) {
  analysis_final = data.frame(Ack=numeric(), Event=numeric())
  for (dados in list) {
    name= comment(dados)
    print(name)
    dados_event = trim_df(get_event_df(dados))
    dados_ack = trim_df(get_ack_df(dados))
    analysis_final = analysis(dados_ack, dados_event,name,analysis_final)
  }
  return(analysis_final)
}

dados_420 = metrics(paste(root_path, 420, sep="/"), 420, ";")
dados_840 = metrics(paste(root_path, 840, sep="/"), 840, ";")
dados_1260 = metrics(paste(root_path, 1260, sep="/"), 1260, ";")
dados_2100 = metrics(paste(root_path, 2100, sep="/"), 2100, ";")
dados_4200 = metrics(paste(root_path, 4200, sep="/"), 4200, ";")
dados_8400 = metrics(paste(root_path, 8400, sep="/"), 8400, ";")
dados_16800 = metrics(paste(root_path, 16800, sep="/"), 16800, ";")
dados_33600 = metrics(paste(root_path, 33600, sep="/"), 33600, ";")
dados_67200 = metrics(paste(root_path, 67200, sep="/"), 67200, ";")

list_data = list(dados_420, dados_840, dados_1260, dados_2100, dados_4200, dados_8400, dados_16800, dados_33600, dados_67200)
analysis_table = create_frame(list_data)

plot(analysis_table$Ack)

plot = ggplot(analysis_table, aes(x=seq_along(Ack), y=Ack)) 
+ geom_line() 
+ geom_line(aes(x=seq_along(Event), y=Event), col="red")
plot