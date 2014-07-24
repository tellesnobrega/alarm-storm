require(plyr)
require(ggplot2)
require(Rmisc)
metrics = function(directory, separator) {
  dados_0.1 = read.csv(paste(directory,"worker-trimmed-0-1.log", sep="/"), sep=separator, header = TRUE)
  dados_0.2 = read.csv(paste(directory,"worker-trimmed-0-2.log", sep="/"), sep=separator, header = TRUE)
  dados_0.3 = read.csv(paste(directory,"worker-trimmed-0-3.log", sep="/"), sep=separator, header = TRUE)
  dados_0.4 = read.csv(paste(directory,"worker-trimmed-0-4.log", sep="/"), sep=separator, header = TRUE)
  dados_0.5 = read.csv(paste(directory,"worker-trimmed-0-5.log", sep="/"), sep=separator, header = TRUE)
  dados_0.6 = read.csv(paste(directory,"worker-trimmed-0-6.log", sep="/"), sep=separator, header = TRUE)
  dados_0.7 = read.csv(paste(directory,"worker-trimmed-0-7.log", sep="/"), sep=separator, header = TRUE)
  
  dados_1.1 = read.csv(paste(directory,"worker-trimmed-1-1.log", sep="/"), sep=separator, header = TRUE)
  dados_1.2 = read.csv(paste(directory,"worker-trimmed-1-2.log", sep="/"), sep=separator, header = TRUE)
  dados_1.3 = read.csv(paste(directory,"worker-trimmed-1-3.log", sep="/"), sep=separator, header = TRUE)
  dados_1.4 = read.csv(paste(directory,"worker-trimmed-1-4.log", sep="/"), sep=separator, header = TRUE)
  dados_1.5 = read.csv(paste(directory,"worker-trimmed-1-5.log", sep="/"), sep=separator, header = TRUE)
  dados_1.6 = read.csv(paste(directory,"worker-trimmed-1-6.log", sep="/"), sep=separator, header = TRUE)
  dados_1.7 = read.csv(paste(directory,"worker-trimmed-1-7.log", sep="/"), sep=separator, header = TRUE)
  
  dados_2.1 = read.csv(paste(directory,"worker-trimmed-2-1.log", sep="/"), sep=separator, header = TRUE)
  dados_2.2 = read.csv(paste(directory,"worker-trimmed-2-2.log", sep="/"), sep=separator, header = TRUE)
  dados_2.3 = read.csv(paste(directory,"worker-trimmed-2-3.log", sep="/"), sep=separator, header = TRUE)
  dados_2.4 = read.csv(paste(directory,"worker-trimmed-2-4.log", sep="/"), sep=separator, header = TRUE)
  dados_2.5 = read.csv(paste(directory,"worker-trimmed-2-5.log", sep="/"), sep=separator, header = TRUE)
  dados_2.6 = read.csv(paste(directory,"worker-trimmed-2-6.log", sep="/"), sep=separator, header = TRUE)
  dados_2.7 = read.csv(paste(directory,"worker-trimmed-2-7.log", sep="/"), sep=separator, header = TRUE)
  
  dados_3.1 = read.csv(paste(directory,"worker-trimmed-3-1.log", sep="/"), sep=separator, header = TRUE)
  dados_3.2 = read.csv(paste(directory,"worker-trimmed-3-2.log", sep="/"), sep=separator, header = TRUE)
  dados_3.3 = read.csv(paste(directory,"worker-trimmed-3-3.log", sep="/"), sep=separator, header = TRUE)
  dados_3.4 = read.csv(paste(directory,"worker-trimmed-3-4.log", sep="/"), sep=separator, header = TRUE)
  dados_3.5 = read.csv(paste(directory,"worker-trimmed-3-5.log", sep="/"), sep=separator, header = TRUE)
  dados_3.6 = read.csv(paste(directory,"worker-trimmed-3-6.log", sep="/"), sep=separator, header = TRUE)
  dados_3.7 = read.csv(paste(directory,"worker-trimmed-3-7.log", sep="/"), sep=separator, header = TRUE)
  
  dados_trimmed_0.1 = ddply(dados_0.1, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_0.2 = ddply(dados_0.2, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_0.3 = ddply(dados_0.3, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_0.4 = ddply(dados_0.4, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_0.5 = ddply(dados_0.5, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_0.6 = ddply(dados_0.6, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_0.7 = ddply(dados_0.7, .(hour, minute, second, event), summarize, total=sum(total))
  
  dados_trimmed_1.1 = ddply(dados_1.1, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_1.2 = ddply(dados_1.2, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_1.3 = ddply(dados_1.3, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_1.4 = ddply(dados_1.4, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_1.5 = ddply(dados_1.5, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_1.6 = ddply(dados_1.6, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_1.7 = ddply(dados_1.7, .(hour, minute, second, event), summarize, total=sum(total))
  
  dados_trimmed_2.1 = ddply(dados_2.1, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_2.2 = ddply(dados_2.2, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_2.3 = ddply(dados_2.3, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_2.4 = ddply(dados_2.4, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_2.5 = ddply(dados_2.5, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_2.6 = ddply(dados_2.6, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_2.7 = ddply(dados_2.7, .(hour, minute, second, event), summarize, total=sum(total))
  
  dados_trimmed_3.1 = ddply(dados_3.1, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_3.2 = ddply(dados_3.2, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_3.3 = ddply(dados_3.3, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_3.4 = ddply(dados_3.4, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_3.5 = ddply(dados_3.5, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_3.6 = ddply(dados_3.6, .(hour, minute, second, event), summarize, total=sum(total))
  dados_trimmed_3.7 = ddply(dados_3.7, .(hour, minute, second, event), summarize, total=sum(total))
  
  dados_trimmed_0 = rbind(dados_trimmed_0.1, dados_trimmed_0.2, dados_trimmed_0.3, dados_trimmed_0.4, dados_trimmed_0.5, dados_trimmed_0.6, dados_trimmed_0.7)
  dados_trimmed_1 = rbind(dados_trimmed_1.1, dados_trimmed_1.2, dados_trimmed_1.3, dados_trimmed_1.4, dados_trimmed_1.5, dados_trimmed_1.6, dados_trimmed_1.7)
  dados_trimmed_2 = rbind(dados_trimmed_2.1, dados_trimmed_2.2, dados_trimmed_2.3, dados_trimmed_2.4, dados_trimmed_2.5, dados_trimmed_2.6, dados_trimmed_2.7)
  dados_trimmed_3 = rbind(dados_trimmed_3.1, dados_trimmed_3.2, dados_trimmed_3.3, dados_trimmed_3.4, dados_trimmed_3.5, dados_trimmed_3.6, dados_trimmed_3.7)
  
  dados = rbind(dados_trimmed_0, dados_trimmed_1, dados_trimmed_2, dados_trimmed_3)
  
  grouped = ddply(dados, .(hour,minute,second,event), summarize,total = sum(total))
  
  return(grouped)
  
}

get_event_df = function(dff) {
  event = subset(dff, event=="EventSent", row.names = FALSE)
  return(event)
}

get_ack_df = function(dff) {
  ack = subset(dff, event=="AckSent",row.names = FALSE)
  return(ack)
}

trim_df = function(dff) {
  trim = dff[1:length(dff$total)-1,]
  trim = group_df_by_10_minutes(remove_first_minute(group_df_by_1_minute(trim)))
  return(trim)
}

group_df_by_10_minutes = function(dff) {
  count=0
  group=0
  for(row in 1:nrow(dff)) {
    count = count + 1
    dff$By10[row] = group
    if(count == 600) {
      group = group + 1 
      count = 0
    }
  }
  return(dff)
}

group_df_by_1_minute = function(dff) {
  count=0
  group=0
  for(row in 1:length(dff$total)) {
    count = count + 1
    dff$By1[row] = group
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
  
analysis = function(df_ack, df_event, num_messages, dff) {
  data_event = ddply(df_event, .(By10), summarize, Event_Mean=mean(total), Event_SD=sd(total), Event_Min=CI(total)[3],
                     Event_Max=CI(total)[1])
  data_ack = ddply(df_ack, .(By10), summarize, Ack_Mean=mean(total), Ack_SD=sd(total), Ack_Min=CI(total)[3],
                   Ack_Max=CI(total)[1])
  
  data_event$MessagesPerSecond = num_messages
  data_ack$MessagesPerSecond = num_messages
  
  new_df = merge(data_ack, data_event, by = c("By10","MessagesPerSecond"))
  dff <- rbind(dff, new_df)
  return(dff)
}

create_frame = function(list_messages) {
  analysis_final = data.frame(MessagesPerSecond=numeric())
  for (messages in list_messages) {
    dados = metrics(paste(root_path,messages,sep="/"), ";")
    dados_event = trim_df(get_event_df(dados))
    dados_ack = trim_df(get_ack_df(dados))
    analysis_final = analysis(dados_ack, dados_event, messages, analysis_final)
  }
  return(analysis_final)
}

root_path = "/local/storm/experimentos/experimento1/"
list_messages = c(420, 840, 1260, 2100, 4200, 8400, 16800, 33600, 67200)
analysis_table = create_frame(list_messages)

data_0 = subset(analysis_table, By10 == 0)
data_1 = subset(analysis_table, By10 == 1)
data_2 = subset(analysis_table, By10 == 2)
data_3 = subset(analysis_table, By10 == 3)

ggplot(data_0, aes(x=seq_along(Ack_Mean), y=Ack_Mean)) + geom_line() +
  geom_errorbar(aes(ymin=Ack_Mean-Ack_Min, ymax=Ack_Mean+Ack_Max), width=.2) +
  geom_point()
ggplot(data_1, aes(x=seq_along(Ack_Mean), y=Ack_Mean)) + geom_line() +
  geom_errorbar(aes(ymin=Ack_Mean-Ack_Min, ymax=Ack_Mean+Ack_Max), width=.2) +
  geom_point()
ggplot(data_2, aes(x=seq_along(Ack_Mean), y=Ack_Mean)) + geom_line() +
  geom_errorbar(aes(ymin=Ack_Mean-Ack_Min, ymax=Ack_Mean+Ack_Max), width=.2) +
  geom_point()
ggplot(data_3, aes(x=seq_along(Ack_Mean), y=Ack_Mean)) + geom_line() +
  geom_errorbar(aes(ymin=Ack_Mean-Ack_Min, ymax=Ack_Mean+Ack_Max), width=.2) +
  geom_point()

# ggplot(data_0, aes(x=MessagesPerSecond, y=Ack_Mean, colour="red")) + 
#   geom_errorbar(aes(ymin=Ack_Mean-(Ack_SD*1.96), ymax=Ack_Mean+(Ack_SD*1.96), width=1000) +
#   geom_point()

  
  
  