%Works for:
%-60<=theta1>=60
%-60<=theta2>=60
%-90<=thetaB>=90
%-90<=theta5>=90l1=95; 
l1=95; 
l2=100; 
l3=60; 
l4=0; 
l5=0;
d1=155;
d2=0;
d3=0;
d4=0;
d5=110;
alpha1=0;alpha2=pi/2;alpha3=0;alpha4=pi/2;alpha5=0;

if (abs(A(1,1))>0.001&&abs(A(1,2))>0.001&&abs(A(1,3))>0.001&&...
    abs(A(2,1))>0.001&&abs(A(1,2))>0.001&&abs(A(2,3))>0.001&&...               
    abs(A(3,1))>0.001&&abs(A(3,2))>0.001&&abs(A(3,3))>0.001)                   %no element of A is 0
    %% 1 try thetaA: + +, 
    %%       thetaB: + -
    sol=1.1
    thetaA_inv=atan2(A(2,3),A(1,3));
    thetaB_inv=atan2((A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
    theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
    theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
    if(abs(theta3_inv)>pi)
        theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
    end
    theta4_inv=thetaB_inv-pi/2-theta3_inv;
    theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
    if(abs(theta1_inv)>pi)
        theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
    end
    theta2_inv=thetaA_inv-theta1_inv;
    
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
          
%% 2. try thetaA: - -, 
%%        thetaB: + -
        sol=2.1
        thetaA_inv=atan2(-A(2,3),-A(1,3));
        thetaB_inv=atan2((A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    end
        
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
%% 3. try thetaA: + +, 
%%        thetaB: - -
        sol=3.1
        thetaA_inv=atan2(-A(2,3),-A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
            theta4_inv=thetaB_inv-pi/2-theta3_inv;
        if(abs(theta4_inv)>pi)
            theta4_inv=theta4_inv-sign(theta4_inv)*2*pi;
        end
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    end
      
      %%
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
%% 4. try thetaA: - -, 
%%        thetaB: - -
        sol=4.1
        thetaA_inv=atan2(A(2,3),A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv; 
    end
    %%
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
    abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)

%% 5. try thetaA: + +, 
%%        thetaB: - +
        sol=5.1
        thetaA_inv=atan2(A(2,3),A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        if(imag(theta3_inv)~=0)
            theta3_inv=2;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    end
    
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
%% 6. try thetaA: - -, 
%%        thetaB: - +
        sol=6.1
        thetaA_inv=atan2(-A(2,3),-A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        if(imag(theta3_inv)~=0)
            theta3_inv=2;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    
    end


elseif (abs(A(2,3))<0.05&&abs(A(1,3))<0.05)  %A(1,3)=A(2,3)=0, A(3,3) 1 or -1
     if (A(3,3)<0)
        thetaB_inv=0;
     else
        thetaB_inv=pi;
     end
     theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);
         if(abs(theta3_inv)>pi)
        theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
     theta4_inv=thetaB_inv-pi/2-theta3_inv;
     
     a=l2+l3*cos(theta3_inv);
     b=d3+d4;
     c=l1;
     U=2*a*c;
     V=2*b*c;
     W=A(1,4)^2+A(2,4)^2-a^2-b^2-c^2;
     T=V/(U+W)+( (V/(U+W))^2 - (W-U)/(W+U)  )^0.5;
     theta2_inv=atan(T)*2;

      U2=l2+l1*cos(theta2_inv)+l3*cos(theta3_inv);
      V2=d3+d4+l1*sin(theta2_inv);
      W2=A(1,4);
      if ((W2+U2)==0)
         thetaA_inv=-179*pi/180;
         theta1_inv=-89*pi/180;
         theta2_inv=-90*pi/180;
      else
         T2=V2/(U2+W2)+( (V2/(U2+W2))^2 - (W2-U2)/(W2+U2)  )^0.5;
         thetaA_inv=atan(T2)*2;
         theta1_inv=thetaA_inv-theta2_inv;
      end
      check=l2*sin(thetaA_inv)-(d3+d4)*cos(thetaA_inv)+l1*sin(theta1_inv)+d5*sin(thetaA_inv)*sin(thetaB_inv)+l3*sin(thetaA_inv)*cos(theta3_inv);
      if (abs(check-A(2,4))>15)           %y-position discrepancy
         U2=l2+l1*cos(theta2_inv)+l3*cos(theta3_inv);
         V2=d3+d4+l1*sin(theta2_inv);
         W2=A(1,4);
         T2=V2/(U2+W2)-( (V2/(U2+W2))^2 - (W2-U2)/(W2+U2)  )^0.5;
         thetaA_inv=atan(T2)*2;
         theta1_inv=thetaA_inv-theta2_inv;
      end
      if (A(3,3)<0)
         theta5_inv=thetaA_inv-atan2(A(2,1),A(1,1));
      else
         theta5_inv=atan2(-A(2,1),-A(1,1))-thetaA_inv; 
      end
            %% sol 2
      if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
          abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
            a=l2+l3*cos(theta3_inv);
            b=d3+d4;
            c=l1;
            U=2*a*c;
            V=2*b*c;
            W=A(1,4)^2+A(2,4)^2-a^2-b^2-c^2;     
            T=V/(U+W)-( (V/(U+W))^2 - (W-U)/(W+U)  )^0.5;
            theta2_inv=atan(T)*2;
            
            U2=l2+l1*cos(theta2_inv)+l3*cos(theta3_inv);
            V2=d3+d4+l1*sin(theta2_inv);
            W2=A(1,4);
            if ((W2+U2)==0)
               thetaA_inv=-179*pi/180;
               theta1_inv=-89*pi/180;
               theta2_inv=-90*pi/180;
            else
               T2=V2/(U2+W2)+( (V2/(U2+W2))^2 - (W2-U2)/(W2+U2)  )^0.5;
               thetaA_inv=atan(T2)*2;
               theta1_inv=thetaA_inv-theta2_inv;
            end
            check=l2*sin(thetaA_inv)-(d3+d4)*cos(thetaA_inv)+l1*sin(theta1_inv)+d5*sin(thetaA_inv)*sin(thetaB_inv)+l3*sin(thetaA_inv)*cos(theta3_inv);
            if (abs(check-A(2,4))>15)           %y-position discrepancy
                U2=l2+l1*cos(theta2_inv)+l3*cos(theta3_inv);
                V2=d3+d4+l1*sin(theta2_inv);
                W2=A(1,4);
                T2=V2/(U2+W2)-( (V2/(U2+W2))^2 - (W2-U2)/(W2+U2)  )^0.5;
                thetaA_inv=atan(T2)*2;
                theta1_inv=thetaA_inv-theta2_inv;
            end
            if (A(3,3)<0)
                theta5_inv=thetaA_inv-atan2(A(2,1),A(1,1));
            else
                theta5_inv=atan2(-A(2,1),-A(1,1))-thetaA_inv; 
            end
      end
      
else %If some of the other terms is 0
    %% 1 try thetaA: + +, 
    %%       thetaB: + -
    sol=1.2
    thetaA_inv=atan2(A(2,3),A(1,3));
    thetaB_inv=atan2((A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
    theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
    theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
    if(abs(theta3_inv)>pi)
        theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
    end
    theta4_inv=thetaB_inv-pi/2-theta3_inv;
    theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
    if(abs(theta1_inv)>pi)
        theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
    end
    theta2_inv=thetaA_inv-theta1_inv;
    
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
          
%% 2. try thetaA: - -, 
%%        thetaB: + -
        sol=2.2
        thetaA_inv=atan2(-A(2,3),-A(1,3));
        thetaB_inv=atan2((A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    end
        
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
%% 3. try thetaA: + +, 
%%        thetaB: - -
        sol=3.2
        thetaA_inv=atan2(-A(2,3),-A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
            theta4_inv=thetaB_inv-pi/2-theta3_inv;
        if(abs(theta4_inv)>pi)
            theta4_inv=theta4_inv-sign(theta4_inv)*2*pi;
        end
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    end
      
      %%
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
%% 4. try thetaA: - -, 
%%        thetaB: - -
        sol=4.2
        thetaA_inv=atan2(A(2,3),A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,-A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv; 
    end
    %%
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
    abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)

%% 5. try thetaA: + +, 
%%        thetaB: - +
        sol=5.2
        thetaA_inv=atan2(A(2,3),A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        if(imag(theta3_inv)~=0)
            theta3_inv=2;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    end
    
    if (abs(theta1_inv*180/pi)>61||abs(theta2_inv*180/pi)>61||...
        abs(theta3_inv*180/pi)>61||abs(theta4_inv*180/pi)>61)
%% 6. try thetaA: - -, 
%%        thetaB: - +
        sol=6.2
        thetaA_inv=atan2(-A(2,3),-A(1,3));
        thetaB_inv=atan2(-(A(1,3)^2+A(2,3)^2)^0.5,A(3,3));
        theta5_inv=atan2(-A(3,2),A(3,1));       %what if A(3,1) 0?
        theta3_inv=asin((A(3,4)-d1-d2+d5*cos(thetaB_inv))/l3);    %2 solutions
        if(abs(theta3_inv)>pi)
            theta3_inv=theta3_inv-sign(theta3_inv)*2*pi;
        end
        if(imag(theta3_inv)~=0)
            theta3_inv=2;
        end
        theta4_inv=thetaB_inv-pi/2-theta3_inv;
        theta1_inv=atan2(A(2,4)-l2*sin(thetaA_inv)+d4*cos(thetaA_inv)+d3*cos(thetaA_inv)-d5*sin(thetaA_inv)*sin(thetaB_inv)-l3*sin(thetaA_inv)*cos(theta3_inv),A(1,4)-l2*cos(thetaA_inv)-d3*sin(thetaA_inv)-d4*sin(thetaA_inv)-d5*cos(thetaA_inv)*sin(thetaB_inv)-l3*cos(theta3_inv)*cos(thetaA_inv));
        if(abs(theta1_inv)>pi)
            theta1_inv=theta1_inv-sign(theta1_inv)*2*pi;
        end
        theta2_inv=thetaA_inv-theta1_inv;
    
    end
end

if (theta5_inv>pi/2) %Adjust theta5 if it is over 90 or under -90
    theta5_inv=theta5_inv-pi;
elseif (theta5_inv<-pi/2)
    theta5_inv=theta5_inv+pi;
end
    


theta1_inv_deg=round(theta1_inv*180/pi)
theta2_inv_deg=round(theta2_inv*180/pi)
theta3_inv_deg=round(theta3_inv*180/pi)
theta4_inv_deg=round(theta4_inv*180/pi)
theta5_inv_deg=round(theta5_inv*180/pi)

theta1_deg=theta1_inv_deg;  theta1= (theta1_deg*pi)/180;
%17
theta2_deg=theta2_inv_deg;  theta2=(theta2_deg*pi)/180;
%-15
theta3_deg=theta3_inv_deg;  theta3=(theta3_deg*pi)/180;
%-48
theta4_deg=theta4_inv_deg;  theta4=((theta4_deg+90)*pi)/180;
%48
theta5_deg=theta5_inv_deg;  theta5=(theta5_deg*pi)/180;
%-17

l1=95; 
l2=100; 
l3=60; 
l4=0; 
l5=0;
d1=155;
d2=0;
d3=0;
d4=0;
d5=110;
alpha1=0;alpha2=pi/2;alpha3=0;alpha4=pi/2;alpha5=0;

A1=[cos(theta1) -sin(theta1)*cos(alpha1) sin(theta1)*sin(alpha1) l1*cos(theta1);
    sin(theta1) cos(theta1)*cos(alpha1) -cos(theta1)*sin(alpha1) l1*sin(theta1);
    0 sin(alpha1) cos(alpha1) d1; 0 0 0 1];

A2=[cos(theta2) -sin(theta2)*0 sin(theta2)*1 l2*cos(theta2);
    sin(theta2) cos(theta2)*0 -cos(theta2)*1 l2*sin(theta2);
    0 1 0 d2; 0 0 0 1];

A3=[cos(theta3) -sin(theta3)*cos(alpha3) sin(theta3)*sin(alpha3) l3*cos(theta3);
    sin(theta3) cos(theta3)*cos(alpha3) -cos(theta3)*sin(alpha3) l3*sin(theta3);
    0 sin(alpha3) cos(alpha3) d3; 0 0 0 1];

A4=[cos(theta4) -sin(theta4)*0 sin(theta4)*1 l4*cos(theta4);
    sin(theta4) cos(theta4)*0 -cos(theta4)*1 l4*sin(theta4);
    0 1 0 d4; 0 0 0 1];

A5=[cos(theta5) -sin(theta5)*cos(alpha5) sin(theta5)*sin(alpha5) l5*cos(theta5);
    sin(theta5) cos(theta5)*cos(alpha5) -cos(theta5)*sin(alpha5) l5*sin(theta5);
    0 sin(alpha5) cos(alpha5) d5; 0 0 0 1];

A=A1*A2*A3*A4*A5

if (theta1_deg<-90 || theta1_deg>90 || theta2_deg<-90 || theta2_deg>90)
    mayor=1
end