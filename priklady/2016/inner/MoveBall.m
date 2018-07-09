function MoveBall
        if (ballpos(2)>=((0.5*fieldwidth)-ballradius))||...
           (ballpos(2)<=(ballradius-(0.5*fieldwidth)))
            %Defining ball movement when it hits upper or lower limit
            ballvel(2)=-ballvel(2);
        elseif ballpos(1)<=(ballradius-(0.5*fieldlength))
            %Defining ball movement when it hits left limit
            if (ballpos(2)>ballradius-0.5*goalwidth)&&...
               (ballpos(2)<0.5*goalwidth-ballradius)
                %Reseting ball and paddles due to COM goal
                balldirection=(rand*2*pi())-pi();
                ballpos=[0,0];
                ballvel=[ballinitspeed*cos(balldirection),...
                         ballinitspeed*sin(balldirection)];
                playerpaddlepos=[-0.4*fieldlength,0];
                set(0,'PointerLocation',centermousepos)
                lastmousepos=centermousepos;
                compaddlepos=[0.4*fieldlength,0];
                %Updating score
                comscore=comscore+1;
                set(comscorebox,'String',num2str(comscore))
                set(highlightbox,'Visible','On')
                set(highlightbox,'String','Goal for COM!')
                pause(1)
                set(highlightbox,'Visible','Off')
                %Checking for winner
                if playerscore==goal2win
                    winstat=1;
                elseif comscore==goal2win
                    winstat=2;
                else
                    winstat=0;
                end
            else
                ballvel(1)=-ballvel(1);
            end
        elseif ballpos(1)>=((0.5*fieldlength)-ballradius)
            %Defining ball movement when it hits right limit
            if (ballpos(2)>ballradius-0.5*goalwidth)&&...
               (ballpos(2)<0.5*goalwidth-ballradius)
                %Reseting ball and paddles due to player goal
                balldirection=(rand*2*pi())-pi();
                ballpos=[0,0];
                ballvel=[ballinitspeed*cos(balldirection),...
                         ballinitspeed*sin(balldirection)];
                playerpaddlepos=[-0.4*fieldlength,0];
                set(0,'PointerLocation',centermousepos)
                lastmousepos=centermousepos;
                compaddlepos=[0.4*fieldlength,0];
                %Updating score
                playerscore=playerscore+1;
                set(playerscorebox,'String',num2str(playerscore))
                set(highlightbox,'Visible','On')
                set(highlightbox,'String','Goal for P1!')
                pause(1)
                set(highlightbox,'Visible','Off')
                %Checking for winner
                if playerscore==goal2win
                    winstat=1;
                elseif comscore==goal2win
                    winstat=2;
                else
                    winstat=0;
                end
            else
                ballvel(1)=-ballvel(1);
            end
        elseif (inpolygon(ballpos(1),ballpos(2),...
                          [playerpaddlexdat(1)-ballradius,...
                           playerpaddlexdat(2)+ballradius,...
                           playerpaddlexdat(3)+ballradius,...
                           playerpaddlexdat(4)-ballradius],...
                          [playerpaddleydat(1)-ballradius,...
                           playerpaddleydat(2)-ballradius,...
                           playerpaddleydat(3)+ballradius,...
                           playerpaddleydat(4)+ballradius]))
            %Defining ball movement when it hits player paddles
            ballvel(1)=-ballvel(1);
            %Increasing ball speed
            ballvel=paddlebouncevelratio*ballvel;
            if (inpolygon(ballpos(1)+ballvel(1),ballpos(2)+ballvel(2),...
                          [playerpaddlexdat(1)-0.5*ballradius,...
                           playerpaddlexdat(2)+0.5*ballradius,...
                           playerpaddlexdat(3)+0.5*ballradius,...
                           playerpaddlexdat(4)-0.5*ballradius],...
                          [playerpaddleydat(1)-0.5*ballradius,...
                           playerpaddleydat(2)-0.5*ballradius,...
                           playerpaddleydat(3)+0.5*ballradius,...
                           playerpaddleydat(4)+0.5*ballradius]))
                %Anticipating side paddle impact
                ballvel=-ballvel;
            elseif ballvel(1)>0
                %Deflecting ball movement based on frontal impact position
                ballspeed=norm(ballvel);
                deflect=interp1q([playerpaddleydat(2)-ballradius,...
                                  playerpaddleydat(3)+ballradius]',...
                                  [0.05*pi(),0.95*pi()]',ballpos(2));
                ballvel(1)=ballspeed*cos(deflect-0.5*pi());
                ballvel(2)=ballspeed*sin(deflect-0.5*pi());
            end
        elseif (inpolygon(ballpos(1),ballpos(2),...
                          [compaddlexdat(1)-ballradius,...
                           compaddlexdat(2)+ballradius,...
                           compaddlexdat(3)+ballradius,...
                           compaddlexdat(4)-ballradius],...
                          [compaddleydat(1)-ballradius,...
                           compaddleydat(2)-ballradius,...
                           compaddleydat(3)+ballradius,...
                           compaddleydat(4)+ballradius]))
            %Defining ball movement when it hits player paddles
            ballvel(1)=-ballvel(1);
            %Increasing ball speed
            ballvel=paddlebouncevelratio*ballvel;
            if (inpolygon(ballpos(1)+ballvel(1),ballpos(2)+ballvel(2),...
                          [compaddlexdat(1)-0.5*ballradius,...
                           compaddlexdat(2)+0.5*ballradius,...
                           compaddlexdat(3)+0.5*ballradius,...
                           compaddlexdat(4)-0.5*ballradius],...
                          [compaddleydat(1)-0.5*ballradius,...
                           compaddleydat(2)-0.5*ballradius,...
                           compaddleydat(3)+0.5*ballradius,...
                           compaddleydat(4)+0.5*ballradius]))
                %Anticipating side paddle impact
                ballvel=-ballvel;
            elseif ballvel(1)<0
                %Deflecting ball movement based on frontal impact position
                ballspeed=norm(ballvel);
                deflect=interp1q([compaddleydat(2)-ballradius,...
                                  compaddleydat(3)+ballradius]',...
                                 [0.95*pi(),0.05*pi()]',ballpos(2));
                ballvel(1)=ballspeed*cos(deflect+0.5*pi());
                ballvel(2)=ballspeed*sin(deflect+0.5*pi());
            end
        end
        ballpos=ballpos+ballvel;
        set(speedbox,'String',num2str(norm(ballvel)))
    end
    %End of MoveBall