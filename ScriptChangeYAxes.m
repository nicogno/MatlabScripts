% - Script che permette di definire i limiti degli assi per figure con due
% assi Y (argomenti sono estremi asse sx e asse dx, in questo ordine).
% - Passare argomenti ([], []) se non si intendono variare gli estremi di un
% asse.
% - Prima di lanciare lo script occorre selezionare la figura di interesse

function ScriptChangeYAxes(y11, y12, y21, y22)
    
    ax=gca;
    
    if isempty(y11) || isempty(y12)
        set(ax.YAxis(1),'Limits',ax.YAxis(1).Limits);
    else
        set(ax.YAxis(1),'Limits',[y11 y12]);
    end
    
    if isempty(y21) || isempty(y22)
        set(ax.YAxis(2),'Limits',ax.YAxis(2).Limits);
    else
        set(ax.YAxis(2),'Limits',[y21 y22]);
    end
    