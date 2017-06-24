function [pop, avaliaPop] = EDS(AVALIA_FObj, pop,numGer, probCruz, F,maxmin)
    avaliaPop = AVALIA_FObj(pop)
    min(avaliaPop)
    max(avaliaPop)
    numPop = size(pop,1);
    for g = 1:numGer
        x(g) = g;
        for i = 1:numPop
            ind = pop(i,:);
            fprintf('Indivíduo/Avaliação: %d/%0.2f\n',i,avaliaPop(1,i));
            %pause
            % Selecionar aleatoriamente três indivíduos em pop, r1, r2 e r3
            % Sendo que r1<>r2<>r3<>i(ind)
            indSele = randperm(numPop);
            for k = 1:3
                if (indSele(k) == i)
                    indSele(k) = indSele(k+3);
                    r(k,:) = pop(indSele(k),:);
                else
                    r(k,:) = pop(indSele(k),:);
                end
            end
            fprintf('r1 = %d\nr2 = %d\nr3 = %d\n',indSele(1),indSele(2),indSele(3));
            %pause
            % selecionar aleatoriamente uma variável do indivíduo ind: varInd
            varInd = randi(2);
            fprintf('Variável do indivíduo selecionada: %d\n',varInd);
            %pause
            for j = 1:length(ind)
                probAlea = rand(1);
                fprintf('Probabilidade sorteada: %0.2f\n',probAlea);
                if (probAlea <= probCruz || j == varInd)
                    trial(j) = r(1,j)+F*(r(2,j)-r(3,j));
                else
                    trial(j) = ind(j);
                end
            end
            %pause
            avaliaTrial = AVALIA_FObj(trial);
            fprintf('Avaliação trial: %0.2f\n',avaliaTrial);
            fprintf('Avaliação indivíduo: %0.2f\n',avaliaPop(1,i));
            
            if( maxmin == 'min')
                if (avaliaTrial < avaliaPop(1,i))
                    ind = trial;
                    pop(i,:) = ind;
                    avaliaPop(1,i) = avaliaTrial;
                   disp('Troca indivíduo');
                else
                    disp('Não troca');
                end 
                y(g) = min(avaliaPop);
            end
            if (maxmin == 'max')
                if (avaliaTrial > avaliaPop(1,i))
                    ind = trial;
                    pop(i,:) = ind;
                    avaliaPop(1,i) = avaliaTrial;
                   disp('Troca indivíduo');
                else
                    disp('Não troca');
                end 
                y(g) = max(avaliaPop);
            end
        end
        figure(1);
        plot(x,y);
        drawnow
    end
end