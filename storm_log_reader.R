require(plyr)
require(ggplot2)
metrics = function(directory, messages) {
  dados_1.1 = read.csv(paste(directory,"worker-ack-1.log", sep="/"), sep=" ", header = TRUE)
  dados_1.2 = read.csv(paste(directory,"worker-ack-2.log", sep="/"), sep=" ", header = TRUE)
  dados_1.3 = read.csv(paste(directory,"worker-ack-3.log", sep="/"), sep=" ", header = TRUE)
  dados_1.4 = read.csv(paste(directory,"worker-ack-4.log", sep="/"), sep=" ", header = TRUE)
  dados_1.5 = read.csv(paste(directory,"worker-ack-5.log", sep="/"), sep=" ", header = TRUE)
  dados_1.6 = read.csv(paste(directory,"worker-ack-6.log", sep="/"), sep=" ", header = TRUE)
  dados_1.7 = read.csv(paste(directory,"worker-ack-7.log", sep="/"), sep=" ", header = TRUE)
  
  dados = rbind(dados_1.1, dados_1.2, dados_1.3, dados_1.4, dados_1.5, dados_1.6, dados_1.7)
  
  dados_consumption = subset(dados, dados$unit == 'ConsumptionSpout' | dados$unit == 'AverageCalcBolt')  
  
  grouped = ddply(dados_consumption, .(time,locale, unit), summarize, total = length(time))
  
  return(grouped)
  
}

root_path = "/local/storm/experimentos/teste"

get_event_df = function(df) {
  event = subset(df, df$locale == 'EventSent:')
  return(event)
}

get_ack_df = function(df) {
  ack = subset(df, df$locale == 'ACK:')
  return(ack)
}

trim_df = function(df) {
  trim = df[10:length(df$total)-1,]
  return(trim)
}

analysis = function(df_ack, df_event,messages, df) {
  mean_df_ack = mean(df_ack$total)
  mean_df_event = mean(df_event$total)
  df <- rbind(df, data.frame(MessagesPerSecond=messages, Ack=mean_df_ack, Event=mean_df_event))
  return(df)
}

create_frame = function(root_path, list, messages) {
  analysis_final = data.frame(MessagesPerSecond=numeric(), Ack=numeric(), Event=numeric())
  for (dados in list) {
    print(dados)
    dados_event = trim_df(get_event_df(dados))
    dados_ack = trim_df(get_ack_df(dados))
    analysis_final = analysis(dados_ack, dados_event, messages, analysis_final)
  }
  return(analysis_final)
}

dados_420 = metrics(paste(root_path, 420, sep="/"), 420)
dados_840 = metrics(paste(root_path, 840, sep="/"), 840)
dados_1260 = metrics(paste(root_path, 1260, sep="/"), 1260)
dados_2100 = metrics(paste(root_path, 2100, sep="/"), 2100)
dados_4200 = metrics(paste(root_path, 4200, sep="/"), 4200)
dados_8400 = metrics(paste(root_path, 8400, sep="/"), 8400)
dados_16800 = metrics(paste(root_path, 16800, sep="/"), 16800)
dados_33600 = metrics(paste(root_path, 33600, sep="/"), 33600)
dados_67200 = metrics(paste(root_path, 67200, sep="/"), 67200)

list_data = list(dados_420, dados_840, dados_1260, dados_2100, dados_4200, dados_8400, dados_16800, dados_33600, dados_67200)
# list = c(100,420)
analysis_table = create_frame(root_path, list(dados_420),420)

plot(analysis_table$Ack)

plot = ggplot(analysis_table, aes(x=seq_along(Ack), y=Ack)) 
+ geom_line() 
+ geom_line(aes(x=seq_along(Event), y=Event), col="red")
plot
