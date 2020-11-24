cd "/home/ks/.qucs";

				###########################################
data=loadQucsDataSet("/home/ks/.qucs/Practical Assignment1KDM/Q3/MAXMIN_prj/C.dat");
				###########################################

data.name

t=data(1).data;
l=length(t);

p1=data(2).data;
p2=data(5).data;

dcmax=mean(p1);
dcmin=mean(p2);


	    ########         ########          #########
plot (t,p1,';R2=0 \Omega;',t,p2,';R2= 1 k\Omega;');
	    ########          ########          #########
xlabel("Time in 's'");
ylabel("Current in 'A'");

			       #######################################        ##########################################
title('Input-Current vs Time for:(R2=0 \Omega ;R2=1 k\Omega )of IC-LM-317 voltage regulator.');
			       #######################################        ##########################################

grid on;
legend('location','southeast');
#xlim([0,.03]);
		 ##############################################
cd "/home/ks/.qucs/Practical Assignment1KDM/Q3/MAXMIN_prj"
		 ##############################################

print("Current.svg");

        ###############################################################################################################################
Result=["DC Current","_",num2str(dcmax),"_",num2str(dcmin)];
        ###############################################################################################################################

f=fopen("Dcurrent.txt","w");
for i =Result
	fprintf(f,"%s",i);
	i
endfor
fclose(f);