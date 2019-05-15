% - Script che riduce dati in una figura agli ultimi NoOfValues (p. es. ultimi 10000 ms)
% e restituisce figura con dimensione ridotta salvata con nuovo nome.
% - La figura deve avere 2 assi Y

function reduceFigureDataDouble(NoOfValues)
    fig = gcf;  %Handle alla figura
    dataObjs = findobj(fig,'-property','YData');% utile per trovare proprietà
    x1 = dataObjs(1).XData;
    y1 = dataObjs(1).YData; %Oggetto 1 è y axis di destra
    x2 = dataObjs(2).XData;
    y2 = dataObjs(2).YData; %y axis sinistra
    FileName = fig.FileName;
    FigName = fig.Name;
    axObjs = fig.Children;
    xLabel = axObjs.XAxis(1).Label.String;
    ylabelLeft = axObjs.YAxis(1).Label.String;
    ylabelRight = axObjs.YAxis(2).Label.String;
    Title = axObjs.Title.String;
    
    %Genero nuova figura con vecchi labels
    figure(), set(gcf,'Name',FigName); title(Title);
    yyaxis left; plot(x2(end-NoOfValues:end), y2(end-NoOfValues:end)); ylabel(ylabelLeft); xlabel(xLabel);
    yyaxis right; plot(x1(end-NoOfValues:end), y1(end-NoOfValues:end)); ylabel(ylabelRight);
    savefig(gcf,strcat(erase(FileName,'.fig'),date,'.fig')); %Salvo con vecchio nome + data