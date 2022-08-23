time1 = [];

merx = [];
mery = [];
merp = [];
mera = [];

venx = [];
veny = [];
venp = [];
vena = [];

earx = [];
eary = [];
earp = [];
eara = [];

moox = [];
mooy = [];
moop = [];
mooa = [];

marx = [];
mary = [];
marp = [];
mara = [];

jupx1 = [];
jupy1 = [];
jupp1 = [];
jupa1 = [];

time2 = [];

jupx2 = [];
jupy2 = [];
jupp2 = [];
jupa2 = [];

satx = [];
saty = [];
satp = [];
sata = [];

urax = [];
uray = [];
urap = [];
uraa = [];

nepx = [];
nepy = [];
nepp = [];
nepa = [];





figure('Name','Mercury');
subplot(2,3,[1,2,4,5]);
plot(merx,mery)
title('Subplot 1 : Mercury Orbit Overview')
hold on
p1 = plot(merx(1),mery(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time1, merp)
title('Subplot 2 : Energy')
hold on
p2 = plot(time1(1),merp(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time1, mera)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time1(1),mera(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Mercury2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = merx(k);
    p1.YData = mery(k);
    p2.XData = time1(k);
    p2.YData = merp(k);
    p3.XData = time1(k);
    p3.YData = mera(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end
close(v);

figure('Name','Venus');
subplot(2,3,[1,2,4,5]);
plot(venx,veny)
title('Subplot 1 : Venus Orbit Overview')
hold on
p1 = plot(venx(1),veny(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time1, venp)
title('Subplot 2 : Energy')
hold on
p2 = plot(time1(1),venp(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time1, vena)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time1(1),vena(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Venus2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = venx(k);
    p1.YData = veny(k);
    p2.XData = time1(k);
    p2.YData = venp(k);
    p3.XData = time1(k);
    p3.YData = vena(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','Earth');
subplot(2,3,[1,2,4,5]);
plot(earx,eary)
title('Subplot 1 : Earth Orbit Overview')
hold on
p1 = plot(earx(1),eary(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time1, earp)
title('Subplot 2 : Energy')
hold on
p2 = plot(time1(1),earp(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time1, eara)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time1(1),eara(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Earth2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = earx(k);
    p1.YData = eary(k);
    p2.XData = time1(k);
    p2.YData = earp(k);
    p3.XData = time1(k);
    p3.YData = eara(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

figure('Name','Moon - Sun');
subplot(2,3,[1,2,4,5]);
plot(moox,mooy,earx,eary)
title('Subplot 1 : Moon - Sun Orbit Overview')
hold on
p1 = plot(moox(1),mooy(1),'*','MarkerFaceColor','blue');
p4 = plot(earx(1),eary(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time1, moop)
title('Subplot 2 : Energy')
hold on
p2 = plot(time1(1),moop(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time1, mooa)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time1(1),mooa(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Moon-Sun2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = moox(k);
    p1.YData = mooy(k);
    p2.XData = time1(k);
    p2.YData = moop(k);
    p3.XData = time1(k);
    p3.YData = mooa(k);
    p4.XData = earx(k);
    p4.YData = eary(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','Moon - Earth');
subplot(2,3,[1,2,4,5]);
plot(moox-earx,mooy-eary)
title('Subplot 1 : Moon - Earth Orbit Overview')
hold on
p1 = plot(moox(1)-earx(1),mooy(1)-eary(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time1,moop)
title('Subplot 2 : Energy')
hold on
p2 = plot(time1(1),moop(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time1,mooa,time1,eara)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time1(1),mooa(1),'o','MarkerFaceColor','red');
p4 = plot(time1(1),eara(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Moon-Earth2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = moox(k)-earx(k);
    p1.YData = mooy(k)-eary(k);
    p2.XData = time(k);
    p2.YData = moop(k);
    p3.XData = time(k);
    p3.YData = mooa(k);
    p4.XData = time(k);
    p4.YData = eara(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','Mars');
subplot(2,3,[1,2,4,5]);
plot(marx,mary)
title('Subplot 1 : Mars Orbit Overview')
hold on
p1 = plot(marx(1),mary(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time1, marp)
title('Subplot 2 : Energy')
hold on
p2 = plot(time1(1),marp(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time1, mara)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time1(1),mara(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Mars2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = marx(k);
    p1.YData = mary(k);
    p2.XData = time(k);
    p2.YData = marp(k);
    p3.XData = time(k);
    p3.YData = mara(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','MVEMM');
subplot(2,3,[1,2,4,5]);
plot(marx,mary,earx,eary,venx,veny,merx,mery,moox,mooy)
title('Subplot 1 : Orbit Overview')
hold on
p1 = plot(marx(1),mary(1),'o','MarkerFaceColor','blue');
p2 = plot(earx(1),eary(1),'o','MarkerFaceColor','red');
p3 = plot(venx(1),veny(1),'o','MarkerFaceColor','yellow');
p4 = plot(merx(1),mery(1),'o','MarkerFaceColor','black');
p13 = plot(moox(1),mooy(1),'x','MarkerFaceColor','green');
hold off

subplot(2,3,3);
plot(time1,marp,time1,earp,time1,venp,time1,merp,time1,moop)
title('Subplot 2 : Energy')
hold on
p5 = plot(time1(1),marp(1),'o','MarkerFaceColor','blue');
p6 = plot(time1(1),earp(1),'o','MarkerFaceColor','red');
p7 = plot(time1(1),venp(1),'o','MarkerFaceColor','yellow');
p8 = plot(time1(1),merp(1),'o','MarkerFaceColor','black');
p14 = plot(time1(1),moop(1),'o','MarkerFaceColor','green');
hold off

subplot(2,3,6);
plot(time1,mara,time1,eara,time1,vena,time1,mera,time1,mooa)
title('Subplot 3 : Area Speed')
hold on
p9 = plot(time1(1),mara(1),'o','MarkerFaceColor','blue');
p10 = plot(time1(1),eara(1),'o','MarkerFaceColor','red');
p11 = plot(time1(1),vena(1),'o','MarkerFaceColor','yellow');
p12 = plot(time1(1),mera(1),'o','MarkerFaceColor','black');
p15 = plot(time1(1),mooa(1),'o','MarkerFaceColor','green');
hold off

v = VideoWriter('MVEMM2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = marx(k);
    p1.YData = mary(k);
    p2.XData = earx(k);
    p2.YData = eary(k);
    p3.XData = venx(k);
    p3.YData = veny(k);
    p4.XData = merx(k);
    p4.YData = mery(k);
    p5.XData = time1(k);
    p5.YData = marp(k);
    p6.XData = time1(k);
    p6.YData = earp(k);
    p7.XData = time1(k);
    p7.YData = venp(k);
    p8.XData = time1(k);
    p8.YData = merp(k);
    p9.XData = time1(k);
    p9.YData = mara(k);
    p10.XData = time1(k);
    p10.YData = eara(k);
    p11.XData = time1(k);
    p11.YData = vena(k);
    p12.XData = time1(k);
    p12.YData = mera(k);
    p13.XData = moox(k);
    p13.YData = mooy(k);
    p14.XData = time1(k);
    p14.YData = moop(k);
    p15.XData = time1(k);
    p15.YData = mooa(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','MVEMJ');
subplot(2,3,[1,2,4,5]);
plot(marx,mary,earx,eary,venx,veny,merx,mery,jupx1,jupy1)
title('Subplot 1 : Orbit Overview')
hold on
p1 = plot(marx(1),mary(1),'o','MarkerFaceColor','blue');
p2 = plot(earx(1),eary(1),'o','MarkerFaceColor','red');
p3 = plot(venx(1),veny(1),'o','MarkerFaceColor','yellow');
p4 = plot(merx(1),mery(1),'o','MarkerFaceColor','black');
p16 = plot(jupx1(1),jupy1(1),'o','MarkerFaceColor','green');
hold off

subplot(2,3,3);
plot(time1,marp,time1,earp,time1,venp,time1,merp,time1,moop)
title('Subplot 2 : Energy')
hold on
p5 = plot(time1(1),marp(1),'o','MarkerFaceColor','blue');
p6 = plot(time1(1),earp(1),'o','MarkerFaceColor','red');
p7 = plot(time1(1),venp(1),'o','MarkerFaceColor','yellow');
p8 = plot(time1(1),merp(1),'o','MarkerFaceColor','black');
p17 = plot(time1(1),jupp1(1),'o','MarkerFaceColor','green');
hold off

subplot(2,3,6);
plot(time1,mara,time1,eara,time1,vena,time1,mera,time1,mooa)
title('Subplot 3 : Area Speed')
hold on
p9 = plot(time1(1),mara(1),'o','MarkerFaceColor','blue');
p10 = plot(time1(1),eara(1),'o','MarkerFaceColor','red');
p11 = plot(time1(1),vena(1),'o','MarkerFaceColor','yellow');
p12 = plot(time1(1),mera(1),'o','MarkerFaceColor','black');
p18 = plot(time1(1),jupa1(1),'o','MarkerFaceColor','green');
hold off

v = VideoWriter('MVEMJ2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time1)
    p1.XData = marx(k);
    p1.YData = mary(k);
    p2.XData = earx(k);
    p2.YData = eary(k);
    p3.XData = venx(k);
    p3.YData = veny(k);
    p4.XData = merx(k);
    p4.YData = mery(k);
    p5.XData = time1(k);
    p5.YData = marp(k);
    p6.XData = time1(k);
    p6.YData = earp(k);
    p7.XData = time1(k);
    p7.YData = venp(k);
    p8.XData = time1(k);
    p8.YData = merp(k);
    p9.XData = time1(k);
    p9.YData = mara(k);
    p10.XData = time1(k);
    p10.YData = eara(k);
    p11.XData = time1(k);
    p11.YData = vena(k);
    p12.XData = time1(k);
    p12.YData = mera(k);
    p16.XData = jupx1(k);
    p16.YData = jupy1(k);
    p17.XData = time1(k);
    p17.YData = jupp1(k);
    p18.XData = time1(k);
    p18.YData = jupa1(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','Jupitar');
subplot(2,3,[1,2,4,5]);
plot(jupx2,jupy2)
title('Subplot 1 : Jupitar Orbit Overview')
hold on
p1 = plot(jupx2(1),jupy2(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time2, jupp2)
title('Subplot 2 : Energy')
hold on
p2 = plot(time2(1),jupp2(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time2, jupa2)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time2(1),jupa2(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Jupitar2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time2)
    p1.XData = jupx2(k);
    p1.YData = jupy2(k);
    p2.XData = time2(k);
    p2.YData = jupp2(k);
    p3.XData = time2(k);
    p3.YData = jupa2(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','Saturn');
subplot(2,3,[1,2,4,5]);
plot(satx,saty)
title('Subplot 1 : Saturn Orbit Overview')
hold on
p1 = plot(satx(1),saty(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time2, satp)
title('Subplot 2 : Energy')
hold on
p2 = plot(time2(1),satp(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time2, sata)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time2(1),sata(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Saturn2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time2)
    p1.XData = satx(k);
    p1.YData = saty(k);
    p2.XData = time2(k);
    p2.YData = satp(k);
    p3.XData = time2(k);
    p3.YData = sata(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','Uranus');
subplot(2,3,[1,2,4,5]);
plot(urax,uray)
title('Subplot 1 : Uranus Orbit Overview')
hold on
p1 = plot(urax(1),uray(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time2, urap)
title('Subplot 2 : Energy')
hold on
p2 = plot(time2(1),urap(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time2, uraa)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time2(1),uraa(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Uranus2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time2)
    p1.XData = urax(k);
    p1.YData = uray(k);
    p2.XData = time2(k);
    p2.YData = urap(k);
    p3.XData = time2(k);
    p3.YData = uraa(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','Neptune');
subplot(2,3,[1,2,4,5]);
plot(nepx,nepy)
title('Subplot 1 : Neptune Orbit Overview')
hold on
p1 = plot(nepx(1),nepy(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,3);
plot(time2, nepp)
title('Subplot 2 : Energy')
hold on
p2 = plot(time2(1),nepp(1),'o','MarkerFaceColor','red');
hold off

subplot(2,3,6);
plot(time2, nepa)
title('Subplot 3 : Area Speed')
hold on
p3 = plot(time2(1),nepa(1),'o','MarkerFaceColor','red');
hold off

v = VideoWriter('Neptune2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time2)
    p1.XData = nepx(k);
    p1.YData = nepy(k);
    p2.XData = time2(k);
    p2.YData = nepp(k);
    p3.XData = time2(k);
    p3.YData = nepa(k);
    drawnow
    frame = getframe(gcf);
    writeVideo(v,frame);
end

close(v);

figure('Name','JSUN');
subplot(2,3,[1,2,4,5]);
plot(merx,mery,'-','black');
plot(venx,veny,'-','yellow');
plot(earx,eary,'-','red');
plot(marx,mary,'-','blue');
plot(jupx2,jupy2,'-','red');
plot(satx,saty,'-','yellow');
plot(urax,uray,'-','black');
plot(nepx,nepy,'-','blue');
title('Subplot 1 : Orbit Overview')
hold on
p1 = plot(jupx2(1),jupy2(1),'o','MarkerFaceColor','red');
p2 = plot(satx(1),saty(1),'o','MarkerFaceColor','yellow');
p3 = plot(urax(1),uray(1),'o','MarkerFaceColor','black');
p4 = plot(nepx(1),nepy(1),'o','MarkerFaceColor','blue');
hold off

subplot(2,3,3);
plot(time1,merp,'-','black');
plot(time1,venp,'-','yellow');
plot(time1,earp,'-','red');
plot(time1,marp,'-','blue');
plot(time2,jupp2,'-','red');
plot(time2,satp,'-','yellow');
plot(time2,urap,'-','black');
plot(time2,nepp,'-','blue');
title('Subplot 2 : Energy')
hold on
p5 = plot(time2(1),jupp2(1),'o','MarkerFaceColor','red');
p6 = plot(time2(1),satp(1),'o','MarkerFaceColor','yellow');
p7 = plot(time2(1),urap(1),'o','MarkerFaceColor','black');
p8 = plot(time2(1),nepp(1),'o','MarkerFaceColor','blue');
hold off

subplot(2,3,6);
plot(time1,mera,'-','black');
plot(time1,vena,'-','yellow');
plot(time1,eara,'-','red');
plot(time1,mara,'-','blue');
plot(time2,jupa2,'-','red');
plot(time2,sata,'-','yellow');
plot(time2,uraa,'-','black');
plot(time2,nepa,'-','blue');
title('Subplot 3 : Area Speed')
hold on
p9 = plot(time2(1),jupa2(1),'o','MarkerFaceColor','blue');
p10 = plot(time2(1),sata(1),'o','MarkerFaceColor','red');
p11 = plot(time2(1),uraa(1),'o','MarkerFaceColor','yellow');
p12 = plot(time2(1),nepa(1),'o','MarkerFaceColor','black');
hold off

v = VideoWriter('JSUN2020-1-14.mp4', 'MPEG-4');
v.Quality = 95;
v.FrameRate = 240;
open(v);

for k = 2:length(time2)
    p1.XData = jupx2(k);
    p1.YData = jupy2(k);
    p2.XData = satx(k);
    p2.YData = saty(k);
    p3.XData = urax(k);
    p3.YData = uray(k);
    p4.XData = nepx(k);
    p4.YData = nepy(k);
    p5.XData = time2(k);
    p5.YData = jupp2(k);
    p6.XData = time2(k);
    p6.YData = satp(k);
    p7.XData = time2(k);
    p7.YData = urap(k);
    p8.XData = time2(k);
    p8.YData = nepp(k);
    p9.XData = time2(k);
    p9.YData = jupa2(k);
    p10.XData = time2(k);
    p10.YData = sata(k);
    p11.XData = time2(k);
    p11.YData = uraa(k);
    p12.XData = time2(k);
    p12.YData = nepa(k);
    drawnow
    frame = getframe(