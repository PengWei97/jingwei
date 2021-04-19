%用于生成随机取向的欧拉角
%（phi，theta，Phi），保持theta Phi为0，phi在0~90内变化
% 注意：输入的jnum需要在原有的基础上+1
%------------------参数处理-------------------------------

count = input('please input the number of grain:')
V=zeros(count,4);
for k=1:count
    if mod(k,2) == 0
        V(k,1) = 45.00;
    elseif mod(k,3) == 0
        V(k,1) = 44.0;
    else
        V(k,1) = 43.0;
    end
    V(k,4) = 1;
end

for j = 1:14
    V(jnum(j,1),1) = 90.00;
end


%-----------------------------输出---------------------------------------
filename = strcat('grn_',num2str(count),'_rand_2D.tex')
f=fullfile('E:\MATLAB\MATLAB_R2020a\bin',filename);
[r,c]=size(V);
fid=fopen(filename,'w');
fprintf(fid,'Texture File\n');
fprintf(fid,'\n');
fprintf(fid,'File generated from MATLAB\n');
fprintf(fid,'B ');
fprintf(fid,'%d\n',r);

for i=1:r
    fprintf(fid,'   ');
    for j=1:c
        if j==c
            fprintf(fid,'%3.2f\n',V(i,j));%如果是最后一个，就换行
        else
            if V(i,j)>0 && V(i,j)<10
               fprintf(fid,' '); 
            end
            fprintf(fid,'%4.2f',V(i,j));%如果不是最后一个，就tab
            fprintf(fid,'   ');
        end
    end

end
fclose(fid);
