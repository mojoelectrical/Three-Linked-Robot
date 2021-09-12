for i=1:size(objects,2)
    corner=objects(i).corner;
    objects(i).cornerDist(1)=((corner(1,1)-corner(2,1))^2+(corner(1,2)-corner(2,2))^2)^0.5;
    objects(i).cornerDist(2)=((corner(1,1)-corner(3,1))^2+(corner(1,2)-corner(3,2))^2)^0.5;
    objects(i).cornerDist(3)=((corner(1,1)-corner(4,1))^2+(corner(1,2)-corner(4,2))^2)^0.5;
    objects(i).cornerDist(4)=((corner(2,1)-corner(3,1))^2+(corner(2,2)-corner(3,2))^2)^0.5;
    objects(i).cornerDist(5)=((corner(2,1)-corner(4,1))^2+(corner(2,2)-corner(4,2))^2)^0.5;
    objects(i).cornerDist(6)=((corner(3,1)-corner(4,1))^2+(corner(3,2)-corner(4,2))^2)^0.5;

    if((objects(i).cornerDist(1)<15||objects(i).cornerDist(2)<15||...
        objects(i).cornerDist(3)<15||objects(i).cornerDist(4)<15||...
        objects(i).cornerDist(5)<15||objects(i).cornerDist(6)<15)&&~strcmp(objects(i).form,'circle')&&~strcmp(objects(i).form,'marker'))
        objects(i).form='triangle';
    else
        if (~strcmp(objects(i).form,'circle')&&~strcmp(objects(i).form,'marker'))
            objects(i).form='quader';
        end
        temp=objects(i).cornerDist;
        d=zeros(1,2);
        edgeLength=zeros(4,1);
        objects(i).lines=zeros(4,2);
        for m=1:4 
            [a,b]=min(temp);
            
            edgeLength(m)=a;
            
            switch b
             case 1 
                 d=polyfit([corner(1,2),corner(2,2)],[corner(1,1),corner(2,1)],1);
             case 2 
                 d=polyfit([corner(1,2),corner(3,2)],[corner(1,1),corner(3,1)],1);
             case 3 
                 d=polyfit([corner(1,2),corner(4,2)],[corner(1,1),corner(4,1)],1);
             case 4 
                 d=polyfit([corner(2,2),corner(3,2)],[corner(2,1),corner(3,1)],1);
             case 5 
                 d=polyfit([corner(2,2),corner(4,2)],[corner(2,1),corner(4,1)],1);
             case 6 
                d=polyfit([corner(3,2),corner(4,2)],[corner(3,1),corner(4,1)],1);
            end
            temp(b)=100000;
            objects(i).lines(m,:)=d;
            objects(i).edgeLength=edgeLength;
        end
        objects(i).edgeLength=edgeLength;
        p=max(edgeLength)-min(edgeLength);
        if (strcmp(objects(i).form,'quader')&&p<10)
            objects(i).form='cube';
        end

    end   
end

for i=1:size(objects,2)
    if (strcmp(objects(i).form, 'triangle')&&strcmp(objects(i).type,'target'))
        dist=objects(i).dist;
        q=max(dist);
        no=size(objects(i).dist,1);
        counter=0;
        for k=1:no 
            if (dist(k)>q-4)
                counter=counter+1;
            end
        end
        if (counter>no/2)
            objects(i).form='circle'; 
        end
    end
end    






for i=1:size(objects,2)
    
    
    if(strcmp(objects(i).form,'triangle'))
    if (size(objects(i).frame,1)>60||size(objects(i).frame,2)>60)
    objects(i).form='quader';
    end
    end
    

    
        [maxL maxNo]=max(objects(i).edgeLength);
   if (~isempty(maxL))

    if ((maxL>40)&&(~strcmp(objects(i).form,'marker')))        %%Lenggth of Rectangle
        objects(i).form='quader';
    end
    if (strcmp(objects(i).form,'quader')||strcmp(objects(i).form,'cube'))
    objects(i).angle=atan2(objects(i).lines(maxNo,1),1)*180/pi;
    end
   end
end