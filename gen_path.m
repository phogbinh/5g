%% input
config = importdata("config.txt");
URLLC         = config(2);
TIME_SLOT     = config(3);
TIME_MINISLOT = config(4);
urllc_begin = importdata(get_urllc_filename(0            , 0                ));
urllc_end   = importdata(get_urllc_filename(TIME_SLOT - 1, TIME_MINISLOT - 1));
%% generate path
paths = zeros(URLLC, TIME_SLOT, TIME_MINISLOT, 2);
for i = 1 : URLLC
  xs = linspace(urllc_begin(i, 1), urllc_end(i, 1), TIME_SLOT * TIME_MINISLOT); % integer
  ys = linspace(urllc_begin(i, 2), urllc_end(i, 2), TIME_SLOT * TIME_MINISLOT); % integer
  for n = 1 : TIME_SLOT
    for m = 1 : TIME_MINISLOT
      paths(i, n, m, 1) = floor(xs((n - 1) * TIME_MINISLOT + m));
      paths(i, n, m, 2) = floor(ys((n - 1) * TIME_MINISLOT + m));
    end
  end
end
%% output
for n = 1 : TIME_SLOT
  for m = 1 : TIME_MINISLOT
    positions = zeros(URLLC, 2);
    for i = 1 : URLLC
      positions(i, 1) = paths(i, n, m, 1);
      positions(i, 2) = paths(i, n, m, 2);
    end
    writematrix(positions, get_urllc_filename(n - 1, m - 1));
  end
end