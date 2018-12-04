function s = OX (p1, p2, x1, x2)
%p1 = Padre 1
%p2 = Padre 2
%x1 = Punto 1
%x2 = Punto 2

    assert((length(p1)==length(p2)), "Los padres han de ser del mismo tamaño");
    assert((x1 < x2), "El primer punto ha de ser menor que el segundo");
    
    p(1,:) = p1;
    p(2,:) = p2;

    s(1,:) = zeros(1,length(p1));
    s(2,:) = zeros(1,length(p1));
    
    s(1, x1:x2) = p(1,x1:x2);
    s(2, x1:x2) = p(2,x1:x2);
    
    posicionesAllenar = [x2+1:length(p1) 1:(x1-1)];

    for i=1:2
        ultimaPos = mod(x2,length(p1))+1;
        for posicion = posicionesAllenar
        iContraria = mod(i,2)+1;
        busqueda = find(p(iContraria,ultimaPos) == s(i,:));
        
        while (~isempty(busqueda))
           ultimaPos = mod(ultimaPos,length(p1))+1; 
           busqueda = find(p(iContraria,ultimaPos) == s(i,:)); 
        end
           s(i,posicion) = p(iContraria,ultimaPos);
    end
    
end