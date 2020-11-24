cd "/home/ks/.qucs";

				###########################################
data=loadQucsDataSet("/home/ks/.qucs/Practical Assignment1KDM/Q3/LM317LineRegulation_prj/C.dat");
				###########################################

data.name

t=data(1).data;
l=length(t);
t=t(1+l/5:l);

SVOUT=data(9);
Vout=SVOUT.data;
v1=Vout(1+l/5:l);
v2=Vout(l+1+l/5:2*l);
v3=Vout(2*l+1+l/5:3*l);

dc1=mean(v1);
dc2=mean(v2);
dc3=mean(v3);

r1=var(v1)*100/dc1;
r2=var(v2)*100/dc2;
r3=var(v3)*100/dc3;

	    ########         ########          #########
plot (t,v1,';100 V;',t,v2,';110 V;',t,v3,';120 V;');
	    ########          ########          #########
xlabel("Time in 's'");
ylabel("Voltage in 'V'");

			       #######################################        ##########################################
title('Input-Voltage vs Time for:(Vin=100 V ;Vin=110 V ;Vin=120 V  )of IC-LM-317 voltage regulator.');
			       #######################################        ##########################################

grid on;
legend('location','southeast');
#xlim([.05,.3]);
		 ##############################################
cd "/home/ks/.qucs/Practical Assignment1KDM/Q3/LM317LineRegulation_prj"
		 ##############################################

print("Input.svg");

        ###############################################################################################################################
Result=["Input","100 V","_","110 V","_","120 V" , "DC Voltage","_",num2str(dc1),"_",num2str(dc2),"_",num2str(dc3),"LR=",num2str(5*(dc3-dc1)/dc2)];
        ###############################################################################################################################

f=fopen("Din.txt","w");
for i =Result
	fprintf(f,"%s",i);
	i
endfor
fclose(f);