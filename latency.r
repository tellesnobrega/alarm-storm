require(plyr)
require(ggplot2)
require(Rmisc)
metrics = function(directory, separator) {
  
  dados_0 = read_data(directory, 0, separator)
  dados_1 = read_data(directory, 1, separator)
  dados_2 = read_data(directory, 2, separator)
  dados_3 = read_data(directory, 3, separator)
  
  dados = rbind(dados_0, dados_1, dados_2, dados_3)
  
  grouped = ddply(dados, .(hour,minute,second,event), summarize,total = sum(total))
  
  return(grouped)
  
}

read_data = function(directory, number, separator) {
  dados_1 = read.csv(paste(directory,paste("worker-trimmed",number,"1.log",sep="-"), sep="/"), sep=separator, header = TRUE)
  dados_2 = read.csv(paste(directory,paste("worker-trimmed",number,"2.log",sep="-"), sep="/"), sep=separator, header = TRUE)
  dados_3 = read.csv(paste(directory,paste("worker-trimmed",number,"3.log",sep="-"), sep="/"), sep=separator, header = TRUE)
  dados_4 = read.csv(paste(directory,paste("worker-trimmed",number,"4.log",sep="-"), sep="/"), sep=separator, header = TRUE)
  dados_5 = read.csv(paste(directory,paste("worker-trimmed",number,"5.log",sep="-"), sep="/"), sep=separator, header = TRUE)
  dados_6 = read.csv(paste(directory,paste("worker-trimmed",number,"6.log",sep="-"), sep="/"), sep=separator, header = TRUE)
  dados_7 = read.csv(paste(directory,paste("worker-trimmed",number,"7.log",sep="-"), sep="/"), sep=separator, header = TRUE)
  
  dados_trimmed_1 = ddply(dados_1, .(hour, minute, second), summarize, total=sum(total))
  dados_trimmed_2 = ddply(dados_2, .(hour, minute, second), summarize, total=sum(total))
  dados_trimmed_3 = ddply(dados_3, .(hour, minute, second), summarize, total=sum(total))
  dados_trimmed_4 = ddply(dados_4, .(hour, minute, second), summarize, total=sum(total))
  dados_trimmed_5 = ddply(dados_5, .(hour, minute, second), summarize, total=sum(total))
  dados_trimmed_6 = ddply(dados_6, .(hour, minute, second), summarize, total=sum(total))
  dados_trimmed_7 = ddply(dados_7, .(hour, minute, second), summarize, total=sum(total))
  
  dados_trimmed = rbind(dados_trimmed_1, dados_trimmed_2, dados_trimmed_3, dados_trimmed_4, dados_trimmed_5, dados_trimmed_6, dados_trimmed_7)
  return(dados_trimmed)
}

get_ack_df = function(dff) {
  ack = subset(dff, event=="AckSent",row.names = FALSE)
  return(ack)
}

trim_df = function(dff) {
  trim = dff[1:length(dff$total)-1,]
  trim = remove_last_minute(remove_first_minute(group_df_by_1_minute(trim)))
  return(trim)
}

group_df_by_1_minute = function(dff) {
  count=0
  group=0
  for(row in 1:length(dff$total)) {
    count = count + 1
    dff$By1[row] = as.numeric(group)
    if(count == 60) {
      group = group + 1 
      count = 0
    }
  }
  return(dff)
}

remove_first_minute = function(dff){
  new_df = subset(dff, By1 != 0)
  return(new_df)
}

remove_last_minute = function(dff){
  new_df = subset(dff, By1 != 11)
  return(new_df)
}

analysis = function(df_ack, df_event, num_messages, dff) {
  data_ack = data.frame(mean_ack=mean(df_ack$total))
  
  data_ack$MessagesPerSecond = num_messages
  
  dff <- rbind(dff, data_ack)
  return(dff)
}

create_frame = function(root_path, list_dados, messages) {
  analysis_final = data.frame(MessagesPerSecond=numeric())
  for (dados in list_dados) {
    dados_event = trim_df(get_event_df(dados))
    dados_ack = trim_df(get_ack_df(dados))
    analysis_final = analysis(dados_ack, dados_event, messages, analysis_final)
  }
  return(analysis_final)
}

create_data_list = function(run) {
  data_1260 = metrics(paste(root_path,1260, run ,sep="/"), ";")
  data_8400 = metrics(paste(root_path,8400, run ,sep="/"), ";")
  data_10500 = metrics(paste(root_path,10500, run ,sep="/"), ";")
  data_25200 = metrics(paste(root_path,16800, run ,sep="/"), ";")
  
  list_data = list(data_1260, data_8400, data_10500, data_16800)
  return(list_data)
}

