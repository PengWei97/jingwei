%% DESCRIPTION OF THE CODE
% Title：Matlab Visualization
% Author:北冥渔夫
% Data:2021.02.08
% Email:1248110286@qq.com

%% 文章框架
% 2D，
% scv文件读取；每一步中：平均晶粒半径计算，晶粒尺寸分布概率计算；绘制曲线
% 用于输出fig.3-f

close all
clear
clc

NUM_INTERVAL = 100; % 数据点数目


%% 文件提取 readtable
filename = dir('*.csv');
NUM_FILE = length(filename); % 获取*.csv文件的数目，2
DATA_CSV0 = table2array(readtable(filename(1).name)); %将poly6400_grtracker45.csv的数据转换成表格形式
NUM_INITIAL_GRAIN = DATA_CSV0(1,5); % 初始晶粒数目
xy = zeros(NUM_INTERVAL,3*(NUM_FILE-1)); % 输出数据-晶粒尺寸分布

idex_data = [5 19 34 41 198 234];

% idex_data中5表示*.csv文件中文件中0024.csv时刻的总体情况，且第一行为0000
% 对于0024 = 8*(4-1),即5= 4+1
% 对于0312 = 8*(40-1),即41 = 40+1


%% 计算
for iFile = 2:NUM_FILE
     radiusGrain = zeros(NUM_INITIAL_GRAIN,1); % 初始化晶粒半径
     radiusGrainTotal = 0;
    % 获取csv文件中的值，并计算每个晶粒半径
    % R = (S/PI)^0.5, radiusGrainAverage = SUM(R)/numGrainNow
    numGrainNow = DATA_CSV0(idex_data(iFile-1)-1,5);
    dataCSV = table2array(readtable(filename(iFile).name));
    for jData = 1:NUM_INITIAL_GRAIN
        radiusGrain(jData,1) = (dataCSV(jData,1)/pi)^0.5; %计算每个晶粒的半径%%%%
        radiusGrainTotal = radiusGrainTotal + radiusGrain(jData,1);
    end
    
    radiusGrainAverage = radiusGrainTotal/numGrainNow; % 计算平均晶粒半径，对于2D
    MAX_radiusRelativeGrain = roundn(max(radiusGrain(:,1))/radiusGrainAverage,-1);
    NUM_INTERVAL = ceil(MAX_radiusRelativeGrain*10);
    XPIONT = linspace(0,MAX_radiusRelativeGrain,NUM_INTERVAL);
    numGrainYPiont = zeros(NUM_INTERVAL,1); % 初始化区间内晶粒数目

    % 计算出现在区间内的晶粒数目
    for jData = 1:NUM_INITIAL_GRAIN
        radiusRelativeGrain(jData,1) = radiusGrain(jData,1)/radiusGrainAverage;
        if radiusRelativeGrain(jData,1) ~= 0
            for k = 2:NUM_INTERVAL
                if radiusRelativeGrain(jData,1) > XPIONT(1,k-1) && radiusRelativeGrain(jData,1) <= XPIONT(1,k)
                    numGrainYPiont(k,1) = numGrainYPiont(k,1)+1;
                end
            end
        else
            numGrainYPiont(1,1) = numGrainYPiont(1,1) + 1;
        end
    end

    xyPoint = zeros(NUM_INTERVAL,2);
    

    % 获取区间分布函数
    for jPoint = 2:NUM_INTERVAL
        xyPoint(jPoint,1) = (XPIONT(1,jPoint-1) + XPIONT(1,jPoint))/2; % x轴
%         xyPoint(jPoint,2) = 3.14*xyPoint(jPoint,1)^2.*numGrainYPiont(jPoint,1)/numGrainNow/(2/(NUM_INTERVAL-1)); % y轴
        xyPoint(jPoint,2) = numGrainYPiont(jPoint,1)/numGrainNow/(MAX_radiusRelativeGrain/(NUM_INTERVAL-1)); % y轴
        % 相对频率 = 绝对频率/所区分区间的间距
    end
%     xyPoint;

    for j = 1:length(xyPoint(:,1))
        xy(j,3*(iFile-2)+1) = xyPoint(j,1);
        xy(j,3*(iFile-2)+2) = xyPoint(j,2);
    end
    iFile;
