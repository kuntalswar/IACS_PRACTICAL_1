cd "/home/ks/.qucs";

				###########################################
data=loadQucsDataSet("/home/ks/.qucs/Practical Assignment1KDM/Q3/MAXMIN_prj/C.dat");
				###########################################

data.name

t=data(1).data;
l=length(t);

MAX=data(8).data;
MIN=data(9).data;

dcmax=mean(MAX);
dcmin=mean(MIN);


	    ########         ########          #########
plot (t,MAX,';R2= 1 k\Omega;');
	    ########          ########          #########
xlabel("Time in 's'");
ylabel("Voltage in 'V'");

			       #######################################        ##########################################
title('Output-Voltage vs Time for:(R1=20 \Omega ;R2=1 k\Omega )of IC-LM-317 voltage regulator.');
			       #######################################        ##########################################

grid on;
legend('location','southeast');
#xlim([.05,.08]);
		 ##############################################
cd "/home/ks/.qucs/Practical Assignment1KDM/Q3/MAXMIN_prj"
		 ##############################################

print("Outputmax.svg");

        ###############################################################################################################################
Result=["DC Voltage","_",num2str(dcmax),"_",num2str(dcmin)];
        ###############################################################################################################################

f=fopen("D.txt","w");
for i =Result
	fprintf(f,"%s",i);
	i
endfor
fclose(f);