# c:\Users\Administrator\.config\Powershell\exports\conda.ps1

# cel 함수 정의
function cel {
    conda env list
}

# ca 함수 정의
function ca {
    param(
        [Parameter(Mandatory=$true, Position=0)]
        [string]$envName
    )
    conda activate $envName
}


    <!--  Folder style when selected in ancestor (non-current) Files Panel  -->
    <Style x:Key="FolderItemSelectedBorder" TargetType="{x:Type Border}">
        <Setter Property="CornerRadius" Value="3,0,0,3" />
        <Setter Property="BorderThickness" Value="2,2,0,2" />
        <Setter Property="BorderBrush" Value="{DynamicResource AccentBrush}" />
        <Setter Property="Margin" Value="0,0,-2,0" />
        <!--  This is so that border of selected folder in column doesn't go over the edge of the panel on the right  -->
        <Setter Property="Background" Value="#b02b292e" />
        <!--  best if the same as FilesPanelBorder so parent folder blend into child panel  -->
    </Style>

    <!--
        Folder style when selected in current (most-right) Files Panel
        Set CornerRadius to 0 for sharp edges
    -->
    <Style x:Key="FolderItemSelectedInCurrentBorder" TargetType="{x:Type Border}">
        <!--<Setter Property="CornerRadius" Value="2,0,0,2" />-->
        <!--<Setter Property="BorderThickness" Value="1" />
        <Setter Property="BorderBrush" Value="Black" />-->
        <Setter Property="Background" Value="Transparent" />
    </Style>

    <!--  Tabs  -->

    <Style x:Key="ProgramNameBorder" TargetType="{x:Type Border}">
        <Setter Property="Height" Value="33" />
        <Setter Property="Margin" Value="13,0,27,0" />
        <!--for doubleclick to maximize-->
        <Setter Property="Background" Value="Transparent" />
        
    </Style>

    <Style x:Key="TabsContainerBorder" TargetType="{x:Type Border}">
        <Setter Property="Height" Value="34" />
        <Setter Property="Margin" Value="0,0,0,0" />
        <!--  if we add margin here, then shadows are cropped  -->
        <Setter Property="Padding" Value="0,0,0,0" />        
    </Style>

    <Thickness x:Key="TabItemPadding">6,0,6,0</Thickness>
    <!--  was 4,4,28,0 to leave space for close button  -->

    <Style x:Key="TabItemDefaultBorder" TargetType="{x:Type Border}">
        <Setter Property="CornerRadius" Value="4,4,0,0" />
        <!--  Set CornerRadius to 0 for sharp edges  -->
        <!--
        <Setter Property="CornerRadius" Value="0,0,0,0" />
        <Setter Property="BorderBrush" Value="#3E3C41" />
        <Setter Property="BorderThickness" Value="0,0,2,0" />
        <Setter Property="Background" Value="Transparent"/>
        <Setter Property="Margin" Value="-2,6,-2,0" />
         These 5 if you want just line separated tabs-->
        <Setter Property="Background" Value="#1b1a1d" />
        <Setter Property="Padding" Value="0,0,0,0" />
        <Setter Property="Margin" Value="0,2,2,0" />
    </Style>

    <Style x:Key="TabItemHoverBorder" TargetType="{x:Type Border}">
        <Setter Property="CornerRadius" Value="4,4,0,0" />

        <!--  Uncomment for border around non-active tab  -->
        <!--<Setter Property="BorderThickness" Value="1,1,0,1"/>
                    <Setter Property="BorderBrush" Value="Transparent" />-->
        <Setter Property="Background" Value="#3E3C41" />
        <Setter Property="Padding" Value="0,2,0,0" />
        <Setter Property="Margin" Value="0,2,0,0" />
        <Setter Property="Effect" Value="{DynamicResource HoverItemEffect}" />
    </Style>

    <Style x:Key="TabItemSelectedBorder" TargetType="{x:Type Border}">
        <Setter Property="CornerRadius" Value="4,4,0,0" />
        <!--<Setter Property="BorderThickness" Value="2,2,2,0" />-->
        <Setter Property="Padding" Value="0,0,2,0" />
        <Setter Property="Margin" Value="0,2,2,0" />
        <Setter Property="Background" Value="#2b292e" />
        <!--  best if the same as FilesPanelBorder so parent folder blend into child panel  -->
    </Style>



    <Style x:Key="TabsBottomBarBorder" TargetType="{x:Type Border}">
        <!--<Setter Property="BorderBrush" Value="#2b292e" />
                    <Setter Property="BorderThickness" Value="0,3,0,0" />
                    <Setter Property="Height" Value="2" />-->
        <Setter Property="Margin" Value="0,0,0,0" />
    </Style>

    <!--  Message panel  -->

    <Style x:Key="MessagePanelBorder" TargetType="{x:Type Border}">
        <Setter Property="Background" Value="#1b1a1d" />
        <!--  made the same as inactive tab color so it doesn't merge with files pane  -->
        <!--<Setter Property="BorderBrush" Value="Gray" />
        <Setter Property="BorderThickness" Value="0,1,0,1" />-->
    </Style>
    <SolidColorBrush x:Key="MessageSuccessBackgroundBrush" Color="DarkGreen" />
    <SolidColorBrush x:Key="MessageErrorBackgroundBrush" Color="DarkRed" />
    <SolidColorBrush x:Key="MessageInfoBackgroundBrush" Color="Transparent" />

    <!--  Other  -->

    <SolidColorBrush x:Key="ScrollBarTrackBrush" Color="#20888888" />
    <SolidColorBrush x:Key="ScrollBarThumbBrush" Color="#ae888888" />
    <SolidColorBrush x:Key="ScrollBarThumbHoverBrush" Color="#c0888888" />
    <SolidColorBrush x:Key="ScrollBarThumbPressedBrush" Color="#c0949494" />


    <!--  For background overlay when popup is open  -->
    <SolidColorBrush
        x:Key="OverlayBrush"
        Opacity=".15"
        Color="#ffffff" />

    <!--  Flash item or right-click  -->
    <SolidColorBrush x:Key="FlashBrush" Color="#afd9fa" />

    <SolidColorBrush
        x:Key="OverlayInactiveBrowserBrush"
        Opacity=".25"
        Color="#000000" />

    <!--  For panel overlay whey dual-panel is being collapsed  -->
    <SolidColorBrush
        x:Key="OverlayCollapsingBrowserBrush"
        Opacity=".84"
        Color="#2b292e" />



    <SolidColorBrush x:Key="ResizerBrush" Color="#2B292E" />
    <SolidColorBrush x:Key="ResizerHoverBrush" Color="#353339" />

    <Style x:Key="ResizerBorderBase" TargetType="{x:Type Border}">
        <Setter Property="BorderBrush" Value="{DynamicResource ResizerBrush}" />
        <Setter Property="Background" Value="Transparent" />
        <Setter Property="MinWidth" Value="6" />
        <Setter Property="MinHeight" Value="6" />
        <Style.Triggers>
            <Trigger Property="IsMouseOver" Value="True">
                <Setter Property="BorderBrush" Value="{DynamicResource ResizerHoverBrush}" />
            </Trigger>
        </Style.Triggers>
    </Style>

    <Style
        x:Key="BrowserDividerVerticalBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <!--<Setter Property="BorderBrush" Value="#04AAAC" />-->
        <Setter Property="BorderThickness" Value="1,0,1,0" />
        <Setter Property="Margin" Value="-1,34,-1,0" />
        <!--  34 from TabsContainer height  -->
    </Style>
    <Style
        x:Key="BrowserDividerHorizontalBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <!--<Setter Property="BorderBrush" Value="#04AAAC" />-->
        <Setter Property="BorderThickness" Value="0,1,0,0" />
    </Style>
    <Style
        x:Key="SidebarResizerBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <!--<Setter Property="BorderBrush" Value="#04AAAC" />-->
        <Setter Property="CornerRadius" Value="4,0,0,0" />
        <Setter Property="BorderThickness" Value="0,0,8,0" />
        <Setter Property="Margin" Value="0,34,0,0" />
        <!--  34 was taken from TabsContainerBorder Height so it doen't go to the top of the window  -->
    </Style>
    
    <Style
        x:Key="NavigationPanelResizerBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <!--<Setter Property="BorderBrush" Value="#04AAAC" />-->
        <Setter Property="BorderThickness" Value="0,1,0,0" />
    </Style>
    <Style
        x:Key="PreviewResizerHorizontalBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <Setter Property="BorderThickness" Value="0,1,0,0" />
        <Setter Property="Margin" Value="0,0,0,0" />
    </Style>
    <Style
        x:Key="PreviewResizerVerticalBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <Setter Property="BorderThickness" Value="1,0,0,0" />
        <Setter Property="Margin" Value="0,-2,0,0" />
    </Style>
    <Style
        x:Key="FileDetailsResizerHorizontalBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <!--<Setter Property="BorderBrush" Value="Transparent" />-->
        <Setter Property="BorderThickness" Value="0,1,0,0" />
        <Setter Property="Height" Value="8" />
    </Style>
    <Style
        x:Key="FileDetailsResizerVerticalBorder"
        BasedOn="{StaticResource ResizerBorderBase}"
        TargetType="{x:Type Border}">
        <Setter Property="BorderThickness" Value="1,0,0,0" />
        <Setter Property="Width" Value="8" />
    </Style>



    <s:Boolean x:Key="UseCustomUIElements">True</s:Boolean>
    <CornerRadius x:Key="UICornerRadius">3</CornerRadius>
    <!--  for some buttons for now  -->

    <SolidColorBrush x:Key="TooltipBackgroundBrush" Color="#575558" />

    <!--  Line indicating Files Panel has been scrolled; may be renamed/removed in the future  -->
    <SolidColorBrush x:Key="BrushDimGraphics" Color="#222222" />

    <!--  For Sort-Arrows for now  -->
    <SolidColorBrush x:Key="ToggleOnBrush" Color="#ffffff" />
    <SolidColorBrush x:Key="ToggleOffBrush" Color="#777777" />


    <SolidColorBrush x:Key="CaretBrush" Color="#000000" />



    <!--  not used yet  -->
    <!--<SolidColorBrush x:Key="ButtonForegroundBrush" Color="#000000" />
                <SolidColorBrush x:Key="ButtonForegroundPointerOver" Color="#0083b4" />
                <SolidColorBrush x:Key="ButtonForegroundDisabled" Color="#777777" />-->
    <!--<Setter Property="OverridesDefaultStyle" Value="True" />-->
    <!--  can be also BasedOn="{StaticResource {x:Type Button}}" or BasedOn="{StaticResource ButtonRevealStyle}"  -->

    <!--<Style  TargetType="{x:Type Button}" BasedOn="{StaticResource ModernButton}">
    -->
    <!--  BasedOn="{StaticResource ButtonRevealStyle}"  -->
    <!--
        <Setter Property="Padding" Value="{DynamicResource ButtonPadding}" />
        <Setter Property="Height" Value="{DynamicResource ButtonMinSize}" />
        <Setter Property="MinWidth" Value="{DynamicResource ButtonMinSize}" />


    </Style>-->
    <!--  MUST NEVER be Transparent, or it may fail to restore from minimized state (Gotcha); it is even saved to remove BasedOn="{StaticResource ButtonRevealStyle}" part  -->


    <SolidColorBrush x:Key="ButtonBackgroundBrush" Color="#28262B" />
    <SolidColorBrush x:Key="IconButtonBackgroundBrush" Color="#28262B" />

    <SolidColorBrush x:Key="ButtonBackgroundPointerOverBrush" Color="#555458" />
    <SolidColorBrush x:Key="ButtonBackgroundPressedBrush" Color="#7c7c7c" />
    <SolidColorBrush x:Key="ButtonBackgroundDisabledBrush" Color="#333333" />

    <SolidColorBrush x:Key="ButtonForegroundBrush" Color="#ffffff" />
    <SolidColorBrush x:Key="ButtonForegroundPointerOverBrush" Color="#ffffff" />
    <SolidColorBrush x:Key="ButtonForegroundPressedBrush" Color="#ffffff" />
    <SolidColorBrush x:Key="ButtonForegroundDisabledBrush" Color="#777777" />

    <SolidColorBrush x:Key="ButtonBorderBrush" Color="Transparent" />
    <SolidColorBrush x:Key="ButtonBorderPointerOverBrush" Color="Transparent" />
    <SolidColorBrush x:Key="ButtonBorderPressedBrush" Color="Transparent" />
    <SolidColorBrush x:Key="ButtonBorderDisabledBrush" Color="Transparent" />

    <Thickness x:Key="ButtonBorderThickness">0</Thickness>
    <Thickness x:Key="ButtonPadding">4,0,4,0</Thickness>
    <s:Double x:Key="ButtonMinSize">28</s:Double>

    <Style x:Key="ScrollIndicatorLine" TargetType="{x:Type Line}">
        <Setter Property="HorizontalAlignment" Value="Stretch" />
        <Setter Property="SnapsToDevicePixels" Value="True" />
        <Setter Property="Stretch" Value="Fill" />
        <Setter Property="StrokeThickness" Value="8" />
        <Setter Property="X2" Value="1" />
        <Setter Property="OpacityMask">
            <Setter.Value>
                <LinearGradientBrush MappingMode="RelativeToBoundingBox" StartPoint="0,0" EndPoint="1,0">
                    <GradientStop Offset="0" Color="#00000000" />
                    <GradientStop Offset="0.2" Color="#ffffffff" />
                    <GradientStop Offset="0.8" Color="#ffffffff" />
                    <GradientStop Offset="1" Color="#00000000" />
                </LinearGradientBrush>
            </Setter.Value>
        </Setter>
    </Style>

    <LinearGradientBrush x:Key="ScrollIndicatorTopBrush" StartPoint="0,0" EndPoint="0,1">
        <GradientStop Offset="0" Color="#44000000" />
        <GradientStop Offset="1" Color="#00000000" />
    </LinearGradientBrush>
    <LinearGradientBrush x:Key="ScrollIndicatorBottomBrush" StartPoint="0,0" EndPoint="0,1">
        <GradientStop Offset="1" Color="#44000000" />
        <GradientStop Offset="0" Color="#00000000" />
    </LinearGradientBrush>

    <SolidColorBrush x:Key="TagRedBrush" Color="#ef7063" />
    <SolidColorBrush x:Key="TagOrangeBrush" Color="#eda95d" />
    <SolidColorBrush x:Key="TagYellowBrush" Color="#efcf68" />
    <SolidColorBrush x:Key="TagGreenBrush" Color="#88c866" />
    <SolidColorBrush x:Key="TagBlueBrush" Color="#6fb8ef" />
    <SolidColorBrush x:Key="TagPurpleBrush" Color="#c78edd" />
    <SolidColorBrush x:Key="TagGrayBrush" Color="#7c7c7f" />


</ResourceDictionary>   