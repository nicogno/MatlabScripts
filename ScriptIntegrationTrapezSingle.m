% Script per integrazione tramite metodo dei trapezi di curve plottate (in
% questo esempio ci sono due linee e due assi y nella fig)

%Argomento (opzionale) indica quanti valori, a partire dall'ultimo
%nell'array, prendere per il calcolo dell'integrale (p. es. ultimi 10 s =
%10000 ms). Di default funzione calcola integrale su tutti i valori di x

function Q = ScriptIntegrationTrapezSingle(NoOfValues)
    
    fig = gcf;  %Handle alla figura
    axObjs = fig.Children;
    dataObjs = axObjs.Children;
    x = dataObjs(1).XData;
    y = dataObjs(1).YData;
    if isempty(NoOfValues)
        Q = trapz(x,y);
    else
        Q = trapz(x(end-10000:end),y(end-10000:end));
    end
    xLabel = axObjs.XAxis(1).Label.String;
    yLabel = axObjs.YAxis(1).Label.String;
    fprintf('%s integral over %s = %f\n',yLabel,xLabel,Q);