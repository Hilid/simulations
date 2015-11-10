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
% Calcul de la matrice de transfer globale du réseau en fonction des matrices
%de transferts de chaques éléments.

% Calcul des coefficients d'absorption, transmission et reflexion du réseau a partir du formalisme
% matriciel de theorie des lignes. Voir "guides des guides d'onde acoustique", le cours de Jean-Pierre Dalmont, LAUM

% Les pertes viscothermiques sont prisent en compte par défaut. (pour cas sans perte, modifier pertes.m)
%================================================================================
clear all
close all
clc

parametres

data = load('data_out.txt');
pr = data.parametres_reseau;    % chargement des parametres du reseau avec correction
N = size(pr)(1);   % nombre d'elements du réseau



%Base fréquentielle
w = 2*pi*linspace(Fmin,Fmax,Nf);

%=================================================================================================================
%Calcul des coefficients de la matrice
reseau = ones(2,2,Nf);		               % création de la matrice du transfert pour chaques frequences
Zc = ones(1,1,Nf);                         % impedance caracteristique du reseau


for x=1:1:Nf                               % bouclage en frequence
	reseau(:,:,x) = eye(2);
	[Zc(1,1,x) b] = pertes(d_tube,w(x));

	for y=1:1:N                            %calcul de la matrice de transfert pour 1 frequence

		if (pr(y,1) == 1)
				reseau(:,:,x) = reseau(:,:,x)*guide(w(x),pr(y,2),d_tube);
		else
				reseau(:,:,x) = reseau(:,:,x)*resonateur(w(x),pr(y,2),pr(y,3),pr(y,4),pr(y,5));		
		end
	end	
end


%====================================================================================================
%calcul de R, T, A (coefficient d'absorption reflexion transmission)

%coefficient de la matrice de transfert du réseau
A = reseau(1,1,:);
B = reseau(1,2,:);
C = reseau(2,1,:);
D = reseau(2,2,:);

%calcul de R, T, A
R = (A + B./Zc - C.*Zc - D)./(A + C.*Zc + B./Zc + D);
T = 2./(A + C.*Zc + B./Zc + D);
A=1-abs(T).^2 -abs(R).^2;

%====================================================================================================
% sauvegarde des données interessantes dans data_out.txt pour post_traitement.m
save './data_out.txt' reseau Zc w R T A -append
