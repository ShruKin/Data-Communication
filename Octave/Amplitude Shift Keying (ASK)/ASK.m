clc
close all;
clear all;

t=0:.001:1;

amp = input('Enter the amplitude of message and carrier: ')

fm = input('Enter the frequency of the message: ')
ym = amp/2.*square(2*pi*fm*t) + amp/2
subplot(3, 1, 1)
plot(t, ym)
ylabel('Message signal')

fc = input('Enter the frequency of sine carrier: ')
yc = amp.*sin(2*pi*fc*t)
subplot(3, 1, 2)
plot(t, yc)
ylabel('Carrier signal')

ASK = yc.*ym
subplot(3, 1, 3)
plot(t, ASK)
ylabel('Amplitude Shift Keyed signal')
