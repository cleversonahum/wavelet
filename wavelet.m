%Lendo áudio, adicionando ruído e plotando gráficos
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

%Butterworth manual
fc = 800; %Frequência de Corte
[b, a] = butter(6,fc/(Fs/2));
freqz(b,a);
butter_noise = filter(b, a, noise);
butter_noise2 = filter(b, a, noise2);
butter_noise3 = filter(b, a, noise3);

%Butterworth usando FDA tools, o filtro gerado pelo FDA Tools nomeei de
%butterworth
% butter_noise = filter(butterworth, noise);
% butter_noise2 = filter(butterworth, noise2);
% butter_noise3 = filter(butterworth, noise3);

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

audiowrite('./audios/butter_noise.wav', butter_noise, Fs);
audiowrite('./audios/butter_noise2.wav', butter_noise2, Fs);
audiowrite('./audios/butter_noise3.wav', butter_noise3, Fs);

%Wavelet
figure(3);
%Aqui colocar o código chamando as funções e gráfico pra gerar a wavelet e
%comparar com o sinal com o ruído

% Wavelet de haar
[out,val,lev]=haardwt(noise,3); % Descendo 5 niveis.
%[vec]=hthreshold(out);
[wavnoise]=invhaardwt(out,val,lev);

[out,val,lev]=haardwt(noise2,3); % Descendo 5 niveis.
%[vec]=hthreshold(out);
[wavnoise2]=invhaardwt(out,val,lev);

[out,val,lev]=haardwt(noise3,3); % Descendo 5 niveis.
%[vec]=hthreshold(out);
[wavnoise3]=invhaardwt(out,val,lev);

%Áudio Original
subplot(4,2,1), plot(data);
grid;
title('Audio Original');

% 0 SNR
subplot(4,2,3), plot(noise);
grid;
title('Audio com Ruído 0 SNR');

subplot(4,2,4), plot(wavnoise);
grid;
title('Audio Filtrado Wavelet de haar 0 SNR');

% 10 SNR
subplot(4,2,5), plot(noise2);
grid;
title('Audio com Ruído 10 SNR');

subplot(4,2,6), plot(wavnoise2);
grid;
title('Audio Filtrado Wavelet de haar 10 SNR');

% -10 SNR
subplot(4,2,7), plot(noise3);
grid;
title('Áudio com Ruído -10 SNR');

subplot(4,2,8), plot(wavnoise3);
grid;
title('Audio Filtrado Wavelet de haar -10 SNR');

audiowrite('./audios/Wavelet_noise.wav', wavnoise, Fs);
audiowrite('./audios/Wavelet_noise2.wav', wavnoise2, Fs);
audiowrite('./audios/Wavelet_noise3.wav', wavnoise3, Fs);

%SNRs dos sinais
% snr_butter_noise = snr(data, butter_noise);
% snr_butter_noise2 = snr(data, butter_noise2);
% snr_butter_noise3 = snr(data, butter_noise3);
 snr_wav_noise = snr(data, wavnoise.');
% snr_wav_noise2 = snr(data, wavnoise2);
% snr_wav_noise3 = snr(data, wavnoise3);