[file,path,~]=uigetfile (
{"*.bmp;*.png;*.jpg","Image files"},"Pilih gambar");
filepath=strcat(path,file);
img=imread(filepath);
key="";
det=0;
do
  do
    key=inputdlg ("Input key:","Input",1);
    if size(key{1,1},2)>9;errordlg("Key too long (max 9 chars)","Key Too Long");endif
  until size(key{1,1},2)<=9
  key=javaMethod("format","java.lang.String","%-9s",key);
  key=double(reshape(key,3,3));
  det=detmod(key,256);
  if det==0;errordlg("Key does not have inverse, input another","No Inverse");endif
until det!=0

