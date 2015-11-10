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
% Fichier regroupant tout les parametres de la simulation pour une plus 
% grande facilité de manipulation
%================================================================================

% Emplacement du fichier decrivant la geometrie du réseau
emplacement_data_reseau = './data.txt';

%Parametre du guide d'onde
d_tube = 0.1;      % diametre du tube en metre

%Parametres du fluide considéré
c = 340;           % célérité du son dans le milieu en m.s^-2
rho = 1.177;       % masse volumique de l'air a  300°K   en kg.m^-3

% Parametre de l'analyse (calcul fait entre Fmin et Fmax pour Nf points)
Fmin = 100;
Fmax=3000;
Nf = 200; 

%Parametres d'affichage dans le post_traitement (affichage des courbes entre Fmina et Fmaxa)
Fmina = 125;   
Fmaxa = 525;

