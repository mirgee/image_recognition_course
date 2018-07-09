    ScreenSize=get(0,'ScreenSize');
    global ball ppaddle cpaddle
    goal2win=5;
    windowsize=[1024,560];
    fieldlength=200;
    fieldwidth=100;
    goalwidth=50;
    paddlespeed=1;
    paddlebouncevelratio=1.1;
    playerpaddlepos=[-0.4*fieldlength,0];
    playerpaddlespeed=0;
    playerpaddlexdat=[];
    playerpaddleydat=[];
    playerpaddlethickness=2.5;
    playerpaddlelength=20;
    compaddlepos=[0.4*fieldlength,0];
    compaddlexdat=[];
    compaddleydat=[];
    compaddlethickness=2.5;
    compaddlelength=20;
    ballradius=4;
    ballinitspeed=1;
    balldirection=(rand*2*pi())-pi();
    ballpos=[0,0];
    ballvel=[ballinitspeed*cos(balldirection),...
             ballinitspeed*sin(balldirection)];
    framedelay=0.01;
    centermousepos=[0.5*(ScreenSize(3)-windowsize(1))+...
                    0.1*windowsize(1)+...
                    0.08*windowsize(1),...
                    0.5*(ScreenSize(4)-windowsize(2))+...
                    0.15*windowsize(2)+...
                    0.4*windowsize(2)];
    currentmousepos=centermousepos;
    lastmousepos=centermousepos;
    playstat=0;
    pausestat=0;
    resetstat=0;
    winstat=0;
    playerscore=0;
    comscore=0;
    myPos = [centermousepos];
function DrawField
        %Setting plot parameter
        axis equal
        axis([-0.5*fieldlength,0.5*fieldlength,...
              -0.5*fieldwidth 0.5*fieldwidth])
        axis off
        hold on
        %Drawing field
        rectangle('Position',[-0.5*fieldlength,-0.5*fieldwidth,...
                              fieldlength,fieldwidth],...
                  'FaceColor','g',...
                  'LineStyle','none')
        %Drawing field line
        line([-0.5*fieldlength,-0.5*fieldlength,...
              0.5*fieldlength,0.5*fieldlength],...
             [0.5*goalwidth,0.5*fieldwidth,...
              0.5*fieldwidth,0.5*goalwidth],...
             'LineWidth',5,...
             'Color','w')
        line([-0.5*fieldlength,-0.5*fieldlength,...
              0.5*fieldlength,0.5*fieldlength],...
             [-0.5*goalwidth,-0.5*fieldwidth,...
              -0.5*fieldwidth,-0.5*goalwidth],...
             'LineWidth',5,'Color','w')
        line([0,0],[-0.5*fieldwidth,0.5*fieldwidth],...
             'LineWidth',2.5,'Color','w')
        rectangle('Position',[-0.25*fieldwidth,-0.25*fieldwidth,...
                              0.5*fieldwidth,0.5*fieldwidth],...
                  'Curvature',[1,1],...
                  'LineWidth',2.5,...
                  'EdgeColor','w')
        %Drawing player paddle
        ppaddle=patch(0,0,'b');
        %Drawing com paddle
        cpaddle=patch(0,0,'r');
        %Drawing ball
        ball=rectangle('Curvature',[1,1],'FaceColor','y');
    end