create_data_list_by_input_rate = function(rate) {
  data_0 = metrics(paste(root_path,rate, 0 ,sep="/"), ";")
  data_1 = metrics(paste(root_path,rate, 1 ,sep="/"), ";")
  data_2 = metrics(paste(root_path,rate, 2 ,sep="/"), ";")  
  data_3 = metrics(paste(root_path,rate, 3 ,sep="/"), ";")
  data_4 = metrics(paste(root_path,rate, 4 ,sep="/"), ";")
  data_5 = metrics(paste(root_path,rate, 5 ,sep="/"), ";")
  data_6 = metrics(paste(root_path,rate, 6 ,sep="/"), ";")
  data_7 = metrics(paste(root_path,rate, 7 ,sep="/"), ";")
  data_8 = metrics(paste(root_path,rate, 8 ,sep="/"), ";")  
  data_9 = metrics(paste(root_path,rate, 9 ,sep="/"), ";")  
  
  list_data = list(data_0, data_1, data_2, data_3, data_4, data_5, data_6, data_7, data_8, data_9)
  return(list_data)
}

run = function(root_path) {
  
  list_data_1260 = create_data_list_by_input_rate(1260)
  list_data_8400 = create_data_list_by_input_rate(8400)
  list_data_10500 = create_data_list_by_input_rate(10500)
  list_data_16800 = create_data_list_by_input_rate(16800)
  
  analysis_table_1260= create_frame(root_path, list_data_1260, 1260)
  analysis_table_8400= create_frame(root_path, list_data_8400, 8400)
  analysis_table_10500= create_frame(root_path, list_data_25200, 10500)
  analysis_table_16800= create_frame(root_path, list_data_16800, 16800)

  grouped_analysis = rbind(analysis_table_1260,
                           analysis_table_8400,
                           analysis_table_10500,
                           analysis_table_16800)
  
  final_table = ddply(grouped_analysis, 
                      .(MessagesPerSecond), 
                      summarize, 
                      ack_mean=mean(mean_ack), 
                      ack_sd=sd(mean_ack),
                      ack_min=CI(mean_ack)[3],
                      ack_max=CI(mean_ack)[1])
  
  return(final_table)
  
}

root_path = "/local/storm/experimentos/latency"
data = run(root_path)


###Plot
p1 = qplot(sample = list_data_420$mean_ack,  stat = "qq") + ggtitle(expression("420 Mensagens"))
p2 = qplot(sample = data_840$Ack_Mean,  stat = "qq") + ggtitle(expression("840 Mensagens"))
p3 = qplot(sample = data_1260$Ack_Mean,  stat = "qq") + ggtitle(expression("1260 Mensagens"))
p4 = qplot(sample = data_2100$Ack_Mean,  stat = "qq") + ggtitle(expression("2100 Mensagens"))
p5 = qplot(sample = data_4200$Ack_Mean,  stat = "qq") + ggtitle(expression("4200 Mensagens"))
p6 = qplot(sample = data_8400$Ack_Mean,  stat = "qq") + ggtitle(expression("8400 Mensagens"))
p7 = qplot(sample = data_16800$Ack_Mean,  stat = "qq") + ggtitle(expression("16800 Mensagens"))
p8 = qplot(sample = data_33600$Ack_Mean,  stat = "qq") + ggtitle(expression("33600 Mensagens"))
p9 = qplot(sample = data_67200$Ack_Mean,  stat = "qq") + ggtitle(expression("67200 Mensagens"))

multiplot(p1, p2, p3, p4, p5, p6, p7, p8, p9, cols=3)

shapiro.test(data_420$Ack_Mean)
shapiro.test(data_840$Ack_Mean)
shapiro.test(data_1260$Ack_Mean)
shapiro.test(data_2100$Ack_Mean)
shapiro.test(data_4200$Ack_Mean)
shapiro.test(data_8400$Ack_Mean)
shapiro.test(data_16800$Ack_Mean)
shapiro.test(data_33600$Ack_Mean)
shapiro.test(data_67200$Ack_Mean)


png("latency.png")
ggplot(data, aes(x=seq_along(ack_mean), y=(ack_mean/event_mean))) + 
  geom_line() +
  geom_errorbar(aes(ymin=ack_min/event_mean, ymax=ack_max/event_mean), width=.2, col="red") +
  geom_point() + 
  scale_x_discrete(breaks=seq_along(data$ack_mean), labels=list_messages) + scale_fill_hue("MessagesPerSecond") +
  xlab("Messages/s") +
  ylab("Acks/s") + theme(legend.position="none")

dev.off()
# ggplot(data_0, aes(x=MessagesPerSecond, y=Ack_Mean, colour="red")) + 
#   geom_errorbar(aes(ymin=Ack_Mean-(Ack_SD*1.96), ymax=Ack_Mean+(Ack_SD*1.96), width=1000) +
#   geom_point()
