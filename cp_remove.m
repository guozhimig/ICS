



%������ʵ���Ƴ�cp�Ĳ���
%time_dimȡֵ������ʱ���������ϻ���������
function [ofdm_useful_signal] = cp_remove(full_ofdm_signal,N_GP,time_dim)

[row,col] = size(full_ofdm_signal);

if time_dim==1
    % Cyclic Prefix
     ofdm_useful_signal = full_ofdm_signal(:,N_GP+1:1:col);
elseif time_dim==2
    ofdm_useful_signal = full_ofdm_signal(N_GP+1:1:row,:);
    % Cyclic Prefix
   
else
    % �������ݸ�ʽ����
    fprintf(1,'======================================================================\n');
    fprintf(1,'\t remove_cp.m can not process signal more than three dimension  !\n');
    fprintf(1,'======================================================================\n');
end
