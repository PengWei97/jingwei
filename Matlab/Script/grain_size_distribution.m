% 脚本目的：求解一个时间步中晶粒尺寸的分布情况
% 文件类型csv，提取第一行晶粒尺寸（2D:晶粒面积，3D:晶粒体积）
% 计算：每一个晶粒的晶粒半径，频率，平均晶粒尺寸

clear
clc
s=what
p=s.path
filename=dir([p,'\pw\','*.csv']); %获取data文件夹下面全部的.csv文件
n=length(filename);

number_Interval = input('please input the number of Interval:');


for i = 1:n-1
    date2(:,:,i) = zeros(number_Interval,2);
end


% --------------------------- 读取数据 -------------------------------------
name_average = filename(1).name; %读取时间演化的csv文件
[Num_average,Txt_average,Raw_average]=xlsread([p,'\pw\',name_average]); %读取数据
number_grain_initial = Num_average(1,5);

for i = 2:n
    average_number = str2num(filename(i).name(end-7:end-4))+2; 
%     average_number = str2num(filename(i).name(end-7:end-4))/4+1; 
%     average_rad = (Num_average(average_number,2)/pi)^0.5;
    average_rad = (Num_average(average_number,2)/pi)^0.5;
    [Num,Txt,Raw]=xlsread([p,'\pw\',filename(i).name]);%读取数据
    M = max(Num(:,1),[],1);
    max_rad = (M/pi)^0.5/average_rad;
    max_x = ceil(max_rad);
    qujian = linspace(0,max_x,number_Interval);
    number_qujian = zeros(number_Interval,1);
    
    % 计算晶粒相对半径 R/<R>
    for j = 1:number_grain_initial
        date1(j,1) = Num(j,1);
        date1(j,2) = (date1(j,1)/pi)^0.5/average_rad;
        cishu = date1(j,2);
        qujian = linspace(0,max_rad,number_Interval);
        
        % 计算各个区间晶粒尺寸出现的频率
        if cishu == qujian(1,1)
            number_qujian(1,1) = number_qujian(1,1)+1; 
        else
            for k = 2:number_Interval
                if qujian(1,k-1)< cishu && cishu <=qujian(1,k)
                    number_qujian(k,1) = number_qujian(k,1)+1;
                end
            end
        end  
    end
    
    number_grain = number_grain_initial - number_qujian(1,1);
    % 传递数据给date2
    for j = 2:number_Interval
        if j == 1
            date2(j,1,i-1) = qujian(1,j); % x周，相对晶粒尺寸
        else
            average_date2 = (qujian(1,j-1)+qujian(1,j))/2;
            date2(j,1,i-1) = average_date2;
        end   
        date2(j,2,i-1) = number_qujian(j,1)/number_grain; %晶粒数目频率
    end
end