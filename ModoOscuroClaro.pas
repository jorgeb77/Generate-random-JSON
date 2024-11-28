unit ModoOscuroClaro;

{ UNIDAD DESARROLLADA PARA MANEJAR EL MODO OSCURO (DARK MODE) Y EL
  MODO CLARO (LIGHT MODE) EN UNA APLICACION COMO SUCEDE EN LAS PAGINAS WEB. }

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.WinXCtrls, Vcl.ComCtrls,

  cxGraphics, cxControls, cxLookAndFeels, cxLookAndFeelPainters, dxSkinsCore,
  cxContainer, cxEdit, cxCustomListBox, cxCheckListBox, cxTextEdit, cxButtons,
  dxBarBuiltInMenu, cxLabel, cxPC, cxCheckBox, dxBevel, cxGroupBox,
  cxCurrencyEdit, cxRadioGroup, cxMemo, dxStatusBar,
  dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Blue, dxSkinOffice2010Silver,
  dxSkinVS2010, cxMaskEdit, cxDropDownEdit, cxCalc, cxListBox, cxClasses,
  cxShellBrowserDialog, dxToggleSwitch, dxCore, dxSkinsForm,
  dxSkinVisualStudio2013Dark, dxSkinVisualStudio2013Light,
  cxTLdxBarBuiltInMenu, cxInplaceContainer, cxListView, cxTreeView, dximctrl,
  cxImageComboBox,  cxScrollBar, dxBar,
  dxRibbonSkins, dxRibbonCustomizationForm, dxRibbon, dxTreeView, cxScheduler,
  cxSchedulerStorage, cxSchedulerCustomControls, cxSchedulerCustomResourceView,
  cxSchedulerDayView, cxSchedulerAgendaView, cxSchedulerDateNavigator,
  cxSchedulerHolidays, cxSchedulerTimeGridView, cxSchedulerUtils,
  cxSchedulerWeekView, cxSchedulerYearView, cxSchedulerGanttView,
  cxSchedulerRecurrence, cxSchedulerTreeListBrowser,
  cxSchedulerRibbonStyleEventEditor, cxDateNavigator, cxProgressBar, cxTrackBar,
  dxZoomTrackBar, cxColorComboBox, cxCheckComboBox, cxCheckGroup,
  dxColorEdit, cxButtonEdit,  cxTimeEdit,  cxImage,
  cxLookupEdit, cxDBLookupEdit, cxDBLookupComboBox,
  dxCheckGroupBox, dxBreadcrumbEdit, cxDateUtils, cxCalendar,
  cxSpinEdit, cxStyles, cxCustomData, cxFilter, cxData, cxDataStorage,
  cxNavigator, dxDateRanges, dxScrollbarAnnotations, cxDBData, cxGridLevel,
  cxGridCustomView, cxGridCustomTableView, cxGridTableView, cxGridDBTableView,
  cxGrid, cxTL, dxSkinOffice2019Black, dxSkinDevExpressDarkStyle,
  dxActivityIndicator, dxShellDialogs, dxColorDialog, cxTLData, cxDBTL,
  cxDBProgressBar, cxDBTrackBar, dxDBZoomTrackBar, cxDBCheckListBox,
  cxDBColorComboBox, cxDBCheckComboBox, cxDBCheckGroup, dxDBColorEdit, cxDBEdit,
  cxDBNavigator, dxDBBreadcrumbEdit, dxDBCheckGroupBox, dxDBToggleSwitch;

var
  Formulario : TForm;
  SkinController : TdxSkinController;


procedure SkinsModoClaro(ModoClaro : Boolean);

implementation


{ ESTE PROCEDIMIENTO LO USARE CUANDO QUIERA COMBINAR VARIOS SKINS
  EN MI APLICACION EN VEZ DE USAR UNO SOLO PARA TODA LA APLICACION. }
procedure SkinsModoClaro(ModoClaro : Boolean);
var
  I : Integer;
  ColorAnterior : TColor;
