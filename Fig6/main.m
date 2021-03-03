
figure('Color','w');
set(gcf,'Unit','centimeters','OuterPosition',[0 0 10 10]);
set(gca,'FontName','Arial','FontSize',10)
hold on;

render_correlation_xi_LH_ADHD();

% % Export
% addpath('../../export_fig')
% export_fig(['Fig6.png'],'-nocrop','-r200')