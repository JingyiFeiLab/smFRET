close all
parentDir = '/Users/reyer/Data/SunTag_Tracking/'; %This and line below define
newFile = 'suntag8418';             % where you want to save the images. Create a new folder
graph_title = 'GFP Intensity for mRNA ';
sample = 'sample1_5by5/mRNA/'; % Will save images in defined folder, sub-folder called "/mRNA"

% compareDir = strcat([parentDir,newFile]);
% sampleDir = strcat([compareDir,'/',sample]);
% if exist(compareDir,'dir')~=7
%     mkdir(parentDir, newFile)
% end
% 
% if exist(sampleDir,'dir')~=7
%     mkdir(compareDir, sample)
% end



    
for i = 1:num_mRNAs
    frames = mRNA_struct(i).Frames;
    gfp = mRNA_struct(i).GFP_Intensity;
    mrna = mRNA_struct(i).mRNA_Intensity;
    
    ylabels{1}='mRNA Intensity';
    ylabels{2}='GFP Intensity';
    [ax,hlines1,hlines2] = plotyy(frames,mrna,frames,gfp);
    cfig = get(gcf,'color');
    pos = [0.1  0.1  0.7  0.8];
    offset = pos(3)/5.5;
    set(hlines1,'LineWidth',6);
    set(hlines2,'LineWidth',6)
    set(hlines1,'Color','g')
    set(hlines2,'Color','b')
    set(get(ax(1),'ylabel'),'string',ylabels{1})
    set(get(ax(2),'ylabel'),'string',ylabels{2})
    set(ax,{'ycolor'},{'g';'b'})
    set(ax(1),'YLim',[0 2E5])
    set(ax(2),'YLim',[0 18E3])
    
    
    
    title(strcat([graph_title, num2str(i)]),'FontSize',32)
    xlabel('Frame','FontSize',24)
    set(ax(1),'FontSize',18)
    set(ax(2),'FontSize',18)
    %file1 = strcat([sampleDir,'mRNA',num2str(i)]);
    set(gcf,'position',[835,883,868,667])
    set(gcf,'PaperPositionMode','auto')
%     print(file1,'-painters','-depsc','-r0')
%     set(gcf,'PaperPositionMode','auto')
%     print(file1,'-dpng','-r0')
%     file1_fig = strcat([sampleDir,'mRNA',num2str(i),'.fig']);
%     savefig(gcf,file1_fig)
    close all
    
end