begin
  //Usamos un componente SkinController para establecer el Skin en el formulario
  if ModoClaro = True then
    SkinController.SkinName := ''
  else
    SkinController.SkinName := 'VisualStudio2013Dark';

  for I := 0 to Formulario.ComponentCount - 1 do
    begin
      if Formulario.Components[I] is TcxLabel then
        with Formulario.Components[I] as TcxLabel do
          begin
            Transparent := True;

            //AQUI SE MANEJA EL COLOR DE LOS TcxLabel

            if Tag = 0 then
              begin
                if ModoClaro = True then
                  Style.TextColor := clWindowText
                else
                  Style.TextColor := clWhite;
              end;

          { NOTA : EN EL MANEJO DE LOS MODOS CLARO Y OSCURO EN LA APP
            TODOS LOS LABELS DE COLOR NEGRO DEBEN TENER SU PROPIEDAD TAG
            CON VALOR 0 (ES EL VALOR QUE TIENE POR DEFECTO), PERO SI TENEMOS
            LABELS EN OTRO COLOR ESTOS DEBEN TENER SU PROPIEDAD
            TAG CON VALOR 1 PARA QUE LOS MODOS CLARO-OSCURO NO LOS AFECTEN
            Y SE RESPETE LOS COLORES QUE TIENEN ESTABLECIDOS. }
          end;

      if Formulario.Components[I] is TcxButton then
        with Formulario.Components[I] as TcxButton do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Office2010Silver'
            else
              LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxListBox then
        with Formulario.Components[I] as TcxListBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDateEdit then
        with Formulario.Components[I] as TcxDateEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxSpinEdit then
        with Formulario.Components[I] as TcxSpinEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxComboBox then
        with Formulario.Components[I] as TcxComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxCheckBox then
        with Formulario.Components[I] as TcxCheckBox do
          begin
            Transparent := True;

            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'VS2010'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxPageControl then
        with Formulario.Components[I] as TcxPageControl do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxGrid then
        with Formulario.Components[I] as TcxGrid do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxTreeList then
        with Formulario.Components[I] as TcxTreeList do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxListView then
        with Formulario.Components[I] as TcxListView do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxTreeView then
        with Formulario.Components[I] as TcxTreeView do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxImageComboBox then
        with Formulario.Components[I] as TcxImageComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TdxBevel then
        with Formulario.Components[I] as TdxBevel do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxGroupBox then
        with Formulario.Components[I] as TcxGroupBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Office2007Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxScrollBar then
        with Formulario.Components[I] as TcxScrollBar do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxBarManager then
        with Formulario.Components[I] as TdxBarManager do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxStatusBar then
        with Formulario.Components[I] as TdxStatusBar do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Office2007Blue'
            else
              LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TdxTreeViewControl then
        with Formulario.Components[I] as TdxTreeViewControl do
          begin
//            LookAndFeel.SkinName := SkinName;
          end;

      if Formulario.Components[I] is TcxScheduler then
        with Formulario.Components[I] as TcxScheduler do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDateNavigator then
        with Formulario.Components[I] as TcxDateNavigator do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxProgressBar then
        with Formulario.Components[I] as TcxProgressBar do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxTrackBar then
        with Formulario.Components[I] as TcxTrackBar do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TdxZoomTrackBar then
        with Formulario.Components[I] as TdxZoomTrackBar do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxCheckListBox then
        with Formulario.Components[I] as TcxCheckListBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxColorComboBox then
        with Formulario.Components[I] as TcxColorComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxCheckComboBox then
        with Formulario.Components[I] as TcxCheckComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxCheckGroup then
        with Formulario.Components[I] as TcxCheckGroup do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxColorEdit then
        with Formulario.Components[I] as TdxColorEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxTextEdit then
        with Formulario.Components[I] as TcxTextEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxMaskEdit then
        with Formulario.Components[I] as TcxMaskEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxMemo then
        with Formulario.Components[I] as TcxMemo do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxButtonEdit then
        with Formulario.Components[I] as TcxButtonEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxCalcEdit then
        with Formulario.Components[I] as TcxCalcEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxTimeEdit then
        with Formulario.Components[I] as TcxTimeEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxCurrencyEdit then
        with Formulario.Components[I] as TcxCurrencyEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxImage then
        with Formulario.Components[I] as TcxImage do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxLookupComboBox then
        with Formulario.Components[I] as TcxLookupComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxRadioButton then
        with Formulario.Components[I] as TcxRadioButton do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxRadioGroup then
        with Formulario.Components[I] as TcxRadioGroup do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Office2007Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxCheckGroupBox then
        with Formulario.Components[I] as TdxCheckGroupBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxBreadcrumbEdit then
        with Formulario.Components[I] as TdxBreadcrumbEdit do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'MoneyTwins'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxToggleSwitch then
        with Formulario.Components[I] as TdxToggleSwitch do
          begin
            if ModoClaro = True then
              begin
                Style.LookAndFeel.SkinName := 'MoneyTwins';
                Style.Color                := $00FFEFE3;  //Controlamos el color de fondo de este componente
                StyleDisabled.Color        := $00FFEFE3;
                StyleFocused.Color         := $00FFEFE3;
                StyleHot.Color             := $00FFEFE3;
              end
            else
              begin
                Style.LookAndFeel.SkinName := 'DevExpressDarkStyle';
                Style.Color                := $00302D2D;
                StyleDisabled.Color        := $00302D2D;
                StyleFocused.Color         := $00302D2D;
                StyleHot.Color             := $00302D2D;
              end;
          end;

      if Formulario.Components[I] is TdxActivityIndicator then
        with Formulario.Components[I] as TdxActivityIndicator do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TdxSaveFileDialog then
        with Formulario.Components[I] as TdxSaveFileDialog do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxOpenFileDialog then
        with Formulario.Components[I] as TdxOpenFileDialog do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxOpenPictureDialog then
        with Formulario.Components[I] as TdxOpenPictureDialog do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxSavePictureDialog then
        with Formulario.Components[I] as TdxSavePictureDialog do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxColorDialog then
        with Formulario.Components[I] as TdxColorDialog do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxShellBrowserDialog then
        with Formulario.Components[I] as TcxShellBrowserDialog do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;


