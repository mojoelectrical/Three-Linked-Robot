carrying=0;
for i=2:size(objects,2)
        pick=0;
        if strcmp(objects(i).type,'full')
            warning=0;
            A=objects(i).A;
            Inverse_22_11;
            if(abs(theta_1_u)>1400||abs(theta_2_u)>1400||abs(theta_3_u)>1400||... %Check if the values are right
               abs(theta_4_u)>1400||abs(theta_5_u)>1400||~isreal(theta_1_u)||...
               ~isreal(theta_2_u)||~isreal(theta_4_u)||~isreal(theta_3_u)||...
               ~isreal(theta_5_u))||warning==1;
               warning=1;
               fprintf('Warning, object number %i  is out of the workspace\n',objects(i).objNo);
            else
                pick=1;
                objectnumb=i;       %%ERASE! just to check errors
                pick_place;         %Pick the object
                carrying=1;
                for j=2:size(objects,2)
                    if strcmp(objects(j).type,'target')&&strcmp(objects(i).form,objects(j).form)
                        warning=0;
                        A=objects(j).A;
                        Inverse_22_11;
                        objectnumb=j; %%ERASE! just to check errors
                        if(abs(theta_1_u)>1400||abs(theta_2_u)>1400||abs(theta_3_u)>1400||... %Check if the values are right
                           abs(theta_4_u)>1400||abs(theta_5_u)>1400||~isreal(theta_1_u)||...
                           ~isreal(theta_2_u)||~isreal(theta_4_u)||~isreal(theta_3_u)||...
                           ~isreal(theta_5_u))||warning==1;
                            warning=1;
                            fprintf('Warning, target number %i  is out of the workspace\n',objects(j).objNo);

                        else
                            pick=0;
                            pick_place;         %Place the object
                            carrying=0;
                        end
                    end
                end
            end
        end
        if carrying
            if objectnumb==i   %%ERASE! just to check errors
                objectnumb=0;  %%ERASE! just to check errors
                fprintf('Warning, there is no target detectd for object number %i\n',objects(i).objNo);
            end                %%ERASE! just to check errors
            pick=0;
            theta_1_u=-1400;          %%If the related target is not on workspace
            theta_2_u=0;          %%drop the object outside
            pick_place;         %Place the object
            carrying=0;
        end
end