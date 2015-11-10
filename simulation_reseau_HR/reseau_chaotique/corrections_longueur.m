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
%Charge le fichier se trouvant à l'emplacement "emplacement_data_reseau" (voir le fichier data.txt type pour le format)
%et applique les corrections de col de résonateurs usuels en acoustique

%Crée le fichier data_out.txt même si la simulation ne contient pas de résonateurs => necessaire dans tout les cas

%--------------------------------------------------------------------------------
clear all
close all


parametres                                                 %chargement des parametres de la simulation
parametres_reseau = load(emplacement_data_reseau);         %lecture du fichier de config du réseau
N = size(parametres_reseau)(1);

for i = 1:1:N                                              %calcul des longueurs de corrections et applications 
	if (parametres_reseau(i,1) == 2)

		Dcav = parametres_reseau(i,4);
		Dcol = parametres_reseau(i,5);
		
		Scav = pi*(Dcav/2)^2;
		Scol = pi*(Dcol/2)^2;
		
		RN = Dcol / 2;
		RC = Dcav / 2;
		RT = d_tube / 2;
		
		%Correction de longueur du col
		L1 = 0.82 * (1 - 1.35*RN/RC + 0.31*(RN/RC)^3) * RN; 
		L2 = 0.82 * (1- 0.235 * RN / RT - 1.32*(RN/RT)^2 + 1.54 * (RN/RT)^3 - 0.86*(RN/RT)^4)*RN;
		parametres_reseau(i,3) = parametres_reseau(i,3) + L1 + L2;
	end
end	

save './data_out.txt' parametres_reseau               %sauvegarde dans le fichier de donnees pour calcul_MRTA.m

