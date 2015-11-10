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
% Calcul de la matrice de transfert d'un guide d'onde (solution d'ondes planes)
%================================================================================
function matrice_trans_guide = guide(w,L,d)
parametres
R = d/2; %rayon du guide
S = pi*(R)^2;     %section du guide

[Zc k] = pertes(d,w);   % calcul de k et Zc avec la fonction perte

matrice_trans_guide =  [cos(k*L)  Zc*j*sin(k*L) ; (1/Zc)*j*sin(k*L) cos(k*L)];   

endfunction