//========================================================================

      if Formulario.Components[I] is TcxDBTreeList then
        with Formulario.Components[I] as TcxDBTreeList do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'Blue'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBProgressBar then
        with Formulario.Components[I] as TcxDBProgressBar do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBTrackBar then
        with Formulario.Components[I] as TcxDBTrackBar do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TdxDBZoomTrackBar then
        with Formulario.Components[I] as TdxDBZoomTrackBar do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'Office2019Black';
          end;

      if Formulario.Components[I] is TcxDBCheckListBox then
        with Formulario.Components[I] as TcxDBCheckListBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBColorComboBox then
        with Formulario.Components[I] as TcxDBColorComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBCheckComboBox then
        with Formulario.Components[I] as TcxDBCheckComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBCheckGroup then
        with Formulario.Components[I] as TcxDBCheckGroup do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Office2007Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxDBColorEdit then
        with Formulario.Components[I] as TdxDBColorEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBTextEdit then
        with Formulario.Components[I] as TcxDBTextEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBMaskEdit then
        with Formulario.Components[I] as TcxDBMaskEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBMemo then
        with Formulario.Components[I] as TcxDBMemo do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBDateEdit then
        with Formulario.Components[I] as TcxDBDateEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBButtonEdit then
        with Formulario.Components[I] as TcxDBButtonEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBCheckBox then
        with Formulario.Components[I] as TcxDBCheckBox do
          begin
            Transparent := True;

            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'VS2010'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBComboBox then
        with Formulario.Components[I] as TcxDBComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBImageComboBox then
        with Formulario.Components[I] as TcxDBImageComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBSpinEdit then
        with Formulario.Components[I] as TcxDBSpinEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBCalcEdit then
        with Formulario.Components[I] as TcxDBCalcEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBTimeEdit then
        with Formulario.Components[I] as TcxDBTimeEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBCurrencyEdit then
        with Formulario.Components[I] as TcxDBCurrencyEdit do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBImage then
        with Formulario.Components[I] as TcxDBImage do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBLookupComboBox then
        with Formulario.Components[I] as TcxDBLookupComboBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'MoneyTwins'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBRadioGroup then
        with Formulario.Components[I] as TcxDBRadioGroup do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Office2007Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBListBox then
        with Formulario.Components[I] as TcxDBListBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TcxDBNavigator then
        with Formulario.Components[I] as TcxDBNavigator do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'MoneyTwins'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxDBBreadcrumbEdit then
        with Formulario.Components[I] as TdxDBBreadcrumbEdit do
          begin
            if ModoClaro = True then
              LookAndFeel.SkinName := 'MoneyTwins'
            else
              LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxDBCheckGroupBox then
        with Formulario.Components[I] as TdxDBCheckGroupBox do
          begin
            if ModoClaro = True then
              Style.LookAndFeel.SkinName := 'Office2007Blue'
            else
              Style.LookAndFeel.SkinName := 'VisualStudio2013Dark';
          end;

      if Formulario.Components[I] is TdxDBToggleSwitch then
        with Formulario.Components[I] as TdxDBToggleSwitch do
          begin
            if ModoClaro = True then
              begin
                Style.LookAndFeel.SkinName := 'MoneyTwins';
                Style.Color                := $00FFEFE3;  //Controlamos el color de fondo de este componente
                StyleDisabled.Color        := $00FFEFE3;
                StyleFocused.Color         := $00FFEFE3;
                StyleHot.Color             := $00FFEFE3;
              end
            else
              begin
                Style.LookAndFeel.SkinName := 'DevExpressDarkStyle';
                Style.Color                := $00302D2D;
                StyleDisabled.Color        := $00302D2D;
                StyleFocused.Color         := $00302D2D;
                StyleHot.Color             := $00302D2D;
              end;
          end;

    end;
end;



end.
