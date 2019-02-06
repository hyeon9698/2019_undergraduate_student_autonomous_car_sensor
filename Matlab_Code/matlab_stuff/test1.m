% input data

noise_sigma = 100;

x = [1:100]';

y = -2*(x-40).^2+30;

oy = 500*abs(x-60)-5000;

y([50:70]) = y([50:70]) + oy([50:70]);

y = y + noise_sigma*randn(length(x),1);



% build matrix

A = [x.^2 x ones(length(x),1)];

B = y;



% RANSAC fitting

n_data = length(x);

N = 100;        % iterations

T = 3*noise_sigma;   % residual threshold

n_sample = 3;

max_cnt = 0;

best_model = [0;0;0];

for itr=1:N,

    % random sampling

    k = floor(n_data*rand(n_sample,1))+1;



   % model estimation

    AA = [x(k).^2 x(k) ones(length(k),1)];

    BB = y(k);

    X = pinv(AA)*BB;  % AA*X = BB



   % evaluation

    residual = abs(B-A*X);

    cnt = length(find(residual<T));

    if(cnt>max_cnt),

        best_model = X;

        max_cnt = cnt;

    end;

end;



% optional LS(Least Square) fitting

residual = abs(A*best_model - B);

in_k = find(residual<T);    % inlier k

A2 = [x(in_k).^2 x(in_k) ones(length(in_k),1)];

B2 = y(in_k);

X = pinv(A2)*B2;    % refined model



% drawing

F = A*X;

figure; plot(x,y,'*b',x,F,'r');    