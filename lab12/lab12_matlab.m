a = [2 2 3 0]; b = [1 4];
W = tf(b, a); % Create transfer function
%% 1.2 
[p, z] = pzmap(W);
%% 1.3
[mag, phase, w] = bode(W);
A = mag(1, :)'; phi = phase(1, :)';
csvwrite('../data/bode.csv', [w, mag(1, :)', 20*log10(mag(1, :)'), phase(1, :)']);
%% 1.4
nyquist(W);
%% Feedback
clear;
a = [2 2 3 0]; b = [1 4]; K = 0.55;
W = tf(b, a); F = feedback(W, K);
%% 2.1
r = rlocus(W);
Re1 = real(r(1, :))'; Re2 = real(r(2, :))'; Re3 = real(r(3, :))';
Im1 = imag(r(1, :))'; Im2 = imag(r(2, :))'; Im3 = imag(r(3, :))';
csvwrite('../data/rlocus.csv', [Re1, Im1, Re2, Im2, Re3, Im3]);
%% 2.3
[p, z] = pzmap(F);
%% 2.4
S = stepinfo(F, 'SettlingTimeThreshold', 0.05);
[y, t] = step(F);
%csvwrite('../data/step.csv', [t, y]);
%[delta, t] = impulse(F);
%csvwrite('../data/impulse.csv', [t, delta]);