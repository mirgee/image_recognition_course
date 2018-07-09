function pressfcn(~,event)
        switch event.Key
            case 'w'
                playerpaddlespeed=paddlespeed;
            case 's'
                playerpaddlespeed=-paddlespeed;
            case 'z'
                pausestat=1-pausestat;
                if pausestat==0
                    lastmousepos(1)=centermousepos(1);
                    lastmousepos(2)=centermousepos(2)+...
                                    (0.8*windowsize(2)*...
                                     playerpaddlepos(2)/...
                                     fieldwidth);
                    currentmousepos=lastmousepos;
                    set(0,'PointerLocation',currentmousepos)
                end
            case 'x'
                resetstat=1;
            case 'c'
                playstat=0;
        end
    end