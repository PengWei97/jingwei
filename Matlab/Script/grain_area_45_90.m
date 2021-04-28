%% DESCRIPTION OF THE CODE
% Title：Matlab Visualization
% Author:北冥渔夫
% Data:2021.02.08
% Email:1248110286@qq.com

%% 文章框架
% 2D，
% scv文件读取；每一步中：平均晶粒半径计算，晶粒尺寸分布概率计算；绘制曲线
% 用于输出fig.4-f
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

idex_data = [4 14 55 104 152 198 234];


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
                    numGrainYPiont(k,1) = numGrainYPiont(k,1)+dataCSV(jData,1);
                end
            end
        else
            numGrainYPiont(1,1) = numGrainYPiont(1,1) + 1;
        end
    end

    xyPoint = zeros(NUM_INTERVAL,2);
    
    num_sum_are = sum(dataCSV(:,1))
    % 获取区间分布函数
    for jPoint = 2:NUM_INTERVAL
        xyPoint(jPoint,1) = (XPIONT(1,jPoint-1) + XPIONT(1,jPoint))/2; % x轴
%         xyPoint(jPoint,2) = 3.14*xyPoint(jPoint,1)^2.*numGrainYPiont(jPoint,1)/numGrainNow/(2/(NUM_INTERVAL-1)); % y轴
        xyPoint(jPoint,2) = numGrainYPiont(jPoint,1)/num_sum_are; % y轴
    end
%     xyPoint;

    for j = 1:length(xyPoint(:,1))
        xy(j,3*(iFile-2)+1) = xyPoint(j,1);
        xy(j,3*(iFile-2)+2) = xyPoint(j,2);
    end
    iFile;
end

%% 可视化
% type_MarkerFaceColor = ['r';'g';'c';'b';'m';'k';];
type_MarkerFaceColor = ['#FF0000';'#00FF00';'#f08521';'#32c24d';'#c13584';'#0000FF'];
% type_MarkerFaceColor = ['#bf0c0c';'#e76a05';'#ffc600';'#05007b';];

idex_data_output = [21 28 61 89 103 110 105];
hold on
box on
for iFile = 2:NUM_FILE-1
    bar(xy(1:idex_data_output(1,(iFile-1)),3*(iFile-2)+1),xy(1:idex_data_output(1,(iFile-1)),3*(iFile-2)+2),1.0,...
        'EdgeColor',type_MarkerFaceColor(iFile-1,:),...
        'FaceColor',type_MarkerFaceColor(iFile-1,:));
end

xx = linspace(0,2.0,100);
yy = spline(xy(1:21,1),xy(1:21,2),xx);
plot(xy(1:21,1),xy(1:21,2),'ro',xx,yy,'r',...
    'MarkerFaceColor','r',...
    'MarkerSize',2,...
    'LineWidth',0.5,...
    'HandleVisibility','off');

% xx = linspace(0,11,100);
% yy = spline(xy(1:110,16),xy(1:110,17),xx);
% plot(xy(1:110,16),xy(1:110,17),'bo',xx,yy,'b',...
%      'MarkerFaceColor','b',...
%      'MarkerSize',2,...
%      'LineWidth',0.5,...
%      'HandleVisibility','off');

num_FontSize_label = 10
num_FontSize_legend = 8

xlabel('R/<R>',...
  'FontSize',num_FontSize_label,...
  'FontWeight','bold',...
  'Color','k')
ylabel('Area Fraction',...
      'FontSize',num_FontSize_label,...
      'FontWeight','bold',...
      'Color','k')
set(gca,'FontSize',num_FontSize_legend,'Fontwei','Bold','Linewidth',1)

lgd = legend({'(a) 100.0ns','(b) 1000ns','(c) 5000ns','(d) 10000s','(e) 15000ns','(f)  20000ns'},...
            'FontSize',num_FontSize_legend,'TextColor','black','Location','northeast','NumColumns',2);

ylim([0 0.15])
% xlim([0,2.5])

hfig = figure(1);
figWidth = 11;
figHight = 7;
% 7.3,7 for fcc_word

set(hfig,'PaperUnits','centimeters');
set(hfig,'PaperPosition',[0 0 figWidth figHight])
fileout = [mat2str(12)];
print(hfig,[fileout,'bi_0_9'],'-r300','-dpng')









