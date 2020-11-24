cd "/home/ks/.qucs";

				###########################################
data=loadQucsDataSet("/home/ks/.qucs/Practical Assignment1KDM/Q1/LineRegulation_prj/C.dat");
				###########################################

t=data(1).data;
l=length(t);

SVOUT=data(7);
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

	    ########         ########          #########
plot (t,v1,';5 V;',t,v2,';6 V;',t,v3,';7 V;');
	    ########          ########          #########
xlabel("Time in 's'");
ylabel("Voltage in 'V'");

			       #######################################        ##########################################
title('Output-Voltage vs Time for:(Vin=5 V ;Vin=6 V ;Vin=7 V  )of Diode & Capacitor based voltage regulator.');
			       #######################################        ##########################################

grid on;
legend('location','southeast');

		 ##############################################
cd "/home/ks/.qucs/Practical Assignment1KDM/Q1/LineRegulation_prj"
		 ##############################################

print("Output.svg");

        ###############################################################################################################################
Result=["Vinput","5 V","_","6 V","_","7 V" , "DC Voltage","_",num2str(dc1),"_",num2str(dc2),"_",num2str(dc3),"LR=",num2str(50*(dc3-dc1)/dc2)];
        ###############################################################################################################################

f=fopen("D.txt","w");
for i =Result
	fprintf(f,"%s",i);
	i
endfor
fclose(f);