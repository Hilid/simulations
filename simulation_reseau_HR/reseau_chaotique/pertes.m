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
% Calcul des pertes viscothermiques (modification de la constante de propagation k du réseau et 
% de l'impédance caractéristique du réseau.

% Pour une simulation sans pertes, decommenter les lignes 39 40
%-----------------------------------------------------------------------------------------------
function [Zc k] = pertes(d,w);
parametres
R = d/2; 									% Rayon du tube considéré
S = pi*(R)^2;    

Pr = 0.708;                                        % nombre de Prandtl a la pression atmosphérique           a 300°K
mu = 1.85 * 10^-5;                                 % viscosité de l'air		                                a 300°K
gamma = 1.4;                               	      % heat capacity ratio of air
ksi = sqrt(Pr);
delta = sqrt(2 * mu / (rho * w));            	  % viscous boundary layer thickness
s = R /delta;
beta = (1-i)/sqrt(2);

%Cas avec pertes
Zc = rho * c / S * (1 + beta /s * (1 - (gamma - 1)/ksi));
k = w / c * (1 + beta /s * (1 + (gamma - 1)/ksi));

%Cas sans pertes
%Zc = rho*c/S;
%k = w/c;

endfunction
