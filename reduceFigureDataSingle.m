% - Script che riduce dati in una figura agli ultimi NoOfValues (p. es. ultimi 10000 ms)
% e restituisce figura con dimensione ridotta salvata con nuovo nome.
% - La figura deve avere 1 asse Y

function reduceFigureDataSingle(NoOfValues)
    fig = gcf;  %Handle alla figura
    axObjs = fig.Children;
    dataObjs = axObjs.Children;
    x = dataObjs(1).XData;
    y = dataObjs(1).YData;
    FileName = fig.FileName;
    FigName = fig.Name;
    xLabel = axObjs.XAxis(1).Label.String;
    yLabel = axObjs.YAxis(1).Label.String;
    Title = axObjs.Title.String;
    
    %Genero nuova figura con vecchi labels
    figure(), set(gcf,'Name',FigName); title(Title);
    plot(x(end-NoOfValues:end), y(end-NoOfValues:end)); ylabel(yLabel); xlabel(xLabel);
    savefig(gcf,strcat(erase(FileName,'.fig'),date,'.fig')); %Salvo con vecchio nome + data