cd "/home/ks/.qucs";

				###########################################
data=loadQucsDataSet("/home/ks/.qucs/Practical Assignment1KDM/Q3/LM317LoadRegulation_prj/C.dat");
				###########################################

data.name

t=data(1).data;
l=length(t);
t=t(1+l/5:l);

SVOUT=data(5);
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
plot (t,v1,';3 k\Omega;',t,v2,';5 k\Omega;',t,v3,';7 k\Omega;');
	    ########          ########          #########
xlabel("Time in 's'");
ylabel("Voltage in 'V'");

			       #######################################        ##########################################
title('Output-Voltage vs Time for:(Load=3 k\Omega ;Load=5 k\Omega  ;Load=7 k\Omega  )of IC-LM-317 voltage regulator.');
			       #######################################        ##########################################

grid on;
legend('location','southeast');
#xlim([.05,.08]);
		 ##############################################
cd "/home/ks/.qucs/Practical Assignment1KDM/Q3/LM317LoadRegulation_prj"
		 ##############################################

print("Output.svg");

        ###############################################################################################################################
Result=["Load=3 k/Omega ","_","Load=5 k/Omega" "_","Load=7 k/Omega ", "DC Voltage","_",num2str(dc1),"_",num2str(dc2),"_",num2str(dc3),"LR=",num2str(100*(dc3-dc1)/dc2)];
        ###############################################################################################################################

f=fopen("D.txt","w");
for i =Result
	fprintf(f,"%s",i);
	i
endfor
fclose(f);