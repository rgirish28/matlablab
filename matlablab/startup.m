warning off;

if ispc

	addpath l:\courses\COMP61011\labtools\libsvm;
	addpath l:\courses\COMP61011\labtools\entropy;
	addpath l:\courses\COMP61011\labtools\tools;
	rmpath('c:\Program Files\MATLAB\R2009a\toolbox\bioinfo\biolearning');

elseif isunix

	addpath /opt/info/courses/COMP61011/labtools/libsvm;
	addpath /opt/info/courses/COMP61011/labtools/entropy;
	addpath /opt/info/courses/COMP61011/labtools/tools;
	rmpath /opt/matlab/toolbox/bioinfo/biolearning;
	
end

warning on;

disp('Your path is now setup for COMP61011.');
disp('You will need to reexecute this command each time you restart Matlab.');
disp('Alternatively, copy this file into your working directory.');
