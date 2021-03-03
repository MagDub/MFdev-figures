figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 36 12]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,3,1)
ybounds = [37 51];
increment = 4;
render_model_selection_group1(ybounds, increment);

subplot(1,3,2)
ybounds = [37 51];
increment = 4;
render_model_selection_group2(ybounds, increment);

subplot(1,3,3)
ybounds = [37 51];
increment = 4;
render_model_selection_group3(ybounds, increment);

%Export
addpath('../../export_fig')
export_fig(['Fig3S1.png'],'-nocrop','-r200')