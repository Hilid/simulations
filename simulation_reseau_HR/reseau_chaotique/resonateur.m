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
% Fonction calculant la matrice de transfert d'un résonateur a partir
% de la matrice de transfert de 2 guides et en considérant une paroi rigide de la cavité
%================================================================================
function matrice_trans_res = resonateur(w,Lcav,Lcol,Dcav,Dcol) 
parametres

matrice_resonateur = guide(w,Lcol,Dcol) * guide(w,Lcav,Dcav);    %modélisation du résonateur par 2 matrices de guides
Yresonateur = matrice_resonateur(2,1)/matrice_resonateur(1,1);				 %application de la condition limite : pression max, vitesse nulle au fond du résonateur.
matrice_trans_res = [ 1, 0 ; Yresonateur, 1];      						     %matrice du résonateur dans le réseau
 
endfunction

