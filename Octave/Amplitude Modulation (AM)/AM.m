clc
close all;
clear all;

t=0:.001:1;

fm = input('Enter the value of frequency of message: ')
Am = input('Enter the value of amplitude of message: ')
ym = Am * cos(2*pi*fm*t)
subplot(5, 1, 1)
plot(t, ym)
ylabel('Message signal')
xlabel('Time')

fc = input('Enter the value of frequency of carrier: ')
Ac = input('Enter the value of amplitude of carrier: ')
yc = Ac * cos(2*pi*fc*t)
subplot(5, 1, 3)
plot(t, yc)
ylabel('Carrier signal')
xlabel('Time')

Amod = (Ac+ym).*cos(2*pi*fc*t)
subplot(5, 1, 5)
plot(t, Amod)
ylabel('Amplitude modulated signal')
xlabel('Time')