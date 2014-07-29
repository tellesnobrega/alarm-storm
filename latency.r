require(plyr)
require(ggplot2)
require(Rmisc)
require(nortest)
metrics = function(directory, separator) {
  
  dados_0 = read_data(directory, 0, separator)
  dados_1 = read_data(directory, 1, separator)
  dados_2 = read_data(directory, 2, separator)
  dados_3 = read_data(directory, 3, separator)
  
  dados = rbind(dados_0, dados_1, dados_2, dados_3)
  
  grouped = ddply(dados, .(hour,minute,second), summarize,latency = latency(latency))
  
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
  
  dados_trimmed_1 = ddply(dados_1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2 = ddply(dados_2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3 = ddply(dados_3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_4 = ddply(dados_4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_5 = ddply(dados_5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_6 = ddply(dados_6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_7 = ddply(dados_7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed = rbind(dados_trimmed_1, dados_trimmed_2, dados_trimmed_3, dados_trimmed_4, dados_trimmed_5, dados_trimmed_6, dados_trimmed_7)
  return(dados_trimmed)
}

trim_df = function(dff) {
  trim = dff[1:length(dff$latency)-1,]
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
  for(row in 1:length(dff$latency)) {
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

analysis_group = function(df_ack, num_messages, dff) {
  data_ack = ddply(df_ack, .(By10), summarize, Mean=mean(latency), SD=sd(latency), Min=CI(latency)[3],
                   Max=CI(latency)[1])
  
  data_ack$MessagesPerSecond = num_messages
  
  dff <- rbind(dff, data_ack)
  return(dff)
}

analysis_ind = function(df_ack, num_messages, dff) {
  data_ack = ddply(df_ack, .(By1), summarize, Ack_Mean=mean(latency), Ack_SD=sd(latency), Ack_Min=CI(latency)[3],
                   Ack_Max=CI(latency)[1])

  data_ack$MessagesPerSecond = num_messages
  dff <- rbind(dff, data_ack)
  return(dff)
}

create_frame = function(root_path, list_messages, type, group) {
  analysis_final = data.frame(MessagesPerSecond=numeric())
  for (messages in list_messages) {
    dados = metrics(paste(root_path,messages,sep="/"), ";")  
    dados_ack = trim_df(dados)
    if(group == "ind") {
      analysis_final = analysis_ind(dados_ack, as.numeric(messages), analysis_final)
    }else {
      analysis_final = analysis_group(dados_ack, messages, analysis_final)
    }
    
  }
  return(analysis_final)
}


create_frame_complete = function(list_messages) {
  analysis_final = data.frame(MessagesPerSecond=numeric())
  dados = data.frame(hour=numeric(),minute=numeric(), minute=numeric(),latency=numeric())
  for (messages in list_messages) {
      dados = metrics_latency(paste(root_path,messages,sep="/"), ";")  
  }
#     dados_ack = trim_df(dados)
#     analysis_final = analysis(dados_ack, messages, analysis_final)
  return(dados)
}



root_path = "/local/storm/experimentos/experimento_latency"
list_messages = c(840,8400,10000,16800)
analysis_table = create_frame(list_messages, "ind")



data_840 = subset(analysis_table, MessagesPerSecond == 840)
data_8400 = subset(analysis_table, MessagesPerSecond == 8400)
data_10000 = subset(analysis_table, MessagesPerSecond == 10000)
data_16800 = subset(analysis_table, MessagesPerSecond == 16800)


###Plot
p1 = qplot(sample = data_840$Ack_Mean,  stat = "qq") + ggtitle(expression("840 Mensagens"))
p2 = qplot(sample = data_8400$Ack_Mean,  stat = "qq") + ggtitle(expression("8400 Mensagens"))
p3 = qplot(sample = data_10000$Ack_Mean,  stat = "qq") + ggtitle(expression("10000 Mensagens"))
p4 = qplot(sample = data_16800$Ack_Mean,  stat = "qq") + ggtitle(expression("16800 Mensagens"))

multiplot(p1, p2, p3, p4, cols=2)

ad.test(data_16800$Ack_Mean)

complete = create_frame_complete(list_messages)
plot(density(complete$latency))

data_0 = subset(analysis_table, By10 == 0)
data_1 = subset(analysis_table, By10 == 1)
data_2 = subset(analysis_table, By10 == 2)
data_3 = subset(analysis_table, By10 == 3)


p1=ggplot(data_0, aes(x=seq_along(Mean), y=Mean)) + 
  geom_errorbar(aes(ymin=Min, ymax=Max), width=.2) + geom_bar(stat = "identity") +
  scale_x_discrete(breaks=seq_along(data_0$Mean), labels=list_messages) +
  xlab("Messages/s") +
  ylab("Lantecy") + theme(legend.position="none") 

p2=ggplot(data_1, aes(x=seq_along(Mean), y=Mean)) + 
  geom_errorbar(aes(ymin=Min, ymax=Max), width=.2) + geom_bar(stat = "identity") +
  scale_x_discrete(breaks=seq_along(data_1$Mean), labels=list_messages) +
  xlab("Messages/s") +
  ylab("Lantecy") + theme(legend.position="none")

p3=ggplot(data_2, aes(x=seq_along(Mean), y=Mean)) + 
  geom_errorbar(aes(ymin=Min, ymax=Max), width=.2) + geom_bar(stat = "identity") +
  scale_x_discrete(breaks=seq_along(data_2$Mean), labels=list_messages) +
  xlab("Messages/s") +
  ylab("Lantecy") + theme(legend.position="none")


p4=ggplot(data_3, aes(x=seq_along(Mean), y=Mean)) + 
  geom_errorbar(aes(ymin=Min, ymax=Max), width=.2) + geom_bar(stat = "identity") +
  scale_x_discrete(breaks=seq_along(data_3$Mean), labels=list_messages) +
  xlab("Messages/s") +
  ylab("Lantecy") + theme(legend.position="none")

multiplot(p1,p2,p3,p4,cols=2)

