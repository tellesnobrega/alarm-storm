import sys

def parse_line(base_time, second_total, message):
    line = base_time +";"+ message + ";" +  str(second_total)
    return line

def _add(second_total):
    second_total += 1
    return second_total

def _write(f, line):
    f.write(line+"\n")

def main(args):
  second_total_ack = 0
  second_total_event = 0
  file_name = str(args[0])
  out_file = str(args[1])
  f = open(file_name, 'r')
  out = open(out_file, 'w')
  _write(out, "time;event")
  base_time=-1
  for line in f:
      if 'ACK' or 'Event' in line:
          line_split = line.strip().split(";")
          if(base_time == -1):
             base_time = line_split[0].split(",")[0]
          if not (line_split[0].split(",")[0] == base_time):
              to_write = parse_line(base_time,second_total_ack, "Ack")
              second_total_ack = 0
              _write(out, to_write)
              to_write = parse_line(base_time,second_total_event, "Event")
              second_total_event = 0
              _write(out, to_write)
              if("ACK" in line):
                  second_total_ack = _add(second_total_ack)
              else:
                   second_total_event = _add(second_total_event)
              base_time = line_split[0].split(",")[0]
          else:
              if("ACK" in line):
                  second_total_ack = _add(second_total_ack)
              else:
                  second_total_event = _add(second_total_event)
 
  to_write = parse_line(base_time, second_total_ack, "Ack")
  _write(out, to_write)
  to_write = parse_line(base_time, second_total_event, "Event")
  _write(out, to_write)

if __name__ == "__main__":
  main(sys.argv[1:])
