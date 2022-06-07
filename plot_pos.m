%% input
config = importdata("config.txt");
TIME_SLOT     = config(3);
TIME_MINISLOT = config(4);
%% plot
embb = importdata("./data/embb.txt");
for time_slot = 0 : TIME_SLOT - 1
  for time_minislot = 0 : TIME_MINISLOT - 1
    urllc = importdata(get_urllc_filename(time_slot, time_minislot));
    hold off; % new plot
    plot(embb(:, 1), embb(:, 2),...
         "ob",...
         "LineWidth", 3,...
         "MarkerSize", 10);
    hold on;
    plot(urllc(:, 1), urllc(:, 2),...
         "+r",...
         "LineWidth", 3,...
         "MarkerSize", 10);
    grid on;
    exportgraphics(gcf, "./data/urllc-" + time_slot + "-" + time_minislot + ".png");
  end
end
