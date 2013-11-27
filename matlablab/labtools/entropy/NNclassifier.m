
function digit = NNclassifier (TestImage, Vecs, Mean, Projec0, Projec1 
,Projec2,Projec3,Projec4,Projec5,Projec6,Projec7,Projec8,Projec9)
% This classifier, uses a given test image from the test space
% we need to project the test sample into digit's 1,2,3,4,5,6,7,8,9,0 space
% individually thant we get the euclidean distance
%
% finally find the minimal distance to specify the digit for the test case
%
    testsample = TestImage(1,:);
    test = testsample - Mean(1,:);
    ProjT0 = Vecs(:,:,1)'*test;
    test = testsample - Mean(:,2);
    ProjT1 = Vecs(:,:,2)'*test;
    test = testsample - Mean(:,3);
    ProjT2 = Vecs(:,:,3)'*test;
    test = testsample - Mean(:,4);
    ProjT3 = Vecs(:,:,4)'*test;
    test = testsample - Mean(:,5);
    ProjT4 = Vecs(:,:,5)'*test;
    test = testsample - Mean(:,6);
    ProjT5 = Vecs(:,:,6)'*test;
    test = testsample - Mean(:,7);
    ProjT6 = Vecs(:,:,7)'*test;
    test = testsample - Mean(:,8);
    ProjT7 = Vecs(:,:,8)'*test;
    test = testsample - Mean(:,9);
    ProjT8 = Vecs(:,:,9)'*test;
    test = testsample - Mean(:,10);
    ProjT9 = Vecs(:,:,10)'*test;
    for i=1:20
        a0(i) = norm(ProjT0 - Projec0(:,i));
        a1(i) = norm(ProjT1 - Projec1(:,i));
        a2(i) = norm(ProjT2 - Projec2(:,i));
        a3(i) = norm(ProjT3 - Projec3(:,i));
        a4(i) = norm(ProjT4 - Projec4(:,i));
        a5(i) = norm(ProjT5 - Projec5(:,i));
        a6(i) = norm(ProjT6 - Projec6(:,i));
        a7(i) = norm(ProjT7 - Projec7(:,i));
        a8(i) = norm(ProjT8 - Projec8(:,i));
        a9(i) = norm(ProjT9 - Projec9(:,i));
    end 
    minv(1) = min(a0);
    minv(2) = min(a1);
    minv(3) = min(a2);
    minv(4) = min(a3);
    minv(5) = min(a4);
    minv(6) = min(a5);
    minv(7) = min(a6);
    minv(8) = min(a7);
    minv(9) = min(a8);
    minv(10) = min(a9);
    mm = min(minv);
    digit = find (minv==mm) - 1