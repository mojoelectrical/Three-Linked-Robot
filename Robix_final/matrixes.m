theta1_deg=26;  theta1= (theta1_deg*pi)/180;
%17
theta2_deg=-78;  theta2=(theta2_deg*pi)/180;
%-15
theta3_deg=-49;  theta3=(theta3_deg*pi)/180;
%-48
theta4_deg=-41;  theta4=((theta4_deg+90)*pi)/180;
%48
theta5_deg=-51;  theta5=(theta5_deg*pi)/180;
%-17

l1=95; 
l2=100; 
l3=60; 
l4=0; 
l5=0;
d1=155%%80;
d2=0%%-20;
d3=0%%25;
d4=0%%-35;
d5=110%%75;
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

m1=-165/2800;
m2=-9/140;
m3=-9/140;
m4=17/280;
m5=-9/165;
b1=0;
b2=5;
b3=0;
b4=0;
b5=-20;
theta_1_u=(theta1_deg-b1)/m1
theta_2_u=(theta2_deg-b2)/m2
theta_3_u=(theta3_deg-b3)/m3
theta_4_u=(theta4_deg-b4)/m4
theta_5_u=(theta5_deg-b5)/m5



