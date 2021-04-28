%% DESCRIPTION OF THE CODE
% Title：Matlab Visualization
% Author:北冥渔夫
% Data:2021.02.08
% Email:1248110286@qq.com

%% 目的
% 已知数据集合（x,y）
% 计算晶粒尺寸分布曲线
% 需要简化，使用for语言

close all

figure(1)
hold on
box on

maker_idx = 1:3:100;
% plot(a(2:33,1)-a(1,1),a(2:33,2)-a(1,2),...
%     'color','r',...
%     'Marker','o',...
%     'MarkerIndices',maker_idx,...
%     'MarkerFaceColor','r',...
%     'MarkerSize',5,...
%     'LineWidth',1,...
%     'DisplayName','(a) ');

% num_x = [19 19 20 28 37]; % for 0~40°
num_x = [22 21 23 20 19 19]; % for 50~90°
% data_DisplayName = [' 0°';'10°';'20°';'30°';'40°'];
data_DisplayName = ['1';'2';'3';'4';'5'];
num_MarkerSize = 5;
num_LineWidth = 1;

% 1
num_rate_biGG = zeros(5,1);
num = 1
num_data = 1;
plot(a(2:num_x(1),num_data)-a(1,num_data),a(2:num_x(1),num_data+1)-a(1,num_data+1),...
    'color','r',...
    'Marker','o',...
    'MarkerFaceColor','r',...
    'MarkerSize',num_MarkerSize,...
    'LineWidth',num_LineWidth,...
    'DisplayName',data_DisplayName(1,:));   

for i = 2:num_x(num)
    num_rate_biGG(num,1) = num_rate_biGG(num,1) + ((a(i,num_data+1)/3.14)^0.5-(a(1,num_data+1)/3.14)^0.5)/(a(i,num_data)-a(1,num_data));
end
num_rate_biGG(num,1) = num_rate_biGG(num,1)/(num_x(num)-1)


% 2
num = 2
num_data = 4;
plot(a(2:num_x(2),num_data)-a(1,num_data),a(2:num_x(2),num_data+1)-a(1,num_data+1),...
    'color','g',...
    'Marker','^',...
    'MarkerFaceColor','g',...
    'MarkerSize',num_MarkerSize,...
    'LineWidth',num_LineWidth,...
    'DisplayName',data_DisplayName(2,:));

for i = 2:num_x(num)
    num_rate_biGG(num,1) = num_rate_biGG(num,1) + ((a(i,num_data+1)/3.14)^0.5-(a(1,num_data+1)/3.14)^0.5)/(a(i,num_data)-a(1,num_data));
end
num_rate_biGG(num,1) = num_rate_biGG(num,1)/(num_x(num)-1)

% 3
num = 3
num_data = 7;
plot(a(2:num_x(3),num_data)-a(1,num_data),a(2:num_x(3),num_data+1)-a(1,num_data+1),...
    'color','b',...
    'Marker','s',...
    'MarkerFaceColor','b',...
    'MarkerSize',num_MarkerSize,...
    'LineWidth',num_LineWidth,...
    'DisplayName',data_DisplayName(3,:));
    
for i = 2:num_x(num)
    num_rate_biGG(num,1) = num_rate_biGG(num,1) + ((a(i,num_data+1)/3.14)^0.5-(a(1,num_data+1)/3.14)^0.5)/(a(i,num_data)-a(1,num_data));
end
num_rate_biGG(num,1) = num_rate_biGG(num,1)/(num_x(num)-1)

% % 4
% num = 4
% num_data = 10;
% plot(a(2:num_x(4),num_data)-a(1,num_data),a(2:num_x(4),num_data+1)-a(1,num_data+1),...
%     'color','c',...
%     'Marker','p',...
%     'MarkerFaceColor','c',...
%     'MarkerSize',num_MarkerSize,...
%     'LineWidth',num_LineWidth,...
%     'DisplayName',data_DisplayName(4,:));
    
% for i = 2:num_x(num)
%     num_rate_biGG(num,1) = num_rate_biGG(num,1) + ((a(i,num_data+1)/3.14)^0.5-(a(1,num_data+1)/3.14)^0.5)/(a(i,num_data)-a(1,num_data));
% end
% num_rate_biGG(num,1) = num_rate_biGG(num,1)/(num_x(num)-1)

% % 5
% num = 5
% num_data = 13;
% plot(a(2:num_x(5),num_data)-a(1,num_data),a(2:num_x(5),num_data+1)-a(1,num_data+1),...
%     'color','m',...
%     'Marker','d',...
%     'MarkerFaceColor','m',...
%     'MarkerSize',num_MarkerSize,...
%     'LineWidth',num_LineWidth,...
%     'DisplayName',data_DisplayName(5,:));
    
% for i = 2:num_x(num)
%     num_rate_biGG(num,1) = num_rate_biGG(num,1) + ((a(i,num_data+1)/3.14)^0.5-(a(1,num_data+1)/3.14)^0.5)/(a(i,num_data)-a(1,num_data));
% end
% num_rate_biGG(num,1) = num_rate_biGG(num,1)/(num_x(num)-1)

num_FontSize_label = 8
num_FontSize_legend = 10

xlabel('R/<R>',...
  'FontSize',num_FontSize_label,...
  'FontWeight','bold',...
  'Color','k')
ylabel('Related Frequency',...
      'FontSize',num_FontSize_label,...
      'FontWeight','bold',...
      'Color','k')
set(gca,'FontSize',num_FontSize_legend,'Fontwei','Bold','Linewidth',1)

% lgd = legend({'(a) 100.0ns','(b) 1000ns','(c) 3000ns','(d) 5000ns'},...
%             'FontSize',num_FontSize_legend,'TextColor','black','Location','northeast');

lgd = legend('FontSize',num_FontSize_legend,'TextColor','black','Location','northeast');


ylim([0 1.4])
xlim([0,2.5])

hfig = figure(1);
figWidth = 10;
figHight = 6.5;
% 7.3,7 for fcc_word

set(hfig,'PaperUnits','centimeters');
set(hfig,'PaperPosition',[0 0 figWidth figHight])
fileout = [mat2str(12)];
print(hfig,[fileout,'bi_0_9'],'-r300','-dpng')
