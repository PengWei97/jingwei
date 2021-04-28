%% DESCRIPTION OF THE CODE
% Title：Matlab Visualization
% Author:北冥渔夫
% Data:2021.02.08
% Email:1248110286@qq.com

%% 文章框架
% 2D，
% scv文件读取；每一步中：平均晶粒半径计算，晶粒尺寸分布概率计算；绘制曲线
% 输入到文件夹下的文件如下：
     % poly6400_grtracker45.csv
     % poly6400_grtracker45_grain_volumes_0024.csv
% 用于输入fig
close all
clear
clc

NUM_INTERVAL = 40; % 数据点数目
XMAX = 2.5;
XPIONT = linspace(0,XMAX,NUM_INTERVAL);

%% 文件提取 readtable
filename = dir('*.csv');
NUM_FILE = length(filename); % 获取*.csv文件的数目，2
DATA_CSV0 = table2array(readtable(filename(1).name)); %将poly6400_grtracker45.csv的数据转换成表格形式
NUM_INITIAL_GRAIN = DATA_CSV0(1,4); % 初始晶粒数目
xy = zeros(NUM_INTERVAL,2,NUM_FILE-1); % 输出数据-晶粒尺寸分布

volumesGrainAverage = 19685.07092;
% volumesGrainAverage = 22902.345203284; % 104
% volumesGrainAverage = 33375.275327252; % 416
% volumesGrainAverage = 40163.283525565; % 592
numGrainNow = 25282;
% numGrainNow = 5436; % 104
% numGrainNow = 3735; % 416
% numGrainNow = 3106; % 592

radiusGrainAverage = (volumesGrainAverage/pi)^0.5;
radiusGrain = zeros(NUM_INITIAL_GRAIN,1); % 初始化晶粒半径
radiusGrainTotal = 0;

%% 计算
for iFile = 2:NUM_FILE

    % 获取csv文件中的值，并计算每个晶粒半径
    % R = (S/PI)^0.5, radiusGrainAverage = SUM(R)/numGrainNow
    dataCSV = table2array(readtable(filename(iFile).name));
    for jData = 1:NUM_INITIAL_GRAIN
        radiusGrain(jData,1) = (dataCSV(jData,1)/pi)^0.5; %计算每个晶粒的半径%%%%
        radiusGrainTotal = radiusGrainTotal + radiusGrain(jData,1);
    end

    radiusGrainAverage = radiusGrainTotal/numGrainNow; % 计算平均晶粒半径，对于2D
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
        xyPoint(jPoint,2) = numGrainYPiont(jPoint,1)/numGrainNow/(XMAX/(NUM_INTERVAL-1)); % y轴
    end
%     xyPoint;
    xy(:,:,iFile-1) = xyPoint;
    iFile;
end

%% 可视化

bar(xy(:,1,1),xy(:,2,1),1.5,...
    'EdgeColor','r',...
    'FaceColor','r',...
    'DisplayName','a) 100ns');
hold on
xx = linspace(0,2.45,100);
yy = spline(xy(:,1,1),xy(:,2,1),xx);
plot(xy(:,1,1),xy(:,2,1),'r',xy(:,1,1),xy(:,2,1),'ro',...
    'MarkerFaceColor','r',...
    'MarkerSize',2,...
    'LineWidth',1,...
    'HandleVisibility','off');