end

type_MarkerFaceColor = ['r';'g';'c';'b';'m'];
type_Marker = ['o';'^';'s';'p';'d']
idex_data_output = [21 23 26 28 103 110 105]
hold on
box on
% for iFile = 2:NUM_FILE
%     bar(xy(1:idex_data_output(1,(iFile-1)),3*(iFile-2)+1),xy(1:idex_data_output(1,(iFile-1)),3*(iFile-2)+2),1.5,...
%         'EdgeColor',type_MarkerFaceColor(iFile-1,:),...
%         'FaceColor',type_MarkerFaceColor(iFile-1,:));
% end
for iFile = 2:NUM_FILE
    max_xx = max(xy((1:idex_data_output(1,(iFile-1))),3*(iFile-2)+1));
    x = xy(1:idex_data_output(1,(iFile-1)),3*(iFile-2)+1);
    y = xy(1:idex_data_output(1,(iFile-1)),3*(iFile-2)+2);
    xx = linspace(0,max_xx,100);
    yy = spline(x,y,xx);
    type_Marker_0 = strcat(type_MarkerFaceColor(iFile-1,:),type_Marker(iFile-1,:));
    type_Marker_1 = type_MarkerFaceColor(iFile-1,:);
    plot(xx,yy,...
    'color',type_Marker_1,...
    'LineWidth',1,...
    'HandleVisibility','off');

    plot(x,y,type_Marker_0,...
    'MarkerFaceColor',type_Marker_1,...
    'LineWidth',3,...
    'MarkerSize',3,...
    'HandleVisibility','on');
%     plot(x,y,type_Marker_0,xx,yy,type_Marker_1,...
%     'MarkerFaceColor',type_Marker_1,...
%     'MarkerSize',2,...
%     'LineWidth',1,...
%     'HandleVisibility','on');
end

xx_Hillert = linspace(0,1.99,100);
beta_dim = 2
yy_Hillert = beta_dim.*xx_Hillert./(2-xx_Hillert).^(2+beta_dim).*(2*exp(1)).^beta_dim.*exp(-2*beta_dim./(2-xx_Hillert))

plot(xx_Hillert,yy_Hillert,...
     'color','m',...
    'MarkerFaceColor','m',...
    'MarkerSize',2,...
    'LineWidth',1,...
    'HandleVisibility','on');

% xx = linspace(0,2.1,100);

% yy = spline(xy(1:21,1),xy(1:21,2),xx);
% plot(xy(:,1),xy(:,2),'ro',xx,yy,'r',...
%     'MarkerFaceColor','r',...
%     'MarkerSize',2,...
%     'LineWidth',1,...
%     'HandleVisibility','off');

% xx = linspace(0,2.45,100);
% yy = spline(xy(:,3*(iFile-2)+1),xy(:,3*(iFile-2)+2),xx);
% plot(xy(:,3*(iFile-2)+1),xy(:,3*(iFile-2)+2),'bo',xx,yy,'b',...
%     'MarkerFaceColor','b',...
%     'MarkerSize',2,...
%     'LineWidth',1,...
%     'HandleVisibility','off');

num_FontSize_label = 15
num_FontSize_legend = 10

xlabel('R/<R>',...
  'FontSize',num_FontSize_label,...
  'FontWeight','bold',...
  'Color','k')

ylabel('Related Frequency',...
      'FontSize',num_FontSize_label,...
      'FontWeight','bold',...
      'Color','k')
set(gca,'FontSize',num_FontSize_label,'Fontwei','Bold','Linewidth',1)

lgd = legend({'(a) 146.0ns, 25282 grains','(b) 1144 ns, 21193 grains','(c) 2214 ns, 18280 grains' ,'(d) 2800 ns 17109 grains','(e) Hillert Distribution'},...
            'FontSize',num_FontSize_legend,'TextColor','black','Location','northeast');

% ylim([0 1.4])
xlim([0,2.5])

hfig = figure(1);
figWidth = 20;
figHight = 13;
% 7.3,7 for fcc_word

set(hfig,'PaperUnits','centimeters');
set(hfig,'PaperPosition',[0 0 figWidth figHight])
fileout = [mat2str(12)];
print(hfig,[fileout,'bi_0_9'],'-r300','-dpng')







