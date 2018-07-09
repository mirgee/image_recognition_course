function RedrawField
        %Redraw player paddle
        set(ppaddle,'XData',playerpaddlexdat)
        set(ppaddle,'YData',playerpaddleydat)
        %Redraw com paddle
        set(cpaddle,'XData',compaddlexdat)
        set(cpaddle,'YData',compaddleydat)
        %Redraw ball
        set(ball,'Position',[ballpos(1)-ballradius,...
                             ballpos(2)-ballradius,...
                             2*ballradius,2*ballradius])
        drawnow
    end