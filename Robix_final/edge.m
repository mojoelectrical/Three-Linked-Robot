for c=1:size(objects,2)
    k=1;
    pixel=objects(c).pix;
    for i=1:size(pixel,1)
        h=0;
        if (~ismember((pixel(i,:)+[-1 -1]), pixel,'rows')||~ismember((pixel(i,:)+[-1 0]), pixel,'rows')||...
            ~ismember((pixel(i,:)+[-1 1]), pixel,'rows')||~ismember((pixel(i,:)+[0 -1]), pixel,'rows')||...
            ~ismember((pixel(i,:)+[0 1]), pixel,'rows')||~ismember((pixel(i,:)+[1 -1]), pixel,'rows')||...
            ~ismember((pixel(i,:)+[1 0]), pixel,'rows')||~ismember((pixel(i,:)+[1 1]), pixel,'rows'))
            h=1;
        else
            h=0;
        end
        if (h)
             objects(c).edge(k,:)=objects(c).pix(i,:);
             k=k+1;
        end
    end
end
