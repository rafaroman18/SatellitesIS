function s = PMX (p1, p2, x1, x2)
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
    
    s(1, x1:x2) = p(2,x1:x2);
    s(2, x1:x2) = p(1,x1:x2);

    interchanges(1,:) = s(1,x1:x2);
    interchanges(2,:) = s(2,x1:x2);

    posicionesAllenar = find(s(1,:) == 0);
    
    for posicion = posicionesAllenar
        for i=1:2
            iContraria = mod(i,2)+1;
            candidato = p(i,posicion);
            busqueda = find(candidato == s(i,:));
            
            if isempty(busqueda)
                s(i,posicion) = candidato;
            else
                while (~isempty(busqueda))
                   candidato = interchanges(iContraria, find(candidato == interchanges(i,:)));
                   busqueda  = find(candidato == s(i,:));
                end
                   s(i,posicion) = candidato;
            end
            
            
        end
    end
    
end