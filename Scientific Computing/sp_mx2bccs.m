function [val,brow_idx,bcol_ptr]=sp_mx2bccs(A,nb)
% Author : G. LEKKAS , AM 1067430 , Date : 5/12/2021
group=size(A,1)/nb;
grp=size(A,2)/nb;
C=cell(grp,group);
i=1;
%diaspasi tou pinaka A se cells
for k=1:group
    idr = (1:nb)+(k-1)*nb;
    for j=1:grp
      ider = (1:nb)+(j-1)*nb;
      C{i}=A(ider,idr);
      i=i+1;  
    end    
end
%dhmiourgia pinaka val:
f=1;
val=zeros();
for x=1:grp
    for y=1:group
       for h=1:nb
           for g=1:nb
               if nnz(C{y,x})>=1
                   val(f)=C{y,x}(h,g);
                   f=f+1; 
               end  
           end 
       end
    end
end


%dhmiourgia pinaka brow_idx:
i=1;
brow_idx=zeros();
for x=1:grp
    for y=1:group
        if nnz(C{y,x})>=1
            brow_idx(i)=y;
            i=i+1;
        end
    end
end


%dhmiourgia pinaka bcol_ptr:(vgazei lanthansmeno apotelesma!)

R=reshape(val,nb^2,[]);
bcol_ptr=zeros();

k=1;
    for x=1:grp
       for y=1:group
                    if nnz(C{y,x})>=1 
                        isequal(C{y,x},R(k,:));
                            bcol_ptr(j)=k;
                            j=j+1;
                            
                    end   
                      
       end
    end 
 
































