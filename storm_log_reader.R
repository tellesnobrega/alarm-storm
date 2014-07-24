require(plyr)
require(ggplot2)
require(Rmisc)
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
  
analysis_ind = function(df_ack, df_event, num_messages, dff) {
  data_event = ddply(df_event, .(By1), summarize, Event_Mean=mean(total), Event_SD=sd(total), Event_Min=CI(total)[3],
                     Event_Max=CI(total)[1])
  data_ack = ddply(df_ack, .(By1), summarize, Ack_Mean=mean(total), Ack_SD=sd(total), Ack_Min=CI(total)[3],
                   Ack_Max=CI(total)[1])
  
  data_event$MessagesPerSecond = num_messages
  data_ack$MessagesPerSecond = num_messages
  
  new_df = merge(data_ack, data_event, by = c("By1","MessagesPerSecond"))
  dff <- rbind(dff, new_df)
  return(dff)
}

analysis_group = function(df_ack, df_event, num_messages, dff) {
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

create_frame = function(list_messages, type, group) {
  analysis_final = data.frame(MessagesPerSecond=numeric())
  for (messages in list_messages) {
    if(type == 1) {
      dados = metrics1_7(paste(root_path,messages,sep="/"), ";")  
    }else{
      dados = metrics8_14(paste(root_path,messages,sep="/"), ";")
    }
    dados_event = trim_df(get_event_df(dados))
    dados_ack = trim_df(get_ack_df(dados))
    if(group == "ind") {
      analysis_final = analysis_ind(dados_ack, dados_event, messages, analysis_final)
    }else {
      analysis_final = analysis_group(dados_ack, dados_event, messages, analysis_final)
    }
  }
  return(analysis_final)
}

root_path = "/local/storm/experimentos/experimento_scalability2"
list_messages = c(420, 840, 1260, 2100, 4200, 8400, 16800, 33600, 67200)
analysis_table = create_frame(list_messages, 2, "ind")

data_0 = subset(analysis_table, By10==0)
data_1 = subset(analysis_table, By10==1)
data_2 = subset(analysis_table, By10==2)
data_3 = subset(analysis_table, By10==3)

data_420 = subset(analysis_table, MessagesPerSecond == 420)
data_840 = subset(analysis_table, MessagesPerSecond == 840)
data_1260 = subset(analysis_table, MessagesPerSecond == 1260)
data_2100 = subset(analysis_table, MessagesPerSecond == 2100)
data_4200 = subset(analysis_table, MessagesPerSecond == 4200)
data_8400 = subset(analysis_table, MessagesPerSecond == 8400)
data_16800 = subset(analysis_table, MessagesPerSecond == 16800)
data_33600 = subset(analysis_table, MessagesPerSecond == 33600)
data_67200 = subset(analysis_table, MessagesPerSecond == 67200)


###Plot
p1 = qplot(sample = data_420$Ack_Mean,  stat = "qq") + ggtitle(expression("420 Mensagens"))
p2 = qplot(sample = data_840$Ack_Mean,  stat = "qq") + ggtitle(expression("840 Mensagens"))
p3 = qplot(sample = data_1260$Ack_Mean,  stat = "qq") + ggtitle(expression("1260 Mensagens"))
p4 = qplot(sample = data_2100$Ack_Mean,  stat = "qq") + ggtitle(expression("2100 Mensagens"))
p5 = qplot(sample = data_4200$Ack_Mean,  stat = "qq") + ggtitle(expression("4200 Mensagens"))
p6 = qplot(sample = data_8400$Ack_Mean,  stat = "qq") + ggtitle(expression("8400 Mensagens"))
p7 = qplot(sample = data_16800$Ack_Mean,  stat = "qq") + ggtitle(expression("16800 Mensagens"))
p8 = qplot(sample = data_33600$Ack_Mean,  stat = "qq") + ggtitle(expression("33600 Mensagens"))
p9 = qplot(sample = data_67200$Ack_Mean,  stat = "qq") + ggtitle(expression("67200 Mensagens"))

multiplot(p1, p2, p3, p4, p5, p6, p7, p8, p9, cols=3)

ad.test(data_420$Ack_Mean)
ad.test(data_840$Ack_Mean)
ad.test(data_1260$Ack_Mean)
ad.test(data_2100$Ack_Mean)
ad.test(data_4200$Ack_Mean)
ad.test(data_8400$Ack_Mean)
ad.test(data_16800$Ack_Mean)
ad.test(data_33600$Ack_Mean)
ad.test(data_67200$Ack_Mean)

bar0= ggplot(data_0, aes(x=as.factor(seq_along(Ack_Mean)), y=Ack_Mean,fill=as.factor(MessagesPerSecond))) + geom_bar(stat="identity") + 
  geom_errorbar(aes(ymin=Ack_Min, ymax=Ack_Max), width=.2) +
  geom_point() + scale_x_discrete(breaks=seq_along(data_0$Ack_Mean), labels=list_messages) + scale_fill_hue("MessagesPerSecond") +
  xlab("Messages/s") +
  ylab("Acks/s") + theme(legend.position="none")

bar1= ggplot(data_1, aes(x=as.factor(seq_along(Ack_Mean)), y=Ack_Mean,fill=as.factor(MessagesPerSecond))) + geom_bar(stat="identity") + 
  geom_errorbar(aes(ymin=Ack_Min, ymax=Ack_Max), width=.2) +
  geom_point() + scale_x_discrete(breaks=seq_along(data_1$Ack_Mean), labels=list_messages) + scale_fill_hue("MessagesPerSecond") +
  xlab("Messages/s") +
  ylab("Acks/s")  + theme(legend.position="none")

bar2= ggplot(data_2, aes(x=as.factor(seq_along(Ack_Mean)), y=Ack_Mean,fill=as.factor(MessagesPerSecond))) + geom_bar(stat="identity") + 
  geom_errorbar(aes(ymin=Ack_Min, ymax=Ack_Max), width=.2) +
  geom_point() + scale_x_discrete(breaks=seq_along(data_2$Ack_Mean), labels=list_messages) + scale_fill_hue("MessagesPerSecond") +
  xlab("Messages/s") +
  ylab("Acks/s") + theme(legend.position="none")

bar3= ggplot(data_3, aes(x=as.factor(seq_along(Ack_Mean)), y=Ack_Mean,fill=as.factor(MessagesPerSecond))) + geom_bar(stat="identity") + 
  geom_errorbar(aes(ymin=Ack_Min, ymax=Ack_Max), width=.2) +
  geom_point() + scale_x_discrete(breaks=seq_along(data_3$Ack_Mean), labels=list_messages) + scale_fill_hue("MessagesPerSecond") +
  xlab("Messages/s") +
  ylab("Acks/s")  + theme(legend.position="none")

multiplot(bar0,bar1,bar2,bar3, cols=2)
# ggplot(data_0, aes(x=MessagesPerSecond, y=Ack_Mean, colour="red")) + 
#   geom_errorbar(aes(ymin=Ack_Mean-(Ack_SD*1.96), ymax=Ack_Mean+(Ack_SD*1.96), width=1000) +
#   geom_point()

  
  
  