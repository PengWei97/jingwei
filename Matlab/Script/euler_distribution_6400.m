close all
figure(1);
hold on
box on

bar(a(:,1),[a(:,2).*100,a(:,4).*100],1.0)

% xx = linspace(3,1,87);
% yy = spline(a(:,1),a(:,2),xx);
% plot(xx,yy,'r',a(:,1),a(:,2),'ro',...
%     'MarkerFaceColor','r',...
%     'MarkerSize',1,...
%     'LineWidth',1,...
%     'HandleVisibility','off');

% xx = linspace(3,1,87);
% yy = spline(a(:,1),a(:,4),xx);
% plot(xx,yy,'m',a(:,1),a(:,4),...
%     'MarkerFaceColor','m',...
%     'MarkerSize',1,...
%     'LineWidth',1,...
%     'HandleVisibility','off');

% ylim([0 1.7])
% xlim([0,6.5])

num_FontSize_label = 8
num_FontSize_legend = 10
xlabel('Euler Angle/°',...
  'FontSize',num_FontSize_label,...
  'FontWeight','bold',...
  'Color','k')
ylabel('Frequency/%',...
      'FontSize',num_FontSize_label,...
      'FontWeight','bold',...
      'Color','k')
set(gca,'FontSize',num_FontSize_legend,'Fontwei','Bold','Linewidth',1)
lgd = legend({'(a) caseⅠ','(b) case Ⅱ'},'FontSize',num_FontSize_legend,'TextColor','black','Location','north');

hfig = figure(1);
figWidth = 10.0;
figHight = 6.4;
set(hfig,'PaperUnits','centimeters');
set(hfig,'PaperPosition',[0 0 figWidth figHight])
fileout = [mat2str(2)];
print(hfig,[fileout,'fcc'],'-r300','-dpng')