clear,clc
%% 输入数据S
S=reshape(1:16,[4,4]);S=S';
[nrows,ncols]=size(S);

%% z字重排算法,输出2d矩阵z_mat或1d数组z
y=1;x=1;dir=1;
% dir==1,右→
% dir==2,左下↙
% dir==3,下↓
% dir==4,右上↗
z=zeros(1,nrows*ncols);
for i=1:nrows*ncols
    z(i)=S(y,x);
    if dir==1
        x=x+1;
        if y~=nrows
            dir=2;
        else
            dir=4;
        end
    elseif dir==2
        x=x-1;
        y=y+1;
        if x==1 || y==nrows %到达边界
            if y~=nrows
                dir=3;
            else
                dir=1;
            end
        end
    elseif dir==3
        y=y+1;
        if x~=ncols
            dir=4;
        else
            dir=2;
        end
    elseif dir==4
        y=y-1;
        x=x+1;
        if y==1 || x==ncols %到达边界
            if x~=ncols
                dir=1;
            else
                dir=3;
            end
        end
    end
end

z_mat=reshape(z,[4,4]);