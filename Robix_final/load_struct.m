pic=imread(image);

pic_g=rgb2gray(pic);

medfilt_pic_g=medfilt2(pic_g,[3,3]); %%median filter 

th=120;         %%threshold value
bound=11;

pic_digital=medfilt_pic_g(125:400,1:600);
l=size(pic_digital,2);
h=size(pic_digital,1);

for i=1:h
    for j=1:l
        if (pic_digital(i,j)<th)
            pic_digital(i,j)=0;
        else
            pic_digital(i,j)=1;
        end
    end
end


%%detecting objects

pic_digital_obj=pic_digital;

for i=bound:h-bound
    for j=bound:l-bound
        if (pic_digital(i,j)==0&&(~pic_digital(i-1,j-1)||~pic_digital(i-1,j)||...
                ~pic_digital(i-1,j+1)||~pic_digital(i,j-1)||~pic_digital(i,j+1)...
                ||~pic_digital(i+1,j-1)||~pic_digital(i+1,j)||~pic_digital(i+1,j+1)))
            pic_digital_obj(i,j)=2; 
        end
    end
end

%%detect parts and connect pixels of the same object
pic_parts=pic_digital_obj;

objno=2;

for i=bound:h-bound
    for j=bound:l-bound

        if (pic_parts(i,j)==2)
            objno=objno+1;
            pic_parts(i,j)=objno;
            for k=i:h-bound
                for m=j:l-bound
                    f=0;
                    for o=k-5:k+5
                        for p=m-5:m+5
                            if (pic_parts(o,p)==objno)
                                f=1;
                            end
                        end
                    end

                    if (pic_digital_obj(k,m)==2&&f)
                         pic_parts(k,m)=objno;
                    end
                end
                for m1=bound:j
                    f=0;
                    for o=k-5:k+5
                        for p=j-m1+bound-5:j-m1+bound+5
                            if (pic_parts(o,p)==objno)
                                f=1;
                            end
                        end
                    end
                    if ((pic_digital_obj(k,j-m1+bound)==2)&&f)
                        pic_parts(k,j-m1+bound)=objno;
                    end
                end
            end
        end
    end
end