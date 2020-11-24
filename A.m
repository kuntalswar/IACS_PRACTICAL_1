cd "/home/ks/.qucs";
data=loadQucsDataSet("/home/ks/.qucs/Practical Assignment1KDM/Q1/EffectiveCapacitane_prj/C.dat");
t=data(1).data;
l=length(t);
SVOUT=data(7);
Vout=SVOUT.data;
c1=Vout(1:l);
c2=Vout(l+1:2*l);
c3=Vout(2*l+1:3*l);
dc1=mean(c1);
dc2=mean(c2);
dc3=mean(c3);
r1=var(c1)*100/dc1;
r2=var(c2)*100/dc2;
r3=var(c3)*100/dc3;
plot (t,c1,';1\muF;',t,c2,';10\muF;',t,c3,';100\muF;');
xlabel("Time in 's'");
ylabel("Voltage in 'V'");
title('Output-Voltage vs Time for:(C1=1\muF ;C1=10\muF ;C1=100\muF )of Diode & Capacitor based voltage regulator.');
grid on;
legend('location','southeast');
cd "/home/ks/.qucs/Practical Assignment1KDM/Q1/EffectiveCapacitane_prj"
print("Output.pdf");
Ripple=["Capacitor value","1muF","_","10muF","_","100muF" , "Ripple Factor","_",num2str(r1),"_",num2str(r2),"_",num2str(r3)];
f=fopen("D.txt","w");
for i =Ripple
	fprintf(f,"%s",i);
	i
endfor
fclose(f);