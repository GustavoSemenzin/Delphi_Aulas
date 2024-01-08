unit Core.Classes.Apoio;

interface

{$REGION 'Uses'}
uses
   Vcl.Forms,
   SysUtils,
   Winapi.Windows,
   Datasnap.DBClient,
   IniFiles;
{$ENDREGION}

type
   TApoio = class
   private
   public
      class function perguntar(const pergunta: String): Boolean;
      class procedure alerta(const texto: String); overload;
      class procedure alerta(const texto: String; const erro: Boolean);  overload;
      class function criptografar(const senha: String): String;
      class function descriptografar(const senha: String): String;
      class procedure prepararCDS(cds: TClientDataSet; const desabilitar: Boolean = false);
      class procedure salvarParametro(const regiao, propriedade, valor: String);
      class function lerParametro(const regiao, propriedade, padrao: String): String;
   end;
implementation

{ TApoio }

const KEY: String = '220197';

class procedure TApoio.alerta(const texto: String; const erro: Boolean);
begin
   if not erro then
      alerta(texto)
   else
      Application.MessageBox(PChar(texto), PChar('Erro!!!'), MB_ICONERROR + MB_OK);

end;

class function TApoio.criptografar(const senha: String): String;
var
   I: Integer;
   C: Byte;
begin
  Result := '';
  for I := 1 to Length(senha) do begin
    if Length(KEY) > 0 then
      C := Byte(KEY[1 + ((I - 1) mod Length(KEY))]) xor Byte(senha[I])
    else
      C := Byte(senha[I]);

    Result := Result + AnsiLowerCase(IntToHex(C, 2));
  end;
end;

class function TApoio.descriptografar(const senha: String): String;
var
   I: Integer;
   C: Char;
begin
   Result := '';
   for I := 0 to Length(senha) div 2 - 1 do begin
      C := Chr(StrToIntDef('$' + Copy(senha, (I * 2) + 1, 2), Ord(' ')));
      if Length(KEY) > 0 then
         C := Chr(Byte(KEY[1 + (I mod Length(KEY))]) xor Byte(C));

      Result := Result + C;
   end;
end;

class function TApoio.lerParametro(const regiao, propriedade,
  padrao: String): String;
var
   Ini: TIniFile;
begin
   Ini := nil;
   try
      Ini := TIniFile.Create(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'PDV.ini']));
      Result := Ini.ReadString(regiao, propriedade, padrao);
   finally
      if Assigned(Ini) then
         FreeAndNil(Ini);

   end;
end;

class procedure TApoio.alerta(const texto: String);
begin
   Application.MessageBox(PChar(texto), PChar('Atenção!!!'), MB_ICONINFORMATION + MB_OK);
end;

class function TApoio.perguntar(const pergunta: String): Boolean;
begin
   Result := Application.MessageBox(PChar(pergunta), PChar('Atenção!!!'), MB_ICONQUESTION + MB_YESNO + 0) = IDYES;
end;

class procedure TApoio.prepararCDS(cds: TClientDataSet; const desabilitar: Boolean);
begin
   if cds.Active then
   begin
      cds.EmptyDataSet;
      cds.Close;
   end;

   cds.CreateDataSet;
   if desabilitar then
      cds.DisableControls;

end;

class procedure TApoio.salvarParametro(const regiao, propriedade,
  valor: String);
var
   Ini: TIniFile;
begin
   Ini := nil;
   try
      Ini := TIniFile.Create(Format('%s%s', [ExtractFilePath(ParamStr(0)), 'PDV.ini']));
      Ini.WriteString(regiao, propriedade, valor);
   finally
      if Assigned(Ini) then
         FreeAndNil(Ini);

   end;
end;

end.
