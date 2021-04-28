%% DESCRIPTION OF THE CODE
% Title：Matlab Visualization
% Author:北冥渔夫
% Data:2021.02.08
% Email:1248110286@qq.com

%% 文章框架
% 2D，
% 晶粒生长动力学
% 用于输出fig.3-d
close all
figure(1)
hold on
box on

maker_idx = 1:3:62;
maker_idx(1,21)=62;
plot(a(:,1),a(:,3),...
    'color','r',...
    'Marker','^',...
    'MarkerIndices',maker_idx,...
    'MarkerFaceColor','r',...
    'MarkerSize',5,...
    'LineWidth',1,...
    'DisplayName','(a) caseⅠ');

plot(a(:,5),a(:,7),...
    'color','b',...
    'Marker','v',...
    'MarkerIndices',maker_idx,...
    'MarkerFaceColor','b',...
    'MarkerSize',5,...
    'LineWidth',1,...
    'DisplayName','(b) case Ⅱ');

plot(a(:,9),a(:,11),...
    'color','c',...
    'Marker','d',...
    'MarkerIndices',maker_idx,...
    'MarkerFaceColor','c',...
    'MarkerSize',4,...
    'LineWidth',1,...
    'DisplayName','(c) case Ⅲ ');

ylim([3200 6400])
xlim([0,6000])

num_FontSize_label = 8
num_FontSize_legend = 10
xlabel('Time/ns',...
  'FontSize',num_FontSize_label,...
  'FontWeight','bold',...
  'Color','k')
ylabel('Number of grains/n',...
      'FontSize',num_FontSize_label,...
      'FontWeight','bold',...
      'Color','k')
set(gca,'FontSize',num_FontSize_legend,'Fontwei','Bold','Linewidth',1)
lgd = legend('FontSize',num_FontSize_legend,'TextColor','black','Location','northeast');
% 

hfig = figure(1);
figWidth = 10.0;
figHight = 6.5;
set(hfig,'PaperUnits','centimeters');
set(hfig,'PaperPosition',[0 0 figWidth figHight])
fileout = [mat2str(2)];
print(hfig,[fileout,'fcc'],'-r300','-dpng')