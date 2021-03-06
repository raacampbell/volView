function buildFigureWindow(obj)
    % Set up the figure window
    obj.hFig = figure;
    obj.hFig.CloseRequestFcn = @obj.windowCloseFcn;
    obj.hFig.ToolBar='none';
    obj.hFig.MenuBar='none';

    obj.hAx = axes('position',[0,0.2,1,0.8]);

    FigPos = obj.hFig.Position;
    obj.slider_Pos = [50 50 FigPos(3)-100+1 20];
    obj.Stxt_Pos = [50 70 FigPos(3)-100+1 15];

    obj.BtnStPnt = FigPos(3)-210+1;
    if obj.BtnStPnt < 360
        obj.BtnStPnt = 360;
    end

    obj.Btn_Pos = [obj.BtnStPnt 20 80 20];
    obj.ChBx_Pos = [obj.BtnStPnt+90 20 100 20];


    obj.hSlider = uicontrol(gcf,'Style', 'slider','Min',1,'Max',1,'Position', obj.slider_Pos);
    obj.listeners{end+1} = addlistener(obj.hSlider, 'Value', 'PostSet', @obj.SliceSlider);

    buttonStyle={'Style', 'pushbutton', 'FontSize', 10};
    obj.hButton_rangeReset = uicontrol(buttonStyle{:},'Position', obj.Btn_Pos,'String','Reset W/L', 'Callback' , @obj.rangeReset);
    obj.hButton_View(1) = uicontrol(buttonStyle{:},'BackgroundColor',[1,0.75,0.75],'Position', obj.VAxBtn_Pos,'String','1', 'Callback' , @obj.switchView);
    obj.hButton_View(2) = uicontrol(buttonStyle{:},'BackgroundColor',[0.75,1,0.75],'Position', obj.VSgBtn_Pos,'String','2', 'Callback' , @obj.switchView);
    obj.hButton_View(3) = uicontrol(buttonStyle{:},'BackgroundColor',[0.75,0.75,1],'Position', obj.VCrBtn_Pos,'String','3', 'Callback' , @obj.switchView);

    obj.hCheckBox = uicontrol('Style', 'checkbox','Position', obj.ChBx_Pos,'String','Fine Tune', 'BackgroundColor', [0.8 0.8 0.8], 'FontSize', 10);

    obj.hText_Level = uicontrol('Style', 'text','Position', obj.Ltxt_Pos,'String','Level: ', 'BackgroundColor', [0.8 0.8 0.8], 'FontSize', 10);
    obj.hText_Window = uicontrol('Style', 'text','Position', obj.Wtxt_Pos,'String','Window: ', 'BackgroundColor', [0.8 0.8 0.8], 'FontSize', 10);
    obj.hValue_Level = uicontrol('Style', 'edit','Position', obj.Lval_Pos,'String','', 'BackgroundColor', [1 1 1], 'FontSize', 9,'Callback', @obj.WinLevChanged);
    obj.hValue_Window = uicontrol('Style', 'edit','Position', obj.Wval_Pos,'String','', 'BackgroundColor', [1 1 1], 'FontSize', 9,'Callback', @obj.WinLevChanged);
    obj.hText_View = uicontrol('Style', 'text','Position', obj.Vwtxt_Pos,'String','View: ', 'BackgroundColor', [0.8 0.8 0.8], 'FontSize', 10);


    set(obj.hFig, 'ButtonDownFcn', @obj.mouseClick);
    set(obj.hFig, 'WindowScrollWheelFcn', @obj.mouseScroll);
    set(obj.hFig,'WindowButtonUpFcn', @obj.mouseRelease)
    set(obj.hFig,'ResizeFcn', @obj.figureResized)

end
