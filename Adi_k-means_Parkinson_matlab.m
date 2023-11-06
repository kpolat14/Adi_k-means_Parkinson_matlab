
clc;

clear all;

load breast_cancer_mad_norm_class;



A=breast_cancer_mad_norm_class(1:48,1:22);

B=breast_cancer_mad_norm_class(49:195,1:22);


   x =[A
      B];
  

[c,mu] = kmeans(x,2);


       
 c=mu;
 
 
 [n,m]=size(A);
   
  [n1,m1]=size(B);
 
  d_mean_1=mean(A,1);
  
 d_mean_2=mean(B,1);
 

  for j=1:n,
 for i=1:m,
 fark_1(j,i)=abs(A(j,i)-c(1,i));
 end
  end
  
   fark_mean1=mean(fark_1,1);
   

    for i=1:m,
        if c(1,i)==0,
            c(1,i)=1;
        end
                    
 weight1(1,i)=fark_mean1(1,i)/c(1,i);
    end
   

 
    
    
   
   for j=1:n1,
 for i=1:m1,
 fark_2(j,i)=abs(B(j,i)-c(2,i));
 end
  end
  
   fark_mean2=mean(fark_2,1);

   
     for i=1:m1,
          if c(2,i)==0,
            c(2,i)=1;
          end
        
 weight2(1,i)=fark_mean2(1,i)/c(2,i);
     end
   

 
 
     
     
     for i=1:m,

parkinson_disease_kmeans_new_mes_0_kmeans_weighted(:,i)=(A(:,i)*weight1(:,i));

end


for i=1:m1,

parkinson_disease_kmeans_new_mes_1_kmeans_weighted(:,i)=(B(:,i)*weight2(:,i));

end


     


     
    
    
   
   for i=1:m,
         if fark_mean2(1,i)==0,
            fark_mean2(1,i)=1;
          end
       
  fark_ratio(1,i)=fark_mean1(1,i)/fark_mean2(1,i);
  
   end

    
   fark_ratio_mean=mean(fark_ratio,2);
   
   
   

   
    F_secilen(1,1)=0; 
 
 F_ignore(1,1)=0;
 
  a=1;
  b=1;
    
      for z=1:m,
          
          if fark_ratio(1,z)>=fark_ratio_mean,
              F_secilen(1,a)=z;
              a=a+1;
                else
              F_ignore(1,b)=z;
              b=b+1;
          end
      end
      
      
      
        [g,h]=size(F_secilen);
       
       for x=1:h, 
           
           parkinson_disease_normal_Fselec_kmeans(:,x)=A(:,F_secilen(1,x));
           
       end
       
           
   
           for x=1:h, 
           
        parkinson_disease_patient_Fselec_kmeans(:,x)=B(:,F_secilen(1,x));
           
           end
       
    save parkinson_disease_normal_Fselec_kmeans;
    save parkinson_disease_patient_Fselec_kmeans;
    
      
      
save parkinson_disease_kmeans_new_mes_0_kmeans_weighted;

save parkinson_disease_kmeans_new_mes_1_kmeans_weighted;
