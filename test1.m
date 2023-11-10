clear
%focvの計算(SOC70%~98%)
E0 = 3.3450;
K1 = 0.0030;
K2 = 0.0070;
K3 = 0.0040;
K4 = -0.8280;
soc = linspace(60,98).*0.01;
focv = zeros(1,100);
for n = 1:100
    focv(1,n) = E0 + K1*log(soc(n)) + K2*log(1-soc(n)) - (K3/soc(n)) - K4*soc(n);
end
x = linspace(0,1);
%1次式で近似
y = zeros(1,100);
p60to98 =polyfit(soc,focv,1)
diff = zeros(1,100)
for n = 1:100
    y(1,n) = p60to98(1,1)*x(1,n)+p60to98(1,2);
    % diff(1,100) = focv(1,n)-y(1,n);%差分
end

%plotの調整と保存
fig = figure
p1 = plot(soc,focv,'LineWidth',2)
hold on
p2 = plot(x,y,'LineWidth',2)
xlim([0.6,0.98])
% ylim([-0.025,0.001])
xlabel('SOC','FontSize',16);
ylabel('difference','FontSize',16);
% legend([p1 p2],{"focv(SOC(t))","0.7823*SOC(t)+3.3639"},'Location','best','FontSize',16)
% fig2 = figure
% plot(x,diff,'LineWidth',2)
figfolder = ['focv_liner_check23.11.03'];
mkdir(figfolder)
FileName = ['focv_liner_check_23.11.03.emf'];
saveas(fig,[figfolder '\' FileName ]);