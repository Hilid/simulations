%This program is free software; you can redistribute it and/or
%modify it under the terms of the GNU General Public License
%as published by the Free Software Foundation; either version 2
%of the License, or (at your option) any later version.

%This program is distributed in the hope that it will be useful,
%but WITHOUT ANY WARRANTY; without even the implied warranty of
%MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
%GNU General Public License for more details.

%You should have received a copy of the GNU General Public License
%along with this program; if not, write to the Free Software
%Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301, USA.
% autor: Thomas lechat, thomalechat@hotmail.fr
%================================================================================
% Code pour le post_traitement des donnees fournies par calcul_MRTA.m
% La bande frequentielle d'affichage est renseignée dans parametres.m
%================================================================================
clear all
close all
clc

parametres   % chargement des parametres
data = load('data_out.txt');

Fmax = 500;

% chargement de R, T, A
R = data.R;
T = data.T;
A = data.A; 

% calcul du vecteur des fréquences
f = data.w ./(2*pi);

% impédance carac du réseau avec perte
Zc = data.Zc;

%====================================================================
% Affichage des courbes
%====================================================================
%Affichage du coefficient de reflexion
%--------------------------------------------------------------
figure(1)
subplot(2,1,1);
plot(f,abs(R));
axis([0 Fmax 0 1.5]);
ylabel('abs(R)');
title('Coefficient de reflexion a l entree du reseau')
grid on

%Affichage du coefficient de transmission
%--------------------------------------------------------------
figure(1)
subplot(2,1,2);
plot(f,abs(T(1,1,:)));
axis([Fmin Fmax 0 1.1]);
ylabel('abs(T)');
title('Coefficient de transmission a l entree du reseau');

%Affichage de l'absorption
%-----------------------------------------------
figure(2)
plot(f,abs(T),'b', 'Linewidth',3);
hold on
plot(f,abs(R),'r', 'Linewidth',3);
hold on
plot(f,A,'k');
legend('Transmission','Reflexion','Absorption');
axis([Fmin Fmax 0 1.1]);
grid on

