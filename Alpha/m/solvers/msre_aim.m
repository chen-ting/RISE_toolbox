function [T,F,retcode]=msre_aim(~,Aplus,A0,Aminus,~,~,~)

% solve for T only

if hh>1
    A0=expand_array(A0,1);
    Aminus=expand_array(Aminus,1);
    Aplus=expand_array(Aplus,1);
end

[T,~,~,retcode]=dsge_solve_aim(Aplus{1},A0{1},Aminus{1},[],[],true);

F=[];

if retcode==0
    T=collapse_array(T,1,hh);
end