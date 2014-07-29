require(plyr)
require(ggplot2)
require(Rmisc)
require(nortest)
metrics1_7 = function(directory, separator) {
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
  
  dados_trimmed_0.1 = ddply(dados_0.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.2 = ddply(dados_0.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.3 = ddply(dados_0.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.4 = ddply(dados_0.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.5 = ddply(dados_0.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.6 = ddply(dados_0.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.7 = ddply(dados_0.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_1.1 = ddply(dados_1.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.2 = ddply(dados_1.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.3 = ddply(dados_1.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.4 = ddply(dados_1.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.5 = ddply(dados_1.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.6 = ddply(dados_1.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.7 = ddply(dados_1.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_2.1 = ddply(dados_2.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.2 = ddply(dados_2.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.3 = ddply(dados_2.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.4 = ddply(dados_2.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.5 = ddply(dados_2.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.6 = ddply(dados_2.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.7 = ddply(dados_2.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_3.1 = ddply(dados_3.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.2 = ddply(dados_3.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.3 = ddply(dados_3.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.4 = ddply(dados_3.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.5 = ddply(dados_3.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.6 = ddply(dados_3.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.7 = ddply(dados_3.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_0 = rbind(dados_trimmed_0.1, dados_trimmed_0.2, dados_trimmed_0.3, dados_trimmed_0.4, dados_trimmed_0.5, dados_trimmed_0.6, dados_trimmed_0.7)
  dados_trimmed_1 = rbind(dados_trimmed_1.1, dados_trimmed_1.2, dados_trimmed_1.3, dados_trimmed_1.4, dados_trimmed_1.5, dados_trimmed_1.6, dados_trimmed_1.7)
  dados_trimmed_2 = rbind(dados_trimmed_2.1, dados_trimmed_2.2, dados_trimmed_2.3, dados_trimmed_2.4, dados_trimmed_2.5, dados_trimmed_2.6, dados_trimmed_2.7)
  dados_trimmed_3 = rbind(dados_trimmed_3.1, dados_trimmed_3.2, dados_trimmed_3.3, dados_trimmed_3.4, dados_trimmed_3.5, dados_trimmed_3.6, dados_trimmed_3.7)
  
  dados = rbind(dados_trimmed_0, dados_trimmed_1, dados_trimmed_2, dados_trimmed_3)
  
  grouped = ddply(dados, .(hour,minute,second), summarize,latency = mean(latency))
  
  return(grouped)
  
}

metrics8_14 = function(directory, separator) {
  dados_0.1 = read.csv(paste(directory,"worker-trimmed-0-8.log", sep="/"), sep=separator, header = TRUE)
  dados_0.2 = read.csv(paste(directory,"worker-trimmed-0-9.log", sep="/"), sep=separator, header = TRUE)
  dados_0.3 = read.csv(paste(directory,"worker-trimmed-0-10.log", sep="/"), sep=separator, header = TRUE)
  dados_0.4 = read.csv(paste(directory,"worker-trimmed-0-11.log", sep="/"), sep=separator, header = TRUE)
  dados_0.5 = read.csv(paste(directory,"worker-trimmed-0-12.log", sep="/"), sep=separator, header = TRUE)
  dados_0.6 = read.csv(paste(directory,"worker-trimmed-0-13.log", sep="/"), sep=separator, header = TRUE)
  dados_0.7 = read.csv(paste(directory,"worker-trimmed-0-14.log", sep="/"), sep=separator, header = TRUE)
  
  dados_1.1 = read.csv(paste(directory,"worker-trimmed-1-8.log", sep="/"), sep=separator, header = TRUE)
  dados_1.2 = read.csv(paste(directory,"worker-trimmed-1-9.log", sep="/"), sep=separator, header = TRUE)
  dados_1.3 = read.csv(paste(directory,"worker-trimmed-1-10.log", sep="/"), sep=separator, header = TRUE)
  dados_1.4 = read.csv(paste(directory,"worker-trimmed-1-11.log", sep="/"), sep=separator, header = TRUE)
  dados_1.5 = read.csv(paste(directory,"worker-trimmed-1-12.log", sep="/"), sep=separator, header = TRUE)
  dados_1.6 = read.csv(paste(directory,"worker-trimmed-1-13.log", sep="/"), sep=separator, header = TRUE)
  dados_1.7 = read.csv(paste(directory,"worker-trimmed-1-14.log", sep="/"), sep=separator, header = TRUE)
  
  dados_2.1 = read.csv(paste(directory,"worker-trimmed-2-8.log", sep="/"), sep=separator, header = TRUE)
  dados_2.2 = read.csv(paste(directory,"worker-trimmed-2-9.log", sep="/"), sep=separator, header = TRUE)
  dados_2.3 = read.csv(paste(directory,"worker-trimmed-2-10.log", sep="/"), sep=separator, header = TRUE)
  dados_2.4 = read.csv(paste(directory,"worker-trimmed-2-11.log", sep="/"), sep=separator, header = TRUE)
  dados_2.5 = read.csv(paste(directory,"worker-trimmed-2-12.log", sep="/"), sep=separator, header = TRUE)
  dados_2.6 = read.csv(paste(directory,"worker-trimmed-2-13.log", sep="/"), sep=separator, header = TRUE)
  dados_2.7 = read.csv(paste(directory,"worker-trimmed-2-14.log", sep="/"), sep=separator, header = TRUE)
  
  dados_3.1 = read.csv(paste(directory,"worker-trimmed-3-8.log", sep="/"), sep=separator, header = TRUE)
  dados_3.2 = read.csv(paste(directory,"worker-trimmed-3-9.log", sep="/"), sep=separator, header = TRUE)
  dados_3.3 = read.csv(paste(directory,"worker-trimmed-3-10.log", sep="/"), sep=separator, header = TRUE)
  dados_3.4 = read.csv(paste(directory,"worker-trimmed-3-11.log", sep="/"), sep=separator, header = TRUE)
  dados_3.5 = read.csv(paste(directory,"worker-trimmed-3-12.log", sep="/"), sep=separator, header = TRUE)
  dados_3.6 = read.csv(paste(directory,"worker-trimmed-3-13.log", sep="/"), sep=separator, header = TRUE)
  dados_3.7 = read.csv(paste(directory,"worker-trimmed-3-14.log", sep="/"), sep=separator, header = TRUE)
  
  dados_trimmed_0.1 = ddply(dados_0.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.2 = ddply(dados_0.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.3 = ddply(dados_0.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.4 = ddply(dados_0.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.5 = ddply(dados_0.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.6 = ddply(dados_0.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_0.7 = ddply(dados_0.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_1.1 = ddply(dados_1.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.2 = ddply(dados_1.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.3 = ddply(dados_1.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.4 = ddply(dados_1.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.5 = ddply(dados_1.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.6 = ddply(dados_1.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_1.7 = ddply(dados_1.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_2.1 = ddply(dados_2.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.2 = ddply(dados_2.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.3 = ddply(dados_2.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.4 = ddply(dados_2.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.5 = ddply(dados_2.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.6 = ddply(dados_2.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_2.7 = ddply(dados_2.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_3.1 = ddply(dados_3.1, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.2 = ddply(dados_3.2, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.3 = ddply(dados_3.3, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.4 = ddply(dados_3.4, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.5 = ddply(dados_3.5, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.6 = ddply(dados_3.6, .(hour, minute, second), summarize, latency=mean(latency))
  dados_trimmed_3.7 = ddply(dados_3.7, .(hour, minute, second), summarize, latency=mean(latency))
  
  dados_trimmed_0 = rbind(dados_trimmed_0.1, dados_trimmed_0.2, dados_trimmed_0.3, dados_trimmed_0.4, dados_trimmed_0.5, dados_trimmed_0.6, dados_trimmed_0.7)
  dados_trimmed_1 = rbind(dados_trimmed_1.1, dados_trimmed_1.2, dados_trimmed_1.3, dados_trimmed_1.4, dados_trimmed_1.5, dados_trimmed_1.6, dados_trimmed_1.7)
  dados_trimmed_2 = rbind(dados_trimmed_2.1, dados_trimmed_2.2, dados_trimmed_2.3, dados_trimmed_2.4, dados_trimmed_2.5, dados_trimmed_2.6, dados_trimmed_2.7)
  dados_trimmed_3 = rbind(dados_trimmed_3.1, dados_trimmed_3.2, dados_trimmed_3.3, dados_trimmed_3.4, dados_trimmed_3.5, dados_trimmed_3.6, dados_trimmed_3.7)
  
  dados = rbind(dados_trimmed_0, dados_trimmed_1, dados_trimmed_2, dados_trimmed_3)
  
  grouped = ddply(dados, .(hour,minute,second), summarize,latency = mean(latency))
  
  return(grouped)
  
}

metrics_latency = function(directory, separator) {
  dados_3.1 = read.csv(paste(directory,"worker-copy-3-1.log", sep="/"), sep=separator, header = TRUE)
  dados_3.2 = read.csv(paste(directory,"worker-copy-3-2.log", sep="/"), sep=separator, header = TRUE)
  dados_3.3 = read.csv(paste(directory,"worker-copy-3-3.log", sep="/"), sep=separator, header = TRUE)
  dados_3.4 = read.csv(paste(directory,"worker-copy-3-4.log", sep="/"), sep=separator, header = TRUE)
  dados_3.5 = read.csv(paste(directory,"worker-copy-3-5.log", sep="/"), sep=separator, header = TRUE)
  dados_3.6 = read.csv(paste(directory,"worker-copy-3-6.log", sep="/"), sep=separator, header = TRUE)
  dados_3.7 = read.csv(paste(directory,"worker-copy-3-7.log", sep="/"), sep=separator, header = TRUE)
  
  dados = rbind(dados_3.1,dados_3.2,dados_3.3,dados_3.4,dados_3.5,dados_3.6,dados_3.7)
  
  grouped = ddply(dados, .(hour,minute,second), summarize,latency = mean(latency))
  
  return(grouped)
  
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

create_frame = function(list_messages, type, group) {
  analysis_final = data.frame(MessagesPerSecond=numeric())
  for (messages in list_messages) {
    if(type == 1) {
      dados = metrics1_7(paste(root_path,messages,sep="/"), ";")  
    }else{
      dados = metrics8_14(paste(root_path,messages,sep="/"), ";")
    }
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
analysis_table = create_frame(list_messages, 1, "ind")



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

