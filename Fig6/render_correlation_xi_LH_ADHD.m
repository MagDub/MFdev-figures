
function [] = render_correlation_xi_LH_ADHD()

    % Data

    load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/xi_mean.mat')
    load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/age.mat')
    load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/conners.mat')
    load('/Users/magdadubois/GoogleDrive/UCL/writing/MF_dev/data_for_figs_2/part_num.mat')

    part_num = part_num';

    x=conners;
    y=xi_mean;

    xlimmin = 37;
    xlimmax = 92;

    ylimmin = 0;
    ylimmax = 1.02;


    % age groups
    idx_group1 = find(part_num(1,:)<200);
    idx_group2 = [find(part_num(1,:)==201) : (find(part_num(1,:)==301)-1)];
    idx_group3 = [find(part_num(1,:)==301) : size(part_num,2)];

    % Plot

    cols(1,:) = [1 1 1]; 
    cols(2,:) = [0 57 94]/255; % Color chance level 
    cols(3,:) = [0.729411780834198 0.831372559070587 0.95686274766922]; 
    cols(4,:) = [0.494117647409439 0.494117647409439 0.494117647409439]; 

    f=figure('Color','w');
    set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
    set(gca,'FontName','Arial','FontSize',10)
    hold on

    plot(x,y, 'o','MarkerFaceColor','w','MarkerEdgeColor','w'); hold on; %invisible
    hold on
    l = lsline ; %%% regression line
    set(l,'LineWidth', 1.5, 'Color',cols(4,:))

    % with color code
    g1=plot(x(idx_group1),y(idx_group1), 'o','MarkerFaceColor',cols(1,:),'MarkerEdgeColor',cols(2,:),'MarkerSize',5, 'LineWidth', 0.7); hold on;
    g2=plot(x(idx_group2),y(idx_group2), 'o','MarkerFaceColor',cols(3,:),'MarkerEdgeColor',cols(2,:),'MarkerSize',5, 'LineWidth', 0.7); hold on;
    g3=plot(x(idx_group3),y(idx_group3), 'o','MarkerFaceColor',cols(2,:),'MarkerEdgeColor',cols(2,:),'MarkerSize',5, 'LineWidth', 0.7); hold on;
    ylabel('\fontsize{16} \epsilon{\fontsize{12}-greedy parameter}','FontName','Arial','Fontweight','bold','FontSize',12);
    xlabel('ADHD score','FontName','Arial','Fontweight','bold','FontSize',12);

    plot(70*ones(1,4),-1:2,':', 'Color', cols(2,:));

    xlim([xlimmin xlimmax])
    ylim([ylimmin ylimmax])

    [rho, pval] = corr(x,y, 'rows','complete', 'Type','Pearson');

    annotation('textbox',...
        [0.771660777385158 0.672039660056663 0.0421540047114274 0.154863078375827],...
        'String',{['r=' num2str(round(rho,2)); 'p=' num2str(round(pval,2))]},...
        'LineStyle','none',...
        'FontName','Arial',...
        'FontSize',14,...
        'FitBoxToText','off');

    % Title
    title({'Correlation between value-free','random exploration and ADHD'},'FontSize', 14, 'FontName','Arial', 'Fontweight','normal');

end
