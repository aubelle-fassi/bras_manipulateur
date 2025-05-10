%calcul des coordonnées articulaires des 3 premières articulations
function [q1, q2, q3, isPossible] = geometrie_inverse(x, y, z, L1, L2, L3)
   
    
    isPossible = true;

    % Calcul de q1 (rotation horizontale autour de z)
    q1 = atan2(y, x);

    % Projection sur le plan (r, s)
    r = sqrt(x^2 + y^2);   
    s = z - L1;            

    %validité de la cible
    D = (r^2 + s^2 - L2^2 - L3^2) / (2 * L2 * L3);

    if abs(D) > 1
        isPossible = false;
        q1 = NaN; q2 = NaN; q3 = NaN;
        return
    end

    % Calcul de q3 
    q3 = atan2(sqrt(1 - D^2), D); % Coude vers le haut
    % q3 = atan2(-sqrt(1 - D^2), D); % Coude vers le bas 

    % Calcul de q2
    phi1 = atan2(s, r);
    phi2 = atan2(L3 * sin(q3), L2 + L3 * cos(q3));
    q2 = phi1 - phi2;

end

