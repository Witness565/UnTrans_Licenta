clear all 
%
delta_psi=[delta(1) delta(2) delta(3) delta(4) delta(5) delta(6) delta(7) delta(8) delta(9) delta(10)];
%
a=newfis('regPI','sugeno');
a=addvar(a,'input','epsi',[-2*delta(1) 2*delta(1)]);
a=addmf(a,'input',1,'Nm','trapmf' ,[-2*delta(1) -2*delta(1) -delta(1) 0]);
a=addmf(a,'input',1,'Ze','trimf' ,[-delta(1) 0 delta(1)]);
a=addmf(a,'input',1,'Pm','trapmf' ,[0 delta(1) 2*delta(1) 2*delta(1)]);
% plotmf(a,'input',1)
% pause
a=addvar(a,'input','depsi',[-2*delta(2) 2*delta(2)]);
a=addmf(a,'input',2,'Nm','trapmf' ,[-2*delta(2) -2*delta(2) -delta(2) 0]);
a=addmf(a,'input',2,'Ze','trimf' ,[-delta(2) 0 delta(2)]);
a=addmf(a,'input',2,'Pm','trapmf' ,[0 delta(2) 2*delta(2) 2*delta(2)]);
% plotmf(a,'input',2)
% pause
a=addvar(a,'output','dukr_psi',[-0.5 0.5]);
a=addmf(a,'output',1,'unu' ,'linear',delta(3)*[delta(5) delta(6) 0]);
a=addmf(a,'output',1,'doi','linear',delta(4)*[delta(7) delta(8) 0]);
%
a=addvar(a,'output','dukl_psi',[-0.5 0.5]);
a=addmf(a,'output',2,'unu' ,'linear',delta(4)*[delta(5) delta(6) 0]);
a=addmf(a,'output',2,'doi','linear',delta(3)*[delta(7) delta(8) 0]);
%
ListaReguli=[1 1 1 1 1 1
		     1 2 1 2 1 1
             1 3 2 1 1 1
			 2 1 2 2 1 1
		     2 2 1 1 1 1
             2 3 1 2 1 1
             3 1 2 1 1 1
		     3 2 2 2 1 1
             3 3 2 1 1 1];

a=addrule(a,ListaReguli)
writefis(a,'regPI')