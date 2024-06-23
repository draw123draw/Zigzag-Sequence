clear,clc
%% 输入数据
S=[0,1,5,6;2,4,7,12;3,8,11,13;9,10,14,15];
[nt,nx]=size(S);

%% z字重排算法,输出2d矩阵z_mat或1d数组z
t=1;tr=1;dir=1;
% dir==1,右→
% dir==2,左下↙
% dir==3,下↓
% dir==4,右上↗
z=zeros(1,nt*nx);
for i=1:nt*nx
    z(i)=S(t,tr);
    if dir==1
        tr=tr+1;
        if t~=nt
            dir=2;
        else
            dir=4;
        end
    elseif dir==2
        tr=tr-1;
        t=t+1;
        if tr==1 || t==nt %到达边界
            if t~=nt
                dir=3;
            else
                dir=1;
            end
        end
    elseif dir==3
        t=t+1;
        if tr~=nx
            dir=4;
        else
            dir=2;
        end
    elseif dir==4
        t=t-1;
        tr=tr+1;
        if t==1 || tr==nx %到达边界
            if tr~=nx
                dir=1;
            else
                dir=3;
            end
        end
    end
end

z_mat=reshape(z,[4,4]);
