clc;
clear all;
close all;

a=[1 0 1 1 0 1]
l=length(a);

amp = input('Enter the amplitude of carrier: ')
fc = input('Enter the frequency of carrier: ')

for i=1:l
    t=(i-1)*100+1:i*100;
    if a(1,i)==1 
        x1(t)=amp.*sin(2*pi*(fc)*t/100)     
    else
        x1(t)= 0
    end
end

plot(x1) 