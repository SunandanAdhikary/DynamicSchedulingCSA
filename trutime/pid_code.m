function [exectime, data] = pid_code(seg, data)

switch seg
 case 1
  r = ttAnalogIn(data.rChan); % Read reference
  y = ttAnalogIn(data.yChan); % Read process output
  data = pidcalc(data, r, y); % Calculate PID action
  exectime = 0.002;
  wcet = ttGetWCET()
  ttCurrentTask()
%   time = ttCurrentTime()
 case 2
  ttAnalogOut(data.uChan, data.u); % Output control signal
  exectime = -1;
end
