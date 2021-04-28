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
close all

figure(1)
hold on
box on

num_MarkerSize = 5;
num_LineWidth = 1;

name_DisplayName = ['1%';'2%';'3%';'4%';'5%']
type_MarkerFaceColor = ['r';'g';'b';'c';'m']
type_Marker = ['o';'^';'s';'p';'d']

xx = linspace(0,90,100);
for i = 2:6

  yy = spline(b(:,1),b(:,i),xx);

  % plot(b(:,1),b(:,2),'o',xx,yy);

  plot(b(:,1),b(:,i),type_Marker(i-1,:),...
      'color',type_MarkerFaceColor(i-1,:),...
      'MarkerFaceColor',type_MarkerFaceColor(i-1,:),...
      'MarkerSize',num_MarkerSize,...
      'DisplayName',name_DisplayName(i-1,:));   

  plot(xx,yy,...
      'color',type_MarkerFaceColor(i-1,:),...
      'LineWidth',num_LineWidth,...
      'HandleVisibility','off');

  hold on
end


% % ylim([6200 12000])


xlim([0,90])
num_label_FontSize = 8;
xlabel('Euler angle/°',...
  'FontSize',num_label_FontSize,...
  'FontWeight','bold',...
  'Color','k')
ylabel('[R(t)-R(t1)]/(t-t1)',...
      'FontSize',num_label_FontSize,...
      'FontWeight','bold',...
      'Color','k')
set(gca,'FontSize',num_label_FontSize,'Fontwei','Bold','Linewidth',1);

% %%%%%%%%%%%%%%%%%%%%%%%%%%

hfig = figure(1);
figWidth = 10.0;
figHight = 6.5;
set(hfig,'PaperUnits','centimeters');
set(hfig,'PaperPosition',[0 0 figWidth figHight])
fileout = [mat2str(2)];
print(hfig,[fileout,'fcc'],'-r300','-dpng')

