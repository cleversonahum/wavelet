[data,Fs]=audioread('./audios/Sadness_and_Sarrada.wav');
subplot(2,2,1),plot (data);
grid;
title('Espectro do Audio original');
noise=awgn(data,0,'measured'); %adição de ruido.
subplot(2,2,2),plot(noise);
grid;
title('Espectro do Audio com ruido de SNR 0');
noise2=awgn(data,10,'measured');
subplot(2,2,3),plot(noise2);
grid;
title('Espectro do Audio com ruido de SNR 10');
noise3=awgn(data,-10,'measured');
subplot(2,2,4),plot(noise3);
grid;
title('Espectro do Audio com ruido de SNR -10');

audiowrite('./audios/audio_noise.wav', noise, Fs);
audiowrite('./audios/audio_noise2.wav', noise2, Fs);
audiowrite('./audios/audio_noise3.wav', noise3, Fs);

% sound(data,Fs);
% sound(noise,Fs);
% sound(noise2,Fs);
% sound(noise3,Fs);