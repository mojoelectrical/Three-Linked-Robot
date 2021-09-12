f=1;
objects=struct('objNo',2);
for st=3:objno
    [a b]=find(pic_parts==st);
    d=size(find(pic_parts==st),1);
    if (d>300)                           %% no pixels to be detected as object
        objects(f).objNo=f;
        objects(f).pix=[a,b];
        objects(f).pixSize=d;
        f=f+1;
    end
end

NoObjects=size(objects,2);

for i=1:NoObjects
    a=objects(i).pix;
    min_r=min(a(:,1));
    max_r=max(a(:,1));
    min_c=min(a(:,2));
    max_c=max(a(:,2));
    objects(i).frame=pic_parts(min_r-5:max_r+5,min_c-5:max_c+5);
 
    g=round((max_r-min_r)/2);
    b=size(objects(i).frame,2);
    sw=0;
    for j=1:b-1
        if (objects(i).frame(g,j)~=objects(i).frame(g,j+1))
            sw=1+sw;
        end
        objects(i).switches=sw;
        if (objects(i).switches==2)
            objects(i).type='full';
        else
            objects(i).type='target';

        end
    end
end


