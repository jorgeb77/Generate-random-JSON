unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Vcl.Mask, Vcl.ExtCtrls, System.DateUtils, System.UITypes,
  Clipbrd, System.JSON, Vcl.Menus, System.ImageList, Vcl.ImgList,
  System.StrUtils, System.Math,

  dxSkinsCore, dxSkinBlue, dxSkinMoneyTwins, dxSkinOffice2007Blue,
  dxSkinVS2010, cxGraphics, cxLookAndFeels, cxLookAndFeelPainters,
  cxControls, cxContainer, cxEdit, cxLabel, cxTextEdit, cxMaskEdit,
  cxSpinEdit, cxButtons, dxShellDialogs, cxMemo, dxSkinOffice2019Black,
  dxSkinVisualStudio2013Dark, cxImageList, dxCore, cxClasses, dxSkinsForm,
  cxCheckBox, dxBevel;

type
  TForm1 = class(TForm)
    dxSaveFileDialog1: TdxSaveFileDialog;
    btnGenerateJSON: TcxButton;
    btnCopyToClipboard: TcxButton;
    edtNumRecords: TcxSpinEdit;
    cxLabel1: TcxLabel;
    memoLog: TcxMemo;
    BtModo: TcxButton;
    cxImageList1: TcxImageList;
    dxSkinController1: TdxSkinController;
    CkbGenerarArch: TcxCheckBox;
    dxBevel1: TdxBevel;
    dxBevel2: TdxBevel;
    LbRuta: TcxLabel;
    procedure btnGenerateJSONClick(Sender: TObject);
    procedure btnCopyToClipboardClick(Sender: TObject);
    procedure BtModoClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure btnGenerateJSONMouseEnter(Sender: TObject);
    procedure btnGenerateJSONMouseLeave(Sender: TObject);
  private
    procedure GenerateJSON(const FileName : string; NumRecords : Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses ModoOscuroClaro, funciones;

procedure TForm1.btnCopyToClipboardClick(Sender: TObject);
begin
  if memoLog.Lines.Count = 0 then
    begin
      MessageDlg('Debe generar el archivo JSON.' +#13+ 'Por favor verifique',
                 TMsgDlgType.mtWarning, [mbOK], 0);
      Abort;
    end;

  Clipboard.AsText := memoLog.Text; // Copia el texto del TMemo al portapapeles
  memoLog.Lines.Add('');
  memoLog.Lines.Add('JSON copiado al portapapeles.');
end;

procedure TForm1.btnGenerateJSONClick(Sender: TObject);
var
  NumRecords : Integer;
begin
  // Intentar convertir el texto a un número entero
  if not TryStrToInt(edtNumRecords.Text, NumRecords) or (StrToInt(edtNumRecords.Text) <= 0) then
    begin
      MessageDlg('Por favor, introduce un número válido de registros.',
                 TMsgDlgType.mtWarning, [mbOK], 0);
      Exit;
    end;

  LbRuta.Caption := '';

  if CkbGenerarArch.Checked then
    begin
      // Pedir al usuario que elija dónde guardar el archivo
      if dxSaveFileDialog1.Execute then
        begin
          GenerateJSON(dxSaveFileDialog1.FileName, NumRecords);
          memoLog.Lines.Add('');
          LbRuta.Caption := 'JSON generado exitosamente en: ' + dxSaveFileDialog1.FileName;
          MessageDlg('JSON Generado Exitosamente.',TMsgDlgType.mtInformation, [mbOK], 0);
        end;
    end
  else
    begin
      GenerateJSON('', NumRecords);
      memoLog.Lines.Add('');
    end;

end;

procedure TForm1.btnGenerateJSONMouseEnter(Sender: TObject);
begin
  TcxButton(Sender).Font.Style := [TFontStyle.fsBold];
end;

procedure TForm1.btnGenerateJSONMouseLeave(Sender: TObject);
begin
  TcxButton(Sender).Font.Style := [];
end;

procedure TForm1.BtModoClick(Sender: TObject);
begin
  if BtModo.Down then
    begin
      BtModo.OptionsImage.ImageIndex := 1;
      SkinsModoClaro(False);
    end
  else
    begin
      BtModo.OptionsImage.ImageIndex := 0;
      SkinsModoClaro(True);
    end;

end;

procedure TForm1.FormShow(Sender: TObject);
begin
  ModoOscuroClaro.Formulario     := Self;
  ModoOscuroClaro.SkinController := dxSkinController1;
  SkinsModoClaro(True);
end;

procedure TForm1.GenerateJSON(const FileName : string; NumRecords : Integer);
var
  JSONArray    : TJSONArray;
  JSONObject   : TJSONObject;
  I, Aleatorio : Integer;
  JSONText     : string;
begin
  JSONArray := TJSONArray.Create;

  try
    Randomize;
    for I := 1 to NumRecords do
      begin
        JSONObject := TJSONObject.Create;
        JSONObject.AddPair('codigo', TJSONNumber.Create(Random(99999) + 1));
  //      JSONObject.AddPair('nombre', GenerateRandomString);

        JSONObject.AddPair('nombre', GetRandomFirstName);
        JSONObject.AddPair('apellido', GetRandomLastName);
  //      JSONObject.AddPair('nombre_completo', GetRandomFullName);
  //      JSONObject.AddPair('nombre_completo', GetRandomFirstName +' '+ GetRandomLastName);

        JSONObject.AddPair('email', GenerateRandomEmail);

        //se genera una hora aleatoria dentro de un horario típico de trabajo (de 8:00 AM a 5:00 PM).
        // HORA CORTA AM/PM
//        JSONObject.AddPair('hora', FormatDateTime('hh:nn:ss am/pm', GenerateRandomTime(EncodeTime(8, 0, 0, 0), EncodeTime(17, 0, 0, 0))));

        // HORA LARGA 24 HORAS
        JSONObject.AddPair('hora', FormatDateTime('hh:nn:ss', GenerateRandomTime(EncodeTime(8, 0, 0, 0), EncodeTime(17, 0, 0, 0))));

        JSONObject.AddPair('telefono', GenerateRandomPhoneNumber);

        Aleatorio := RandomRange(0, 20); //Aleatorio de 0 a 19

        JSONObject.AddPair('pais', GetCountryAndCapital(Aleatorio).Country);
        JSONObject.AddPair('ciudad', GetCountryAndCapital(Aleatorio).Capital);
        JSONObject.AddPair('compañia', GenerateRandomCompany);
        JSONObject.AddPair('cargo', GenerateRandomJobTitle);
        JSONObject.AddPair('salario', TJSONNumber.Create(FormatFloat('0.00', RandomRangeDecimal(10000,50000))));

        // Generar un número aleatorio entre 10,000.00 y 50,000.00
        // 40001 porque el rango es de 40,001 unidades (50,000 - 10,000 + 1)
  //      JSONObject.AddPair('salario', FormatWithThousandsSeparator(RandomRangeF(10000, 40001))  );


  //      JSONObject.AddPair('fecha_contrato', FormatDateTime('yyyy/mm/dd', GenerateRandomDate));

        JSONObject.AddPair('fecha_contrato', FormatDateTime('yyyy/mm/dd', GenerateRandomDate(StartOfTheYear(Now), EndOfTheYear(Now))));

        JSONArray.AddElement(JSONObject);
      end;

    JSONText := JSONArray.Format;

    // Reemplazar barras invertidas escapadas innecesariamente en los campos de fecha
    JSONText := StringReplace(JSONText, '\/', '/', [rfReplaceAll]); // Eliminar las barras invertidas de las fechas

    with TStringList.Create do
    try
      Text := JSONText;
      if FileName <> EmptyStr then
        SaveToFile(FileName);

      Form1.memoLog.Lines.Text := Text; // Actualizar el TMemo con el JSON
    finally
      Free;
    end;

  finally
    JSONArray.Free;
  end;
end;


end.
