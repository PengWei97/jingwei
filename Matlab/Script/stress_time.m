%% DESCRIPTION OF THE CODE
% Title：Matlab Visualization
% Author:北冥渔夫
% Data:2021.02.08
% Email:1248110286@qq.com

%% 文章框架
% 2D，
% fcc，双晶，生长速率-欧拉角
% 0°~90°
% 赋予给b
% 用于输入fig.4-e
close all

figure(1)
hold on
box on

num_MarkerSize = 5;
num_LineWidth = 1;

% name_DisplayName = ['stress11';'stress12/MPa';'stress22/MPa';'vonmises_stress/MPa']
type_MarkerFaceColor = ['r';'g';'b';'c';'m']
type_Marker = ['o';'^';'s';'p';'d']

xx = linspace(0,24049,100);
for i = 2:5

  yy = spline(b(:,1),b(:,i),xx);

  % plot(b(:,1),b(:,2),'o',xx,yy);

  plot(b(:,1),b(:,i),type_Marker(i-1,:),...
      'color',type_MarkerFaceColor(i-1,:),...
      'MarkerFaceColor',type_MarkerFaceColor(i-1,:),...
      'MarkerSize',num_MarkerSize);   

  plot(xx,yy,...
      'color',type_MarkerFaceColor(i-1,:),...
      'LineWidth',num_LineWidth,...
      'HandleVisibility','off');

  hold on
end


% % ylim([6200 12000])
xlim([0,24000])
num_label_FontSize = 10;
num_FontSize_legend = 8;


set(gca,'FontSize',num_FontSize_legend,'Fontwei','Bold','Linewidth',1);
xlabel('Time/ns',...
  'FontSize',num_label_FontSize,...
  'FontWeight','bold',...
  'Color','k')
ylabel('stress/MPa',...
      'FontSize',num_label_FontSize,...
      'FontWeight','bold',...
      'Color','k')
% %%%%%%%%%%%%%%%%%%%%%%%%%%


hfig = figure(1);
figWidth = 10;
figHight = 7;
% 7.3,7 for fcc_word
lgd = legend({'stress11','stress12','stress22','vonmises\_stress'},...
            'Position',[0.59 0.24 0.245833333333333 0.146428571428571],...
            'FontSize',num_FontSize_legend,'TextColor','black');

set(hfig,'PaperUnits','centimeters');
set(hfig,'PaperPosition',[0 0 figWidth figHight])
fileout = [mat2str(12)];
print(hfig,[fileout,'bi_0_9'],'-r300','-dpng')

% 'Position',[0.594047619047619 0.269444444444445 0.245833333333333 0.146428571428571],...