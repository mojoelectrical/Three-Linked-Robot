for i=1:size(objects,2)
    pixel=objects(i).pix;
    xc=round(sum(pixel(:,1))/size(pixel,1));
    yc=round(sum(pixel(:,2))/size(pixel,1));
    objects(i).center=[xc,yc];
    f=0;
    for j=1:size(pixel,1)
        if (pixel(j,:)==objects(i).center)
            f=1;
        end
    end
    if (strcmp(objects(i).type,'full')&&~f)
        objects(i).form='marker';
    end
end
