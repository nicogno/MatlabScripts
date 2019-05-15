% Script per integrazione tramite metodo dei trapezi di curve plottate (in
% questo esempio ci sono due linee e due assi y nella fig)

%Argomento (opzionale) indica quanti valori, a partire dall'ultimo
%nell'array, prendere per il calcolo dell'integrale (p. es. ultimi 10 s =
%10000 ms). Di default funzione calcola integrale su tutti i valori di x

function [Q1, Q2] = ScriptIntegrationTrapezDouble(NoOfValues)
    
    fig = gcf;  %Handle alla figura
    axObjs = fig.Children;
    %dataObjs = axObjs.Children;
    dataObjs = findobj(fig,'-property','YData');% utile per trovare proprietà
    x1 = dataObjs(1).XData;
    y1 = dataObjs(1).YData; %Oggetto 1 è y axis di destra
    x2 = dataObjs(2).XData;
    y2 = dataObjs(2).YData; %y axis sinistra
    if isempty(NoOfValues)
        Q1 = trapz(x1,y1);  %integrale 1, destra
        Q2 = trapz(x2,y2);  %integrale 2, sinistra
    else
        Q1 = trapz(x1(end-10000:end),y1(end-10000:end));  %integrale 1, destra
        Q2 = trapz(x2(end-10000:end),y2(end-10000:end));  %integrale 2, sinistra
    end
    xlabel = axObjs.XAxis(1).Label.String;
    ylabel2 = axObjs.YAxis(1).Label.String;
    ylabel1 = axObjs.YAxis(2).Label.String;
    fprintf('%s integral over %s = %f, %s integral over %s = %f\n',ylabel1,xlabel,Q1,ylabel2,xlabel,Q2);