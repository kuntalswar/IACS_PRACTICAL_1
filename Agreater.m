cd "/home/ks/.qucs";

				###########################################
data=loadQucsDataSet("/home/ks/.qucs/Practical Assignment1KDM/Q2/ChangingBreakdownVoltage_prj/C.dat");
				###########################################

data.name
t=data(1).data;
l=length(t);

SVOUT=data(10);
Vout=SVOUT.data;
v1=Vout(1:l);
v2=Vout(l+1:2*l);
v3=Vout(2*l+1:3*l);

dc1=mean(v1);
dc2=mean(v2);
dc3=mean(v3);

r1=var(v1)*100/dc1;
r2=var(v2)*100/dc2;
r3=var(v3)*100/dc3;

	    ########          ########          #########
plot (t,v1,';0.1k\Omega;',t,v2,';1k\Omega;',t,v3,';10k\Omega;');
	    ########          ########          #########
xlabel("Time in 's'");
ylabel("Voltage in 'V'");

			       #######################################        ##########################################
title('Output-VoltagevsTime for:(RL=0.1k\Omega;RL=1k\Omega;RL=10k\Omega)of ZenerDiode based regulator; V_B=15V');
			       #######################################        ##########################################

grid on;
legend('location','southeast');

		 ##############################################
cd "/home/ks/.qucs/Practical Assignment1KDM/Q2/ChangingBreakdownVoltage_prj"
		 ##############################################

print("Outputgreater.svg");

        ###############################################################################################################################
Result=["RL","0.1k","_","1k","_","10k" , "DC Voltage","_",num2str(dc1),"_",num2str(dc2),"_",num2str(dc3),"LR=",num2str(100*(dc3-dc1)/dc2)];
        ###############################################################################################################################

f=fopen("Dgreater.txt","w");
for i =Result
	fprintf(f,"%s",i);
	i
endfor
fclose(f);