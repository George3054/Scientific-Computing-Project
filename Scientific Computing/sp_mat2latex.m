function [val,row_ip,col_ip]=sp_mat2latex(A,sp_type)
% Author : G. LEKKAS , AM 1067430 , Date : 27/11/2021
    format = [];
    textsize = [];

%CSC:   
    
    if strcmp(sp_type,'csc')
     K=sparse(A);
     [row_num,col_id,values]=find(K);
     meg=size(col_id);
     val = values;
     row_idx = row_num;
     k=1;
     col_ip=zeros();
        for i=1:meg-1
            if i==1
                col_ip(k)=i;% theloume na apothikeusoyme to proto stoixeio toy pinaka poy ua paramenei panta to idio.
                k=k+1;
            end
            if col_id(i)~= col_id(i+1)% me thn entoli ayth anagnorizetai h allagi grammis kai h epakolouthh ayxisi tou metrhth. 
                col_ip(k)=i+1;
                k=k+1;
            end
            if col_id(i)==col_id(meg)%epithimoume na apothkeusoyme kai to teleytaio stoixeio toy pinaka.
                col_ip(k)=meg+1;
            end
        end

     col_ip=col_ip();% vazei tis ektipomenes times mesa se pinaka.
     col_ip=col_ip().';% emfanizei to dianysma se morfh grammis
     
    end

%CSR:

    if strcmp(sp_type,'csr')
     A_tposematrix=A.';
     J=sparse(A_tposematrix);
     [col_num,row_id,values]=find(J);
     meg_1=size(row_id);
     val = values;
     col_idx = col_num;
     k=1;
     row_ip=zeros();
        for i=1:meg_1-1
            if i==1
                row_ip(k)=i; % theloume na apothikeusoyme to proto stoixeio toy pinaka poy ua paramenei panta to idio.
                k=k+1;
            end
            if row_id(i)~= row_id(i+1) % me thn entoli ayth anagnorizetai h allagi grammis kai h epakolouthh ayxisi tou metrhth. 
                row_ip(k)=i+1;
                k=k+1;
            end
            if row_id(i)==row_id(meg_1)
                row_ip(k)=meg_1+1; %epithimoume na apothkeusoyme kai to teleytaio stoixeio toy pinaka.
            end
        end
        row_ip = row_ip(); % vazei tis ektipomenes times mesa se pinaka.
        row_ip=row_ip().';% emfanizei to dianysma se morfh grammis
    end

    
   
%xeirismos arxeiou latex:

fprintf( '\\documentclass{article}\n');
fprintf( '\\begin{document}\n');
%
%val
width = size(val);
fprintf(' $$ val = \\begin{tabular}{|');
for j=1:width
  if(~isempty(val))
        fprintf( 'l|');
  end      
end
fprintf( '}');
fprintf( '\\hline\r');

for w=1:width
     if isnumeric(val)
             fprintf('%s &',num2str(val(w)));
     end
end
fprintf( '   \\hline\r');
fprintf( '\\end{tabular}$$\r');
%

%IA csr morfi:

if strcmp(sp_type,'csr')
  width1= size(col_idx);  
  fprintf(' $$ IA = \\begin{tabular}{|');
  for d=1:width1
    if(~isempty(col_idx))
         fprintf( 'l|');
    end
  end
  fprintf( '}');
  fprintf( '\\hline\r');
  for w=1:width1
     if isnumeric(col_idx)
             fprintf('%s &',num2str(col_idx(w)));
     end
  end
  fprintf( '   \\hline\r');
  fprintf( '\\end{tabular}$$\r');
%
%JA csr morfi:

  width2= size(row_ip);
  fprintf(' $$ JA = \\begin{tabular}{|');
  for n=1:width2
    if(~isempty(row_ip))
         fprintf( 'l|');
    end
  end
  fprintf( '}');
  fprintf( '\\hline\r');
  for w=1:width2
     if isnumeric(row_ip)
             fprintf('%s &',num2str(row_ip(w)));
     end
  end
  fprintf( '   \\hline\r');
  fprintf( '\\end{tabular}$$\r');
end

%IA csc morfi:

if strcmp(sp_type,'csc')
  widthh= size(row_idx);  
  fprintf(' $$ IA = \\begin{tabular}{|');
  for e=1:widthh
    if(~isempty(row_idx))
         fprintf( 'l|');
    end
  end
  fprintf( '}');
  fprintf( '\\hline\r');
  for w=1:widthh
     if isnumeric(row_idx)
             fprintf('%s &',num2str(row_idx(w)));
     end
  end
  fprintf( '   \\hline\r');
  fprintf( '\\end{tabular}$$\r');
  
  %JA csc morfi:
  
  widthh1= size(col_ip);
  fprintf(' $$ JA = \\begin{tabular}{|');
  for n=1:widthh1
    if(~isempty(col_ip))
         fprintf( 'l|');
    end
  end
  fprintf( '}');
  fprintf( '\\hline\r');
  for w=1:widthh1
     if isnumeric(col_ip)
             fprintf('%s &',num2str(col_ip(w)));
     end
  end
  fprintf( '   \\hline\r');
  fprintf( '\\end{tabular}$$\r');
end

    fprintf( '\\end{document}\n');
end