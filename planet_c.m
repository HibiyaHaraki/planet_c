clear all; close all; clc;
%% Reasing txt file
num = 5; % Number of Planets
dim = 3; % Dimension
G = 6.67430*10^(-20); %Newtonian constant of gravitation

TXT = readtable('planet_result.txt');
txt = table2array(TXT);

%% Sort Data
t = txt(:,1);
m = zeros(num-1);

m(1) = 3.301*10^23;
m(2) = 4.869*10^24;
m(3) = 5.972*10^24;
m(4) = 6.4171*10^23;

r = zeros(num,length(txt),dim);
v = zeros(num,length(txt),dim);

for i=1:num
    r(i,:,:) = txt(:,6*(i-1)+2:6*(i-1)+4);
    v(i,:,:) = txt(:,6*(i-1)+5:6*(i-1)+7);
end

%% Calculate Energy
kin_ener = zeros(num-1,length(txt));
ptn_ener = zeros(num-1,length(txt));

for i=1:num-1
    for j=1:length(txt)
        kin_ener(i,j) = m(i)/2*(v(i+1,j,1)^2+v(i+1,j,2)^2+v(i+1,j,3)^2);
        ptn_ener(i,j) = ptn_ener(i,j) - G*m(i+1)*m(1)/sqrt((r(i+1,j,1)-r(1,j,1))^2+(r(i+1,j,2)-r(1,j,2))^2+(r(i+1,j,3)-r(1,j,3))^2);
        for k=i+2:num-1
            ptn_ener(i,j) = ptn_ener(i,j) - G*m(i+1)*m(k)/sqrt((r(i+1,j,1)-r(k,j,1))^2+(r(i+1,j,2)-r(k,j,2))^2+(r(i+1,j,3)-r(k,j,3))^2);
        end
    end
end

%% Area Speed
area_speed = zeros(num-1,length(txt));
for i=1:num-1
    for j=1:length(txt)
        tmp = cross(r(i+1,j,:)-r(1,j,:),v(i+1,j,:)-v(1,j,:));
        area_speed(i,j) = sqrt(tmp(1,1,1)^2+tmp(1,1,2)^2+tmp(1,1,3)^2);
    end
end

%% Color and Size Setting
s(1) = 80;
s(2) = 30;
s(3) = 42;
s(4) = 42;
s(5) = 30; 

c(1,:) = [1 0 0];
c(2,:) = [120/256 128/256 122/256];
c(3,:) = [175/256 176/256 54/256];
c(4,:) = [0 0 1];
c(5,:) = [176/256 123/256 54/256];
%% Draw Figure
f = figure;
f.Position = [0 0 1920 1080];
rotate3d on;

subplot(2,4,[1 2 5 6]);
view(3);
hold on
for j=1:num
    p(j) = plot3(r(j,1,1),r(j,1,2),r(j,1,3),'.');
end
hold off
axis equal
ax = gca;
ax.XAxisLocation = 'origin';
ax.YAxisLocation = 'origin';
for j=1:num
    p(j).MarkerSize = s(j);
    p(j).MarkerFaceColor = c(j,:);
    p(j).MarkerEdgeColor = c(j,:);
end
grid on
legend('Sun','Mercury','Venus','Earth','Mars');
title('Orbit Calculation Result');
xlabel('x [km]');
ylabel('y [km]');
zlabel('z [km]');
xlim([min(min(txt)) max(max(txt))]);
ylim([min(min(txt)) max(max(txt))]);
zlim([min(min(txt)) max(max(txt))]);

subplot(2,4,[3 7]);
hold on
xline(1,'k-');
xline(2,'k-');
xline(3,'k-');
for j=1:num
    lx(j) = plot([1 2 3],[r(j,1,1) r(j,1,1) r(j,1,2)],'.-');
end
hold off
for j=1:num
    lx(j).LineWidth = 1.3;
    lx(j).Color = c(j,:);
    lx(j).MarkerSize = 14;
    lx(j).MarkerFaceColor = c(j,:);
    lx(j).MarkerEdgeColor = c(j,:);
end
grid on
xticks([1 2 3])
xticklabels({'x','y','z'})
title('Axis');
ylabel('Position [km]');
xlabel('Axis');
xlim([0 4]);
ylim([min(min(txt)) max(max(txt))]);

subplot(2,4,4);
hold on
for i=1:num-1
    en(i) = plot(t(:,1),kin_ener(i,:)+ptn_ener(i,:),'-');
    enp(i) = plot(t(1,1),kin_ener(i,1)+ptn_ener(i,1),'.');
    en(i).LineWidth = 1.0;
    en(i).Color = c(i+1,:);
    enp(i).MarkerSize = 15;
    enp(i).MarkerFaceColor = c(i+1,:);
    enp(i).MarkerEdgeColor = c(i+1,:);
    drawnow
end
hold off
grid on
title('Energy');
xlabel('t [s]');
ylabel('Energy [MJ]');
xlim([t(1,1) t(length(t),1)]);
ylim([min(min(kin_ener+ptn_ener)) max(max(kin_ener+ptn_ener))]);

subplot(2,4,8);
hold on
for i=1:num-1
    as(i) = plot(t(:,1),area_speed(i,:),'-');
    asp(i) = plot(t(1,1),area_speed(i,1),'.');
    as(i).LineWidth = 1.0;
    as(i).Color = c(i+1,:);
    asp(i).MarkerSize = 15;
    asp(i).MarkerFaceColor = c(i+1,:);
    asp(i).MarkerEdgeColor = c(i+1,:);
    drawnow
end
hold off
grid on
title('Area Speed');
xlabel('t [s]');
ylabel('Area Speed [Mm^2/s]');
xlim([t(1,1) t(length(t),1)]);
ylim([min(min(area_speed)) max(max(area_speed))]);

v = VideoWriter('planet_result.mp4','MPEG-4');
open(v);

for i=1:length(txt)
    %camorbit(ax,1*360/length(txt),1*360/length(txt));
    for j=1:num
        p(j).XData = r(j,i,1);
        p(j).YData = r(j,i,2);
        p(j).ZData = r(j,i,3);
        lx(j).YData = [r(j,i,1) r(j,i,2) r(j,i,3)];
    end
    for j=1:num-1
        enp(j).XData = t(i,1);
        enp(j).YData = kin_ener(j,i)+ptn_ener(j,i);
        asp(j).XData = t(i,1);
        asp(j).YData = area_speed(j,i);
    end
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v);
