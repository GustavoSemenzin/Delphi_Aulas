unit Core.Conexao;

interface

{$REGION 'Uses'}
uses
   System.SysUtils,
   System.Classes,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Error,
   FireDAC.UI.Intf,
   FireDAC.Phys.Intf,
   FireDAC.Stan.Def,
   FireDAC.Stan.Pool,
   FireDAC.Stan.Async,
   FireDAC.Phys,
   FireDAC.VCLUI.Wait,
   FireDAC.Phys.FBDef,
   FireDAC.Phys.IBBase,
   FireDAC.Phys.FB,
   Aurelius.Comp.Connection,
   Data.DB,
   FireDAC.Comp.Client,
   FireDAC.Comp.UI,
   Aurelius.Sql.Firebird,
   Aurelius.Schema.Firebird,
   Aurelius.Drivers.FireDAC,
   Aurelius.Drivers.Interfaces;
{$ENDREGION}

type
  TdmConexao = class(TDataModule)
    FDConnection: TFDConnection;
    AureliusConnection: TAureliusConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDGUIxWaitCursor: TFDGUIxWaitCursor;
  private
    { Private declarations }
  public
    class function CreateConnection: IDBConnection; overload;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TdmConexao }

class function TdmConexao.CreateConnection: IDBConnection;
begin
   if not Assigned(dmConexao) then
      dmConexao := TdmConexao.Create(nil);

   Result := dmConexao.AureliusConnection.CreateConnection;

end;

initialization

finalization
   if Assigned(dmConexao) then
      FreeAndNil(dmConexao);


end.
