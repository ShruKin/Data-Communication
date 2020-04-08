clc
close all;
clear all;

t=0:.001:1;

fm = input('Enter the value of frequency of message: ')
Am = input('Enter the value of amplitude of message: ')
ym = Am * cos(2*pi*fm*t)
subplot(3, 1, 1)
plot(t,ym)
ylabel('Message signal')

fc = input('Enter the value of frequency of carrier: ')
Ac = input('Enter the value of amplitude of carrier: ')
yc = Ac * cos(2*pi*fc*t)
subplot(3, 1, 2)
plot(t,yc)
ylabel('Carrier signal')

B = input('Enter modulation index: ')

Fmod = Ac.*cos(2*pi*fc*t + (B.*sin(2*pi*fm*t)))
subplot(3, 1, 3)
plot(t,Fmod)
ylabel('Frequency modulated signal')
