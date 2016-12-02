% PSS signal

function [du2,fre_seq, time_seq] = PssGen(n_FFT,rootNo)


N_FFT = n_FFT;     % 1.4M�����²���16��,128��
u = rootNo;  % root index,u=25/29 or 34;

%  Table 6.11.1.1-1��NID2 mapping to Pss-u��in 36.211
%     NID2      rootindex u
%      0            25
%      1            29
%      2            34


for n = 0:1:30
    du(n+1) = exp(-j*pi*u.*n.*(n+1)/63);
    du(n+32) = exp(-j*pi*u*(n+31+1)*(n+31+2)/63);
end
du2 = du.';

firsthalf = du2(1:31,1);
secondhalf = du2(62:-1:32,1);
flag = isequal(firsthalf,secondhalf);   % ����Գ�,��matlab���㾫�����⣬flag��Ϊ1����ע�⡣


du2_amp = abs(du2);
du2_angle = angle(du2);
du2_phase = phase(du2);

fre_seq = zeros(N_FFT,1);
fre_seq(2:32) = du2(32:62);    %  ��1��ΪDC
fre_seq(-30+N_FFT:N_FFT) = du2(1:31);
time_seq =  sqrt(1.0*N_FFT)*ifft(fre_seq);        % �Ե�65�㾵��Գƣ����˵�1�㡣

time_seq_amp = abs(time_seq);
time_seq_angle = angle (time_seq);

% ZC25 = zeros(128,2);
% ZC25(1:62,1) = du2;
% ZC25(:,2) = time_seq;

%save ZC25 ZC25��



% 
% time_seq2 = ifft(du2,N_FFT);
% time_seq2_amp = abs(time_seq2);
% time_seq2_angle = angle (time_seq2);



