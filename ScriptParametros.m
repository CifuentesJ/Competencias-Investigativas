clc
clear all
format long
disp('diseño de una antena patch empleando linea de transmision');
disp('---------------------------------------------------------------------------');

er = input('ingrese la constante dielectrica');
h = input('ingrese el grosor del sustrato(in mm)');
f = input('Ingrese la frecuencia  (en GHz)');
z = input('Ingrese la impedancia(ohm)');
disp('calculando, espere por favor');

c= 3*1e8;
f = f*1e9;
lamda= (c/f)*1000;

Wp = (lamda/2)*(sqrt(2.0/(er+1.0)));
e_eff = ((er+1)/2)+(((er-1)/2)*(1+((12*h)/Wp))^-0.5);
del_l = (0.412*h)* (((e_eff+0.3)+((Wp/h)+0.264))/ ((e_eff-0.258)*((Wp/h)+0.8)));
l_eff = ((15/(f*sqrt(e_eff)))*1e9)*10;
Lp = l_eff-(2*del_l);
G = ((Wp)/(120*lamda))*((1-((1/24)*(((2*pi*(h))/lamda)^2))));
Rin= (1/(2*G));
Yo = (Lp*(acos(sqrt(50/Rin))))/(pi);
B = 60*pi*pi/(z*sqrt(er));
m1 = (2*B)- 1;
m = log(m1);
n1 = B-1;
n = log(n1);
Wo = (2*h/pi)*(B-1-m+(((er-1)/(2*er))*(n+0.39-((0.61)/er))));
Lg_min = 2*Lp;
Wi_min = 2*Wp;
inset= (6*h)/2;
xo= (Wo/4);


disp('Rectangular patch:');
disp(['The width of the patch(wp) is:',num2str(Wp),'mm']);
disp(['The length of the patch(Lp)is:',num2str(Lp),'mm']);
disp(['The inset feed point(Yo)is:',num2str(Yo),'mm']);
disp(['The width of the feed line(Wo)is:',num2str(Wo),'mm']);
disp(['The gap of the feed line(xo)is:',num2str(xo),'mm']);
disp(['The minimum length of ground plane is Wd:',num2str(Wi_min),'mm']);
disp(['The minimum length of ground plane is Ld:',num2str(Lg_min),'mm']);