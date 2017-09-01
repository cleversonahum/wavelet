[data,Fs]=audioread('./audios/Sadness_and_Sarrada.wav');
figure(1);
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

%Butterworth
figure(2);
butter_noise = filter(butterworth, noise);
butter_noise2 = filter(butterworth, noise2);
butter_noise3 = filter(butterworth, noise3);

%Áudio Original
subplot(4,2,1), plot(data);
grid;
title('Audio Original');

% 0 SNR
subplot(4,2,3), plot(noise);
grid;
title('Audio com Ruído 0 SNR');

subplot(4,2,4), plot(butter_noise);
grid;
title('Audio Filtrado Butterworth 0 SNR');

% 10 SNR
subplot(4,2,5), plot(noise2);
grid;
title('Audio com Ruído 10 SNR');

subplot(4,2,6), plot(butter_noise2);
grid;
title('Audio Filtrado Butterworth 10 SNR');

% -10 SNR
subplot(4,2,7), plot(noise3);
grid;
title('Áudio com Ruído -10 SNR');

subplot(4,2,8), plot(butter_noise3);
grid;
title('Audio Filtrado Butterworth -10 SNR');