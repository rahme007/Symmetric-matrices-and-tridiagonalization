for N = 3:20
for idx_avge=1:500

%% Householder Method
% Covariance matrix is square and symmetric.
A = [1 2 1 2; 2 2 -1 1; 1 -1 1 1; 2 1 1 1]; %% use different random symmetric matrix to check the time
%A = [1 0 2; 0 2 1; 2 1 1];
%A = cx;
count = 1;
dd = A;
c = [];
tic
for i = 1:length(A) - 2
    Aold = A;
    size = length(A);
    xt = A(count,:);
    yt = xt(count+2:end);
    s = sqrt(xt(count+1)^2 + yt*yt');
    alpha = 1/sqrt(2*s*(s+ (xt(count+1)*xt(count+1)/abs(xt(count+1)))));
    disp(alpha)
    v = xt(count+1) + xt(count+1)*s/abs(xt(count+1));
    w = alpha * [zeros(1,count) v yt]';
    T = eye(size) - 2*(w*w');
    A = T*A*T;
    A(abs(A)< 10^-15) = 0;
    c = [c isequal(Aold,A)];
    app = fix(Aold); app1 = fix(A);
%     if abs(A-Aold) < 1e4*eps(min(abs(Aold),abs(A)))
%         break;
%     end
    dd = [diag(A); diag(A,1); diag(A,-1)]';
    count = count +1;
end
 time_H (idx_avge) = toc;

%% Givens Method
A = [1 2 1 2; 2 2 -1 1; 1 -1 1 1; 2 1 1 1]; % use different random symmetric matrix to check the time
% A = [1 0 2; 0 2 1; 2 1 1];
countG = 1;
len_A = length(A);
Anew = A;
tic
for i = 1: len_A-2
    r = i;
    for j = r+2:len_A
        R = eye(len_A);
        theta = atan(Anew(r,j)/Anew(r,r+1));
        R(r+1,r+1) = cos(theta); R(j,j) = cos(theta); 
        R(r+1,j) =  sin(theta); R(j,r+1)= -sin(theta);
        Anew = R*Anew*R';
        disp(Anew)
    end
end
time_G (idx_avge) = toc;

% Jacobi Method
A = [1 0 2; 0 2 1; 2 1 1];
A = [1 2 1 2; 2 2 -1 1; 1 -1 1 1; 2 1 1 1]; % use different random symmetric matrix to check the time
Aj = A;
countj = 1;
Astore = [];
Rstore = [];
sub = [];
rows_cols = [];
tic
while(true)
    countj = countj + 1;
    Aold = Aj;
    up_diag = triu(Aj,1);
    maxe = max(up_diag(:));
    [r, c] = find(up_diag == maxe);
    rows_cols = [rows_cols r(1) c(1)];
    sub = [sub Aj(r(1),r(1))-Aj(c(1),c(1))];
    if Aj(r(1),r(1))-Aj(c(1),c(1))<1e-5
        thetaj = (Aj(r(1),c(1))/abs(Aj(r(1),c(1))))*(pi/4);
    else
        thetaj = atan(2*Aj(r(1),c(1))/(Aj(r(1),r(1))-Aj(c(1),c(1))))/2;
    end
    R = eye(length(A));
    R(r(1),c(1)) = sin(thetaj); R(r(1),r(1)) = cos(thetaj);
    R(c(1), r(1)) = -sin(thetaj); R(c(1),c(1)) = cos(thetaj);
    Aj = R*Aj*R';
    Rstore = [Rstore R];
    Astore = [Astore zeros(length(Aj),1) Aj];
    if sum(sum(abs(Aj-Aold))) < 1e-5 
        break;
    end
end
time_J (idx_avge) = toc;
end
avge_time_H = mean(time_H);
avge_time_G = mean(time_G);
avge_time_J = mean(time_J);
time_allN (N,:) = [avge_time_H avge_time_G avge_time_J];
end

% figure
% plot(time_allN(:,1), 'm-','LineWidth',2); hold on; 
% plot(time_allN(:,2), 'k--','LineWidth',2); hold on;
% plot(time_allN(:,3), 'c-*','LineWidth',2); hold on; 
% 
% legend('HouseHolder Method','Givens Method', 'Jacobi Method');
% xlabel('N');
% ylabel('Total Processing Time (Seconds)');