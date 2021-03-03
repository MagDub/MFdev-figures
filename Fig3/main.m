figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 24 12]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

subplot(1,2,1)
ybounds = [37 45];
increment = 2;
render_model_selection(ybounds, increment);

subplot(1,2,2)
render_param_recovery();

% Export
addpath('../../export_fig')
export_fig(['Fig3.png'],'-nocrop','-r200')