scale=50/68;
a_1=min(objects(1).edge(:,1));    %%10;
b_1=min(objects(1).edge(:,2));    %%120;
Q_rm=[-1 0 0 285;
       0 -1 0 135;
       0 0 1 0;
       0 0 0 1];
   
for i=2:size(objects,2)
    
%     if(~strcmp(objects(i).form,'cube')&&~strcmp(objects(i).form,'quader'))
    
    objects(i).A=Q_rm*[1 0 0 scale*(objects(i).center(1)-a_1);
                       0 -1 0 scale*(objects(i).center(2)-b_1);
                       0 0 -1 10;
                       0 0 0 1];

%     else
%         ang=(objects(i).angle-90)*pi/180;
%     objects(i).A=Q_rm*[sin(ang) cos(ang) 0 scale*(objects(i).center(1)-a_1);
%                        -cos(ang) sin(ang) 0 scale*(objects(i).center(2)-b_1);
%                        0 0 -1 10;
%                        0 0 0 1];
%     end

end