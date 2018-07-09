function MoveComPaddle
        %Following ball movement
        if compaddlepos(2)<ballpos(2)
            compaddlepos(2)=compaddlepos(2)+((0.5+(rand*0.5))*paddlespeed);
        elseif compaddlepos(2)>ballpos(2)
            compaddlepos(2)=compaddlepos(2)-((0.5+(rand*0.5))*paddlespeed);
        end
        %Preventing paddle to go off screen
        if compaddlepos(2)>=0.5*(fieldwidth-compaddlelength)
            compaddlepos(2)=0.5*(fieldwidth-compaddlelength);
        elseif compaddlepos(2)<=-0.5*(fieldwidth-compaddlelength)
            compaddlepos(2)=-0.5*(fieldwidth-compaddlelength);
        end
        compaddlexdat=[compaddlepos(1)-0.5*compaddlethickness,...
                       compaddlepos(1)+0.5*compaddlethickness,...
                       compaddlepos(1)+0.5*compaddlethickness,...
                       compaddlepos(1)-0.5*compaddlethickness];
        compaddleydat=[compaddlepos(2)-0.5*compaddlelength,...
                       compaddlepos(2)-0.5*compaddlelength,...
                       compaddlepos(2)+0.5*compaddlelength,...
                       compaddlepos(2)+0.5*compaddlelength];
    end