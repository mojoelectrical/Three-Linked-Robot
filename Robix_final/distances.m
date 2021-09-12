for i=1:size(objects,2)
    dist=zeros(size(objects(i).edge,1),1);
    for f=1:size(objects(i).edge,1)
        dist(f)= (  (objects(i).center(1)-objects(i).edge(f,1))^2+(objects(i).center(2)-objects(i).edge(f,2))^2    )^0.5;
    end
    objects(i).dist=dist;
    if ((max(dist)-min(dist))<5)
        objects(i).form='circle';
    else 
        if (~strcmp(objects(i).form,'marker'))
            objects(i).form='XXX';
        end
    end
end

    %%find corners
for c=1:size(objects,2)
    temp=objects(c).dist;
    for i=1:4
        [maxdist cornerNo]=max(temp);
        corner(i,:)=objects(c).edge(cornerNo,:);
        temp(cornerNo)=0;
        for k=1:15
            for l=1:15
                f=ismember(objects(c).edge,objects(c).edge(cornerNo,:)+[k-8 l-8],'rows');
                no=find(f==1);
                if (no~=0)
                    temp(no)=0;
                end
            end
        end
    end
    objects(c).corner=corner;
end




