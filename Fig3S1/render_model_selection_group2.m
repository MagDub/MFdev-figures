
function [] = render_model_selection_group2(ybounds, increment)
    
    % Data
    load('../data_for_figs_2/model_cv.mat')
    
    model_cv(model_cv(:,1)<200 | model_cv(:,1)>300,:)=[];
    
    n = size(model_cv,1);
    n_mod = size(model_cv,2)-1;

    for model = 2:size(model_cv,2)
       mean_all(model-1) = mean(model_cv(:,model))*100;
       stderror_all(model-1) = std(model_cv(:,model))/(sqrt(size(model_cv(:,model),1)))*100; 
       number_par_all(model-1) = size(model_cv(:,model),1);
    end

    % Legend

    legend_all{1} = 'thompson';
    legend_all{2} = 'thompson + \epsilon';
    legend_all{3} = 'thompson + \eta';
    legend_all{4} = 'thompson + \epsilon + \eta';

    legend_all{5} = 'UCB';
    legend_all{6} = 'UCB + \epsilon';
    legend_all{7} = 'UCB + \eta';
    legend_all{8} = 'UCB + \epsilon + \eta';

    legend_all{9} = 'hybrid';
    legend_all{10} = 'hybrid + \epsilon';
    legend_all{11} = 'hybrid + \eta';
    legend_all{12} = 'hybrid + \epsilon + \eta';

    % Figure
    
    cols(1,:) = [0.803921580314636 0.878431379795074 0.968627452850342]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.39215686917305 0.474509805440903 0.635294139385223]; 

    x = 1:size(mean_all,2)+2;
    x =[x(1:1+3), x(6:6+3), x(11:11+3)];

    I=[ 1 2 3 4 5 6 7 8 9 10 11 12];

    b = bar(x,mean_all(I),'FaceColor',cols(1,:),'BarWidth',.7);  hold on;
    
    text(x([4])+0.25,mean_all(I(4))+0.4,['1^{st}'],'vert','bottom','horiz','center','FontName','Arial','Fontweight','bold','FontSize',12); 
    text(x([8])+0.25,mean_all(I(8))+0.4,['2^{nd}'],'vert','bottom','horiz','center','FontName','Arial','Fontweight','bold','FontSize',12);
    text(x([12])+0.25,mean_all(I(12))+0.4,['3^{rd}'],'vert','bottom','horiz','center','FontName','Arial','Fontweight','bold','FontSize',12);
    box off

    bw = bar(x(4),mean_all(4),'FaceColor',cols(3,:),'BarWidth',.7);   

    h = errorbar(x,mean_all(I),stderror_all(I)/sqrt(n),stderror_all(I)/sqrt(n),'.','color','k');       
    set(h,'Marker','none')
    
    c=plot(0:x(end)+1,1/3*100*ones(size(0:x(end)+1)),'Color',cols(2,:),'LineWidth',1, 'LineStyle', ':');

    legend([bw],{'Winning model'}, 'Location','NorthEast','FontSize',12);
    legend boxoff 
    
    ylabel({'Held-out data likelihood [%]'},'FontName','Arial','Fontweight','bold','FontSize',12);
    set(gca,'YTick',0:increment:100)
    ylim(ybounds)

    xticks(x)
    xticklabels(legend_all);
    set(gca,'box','off')

    xtickangle(45)

    % Number and title
    text(0-0.15, 1+0.18,'b','Units', 'Normalized', 'VerticalAlignment', 'Top','FontSize', 26)
    t=title('Early adolescents','FontSize', 18, 'FontName','Arial', 'Fontweight','normal');

end


