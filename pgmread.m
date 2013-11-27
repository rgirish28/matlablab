function [X]=pgmread(filename)
%PGMREAD Read a PGM (Portable Gray Map) file from disk. Only binary 
%	encoded PGM images ((P5)are supported.  
%       [X]=PGMREAD('filename') reads the file 'filename' and returns
%       the indexed image X. If no extension is given for the filename,
%	the extension '.pgm' is assumed.
%
%       See also: PGMWRITE, BPMREAD, GIFREAD, HDFREAD, PCXREAD, 
%		  TIFFREAD, XWDREAD.
%
%       Marcelo Neira Eid  12/13/96
%	mne@puc.cl
%       Last revision: Mon Dec  9 15:24:45 PST 1996
 

if (nargin~=1)
        error('Requires a filename as an argumenty.');
end;
if (isstr(filename)~=1)
        error('Requires a string filename as an argument.');
end;
if (isempty(findstr(filename,'.'))==1)
        filename=[filename,'.pgm'];
end;

fid=fopen(filename,'rb');
if (fid==-1)
        error(['Error opening ',filename,' for input.']);
end;

aux=fgetl(fid);
if (strcmp(aux,'P5')==0)
fclose(fid)
error([filename, ' is not a valid PGM binary encoded image']);
end;

% Below the comments are stripped
comments=1;
while(comments)
aux=fgets(fid);
if (aux(1)~='#')
comments=0;
end;
end;

% Get the dimensions
[width height]=strtok(aux);
width=str2num(width);
height=str2num(height);

% This strip the number of grays information. Since we know they are 255
% a priori, there isn't need to capture this information
aux=fgets(fid);
X=fread(fid);
fclose(fid);
X=reshape(X,width,height);

% The image is transposed after the read. Also Matlab pixels
% start from 1 so we transpose the image and add 1 to it. 

X=X'+1;

