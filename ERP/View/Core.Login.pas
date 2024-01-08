unit Core.Login;

interface

{$REGION 'Uses'}
uses
   Winapi.Windows,
   Winapi.Messages,
   System.SysUtils,
   System.Variants,
   System.Classes,
   Vcl.Graphics,
   Vcl.Controls,
   Vcl.Forms,
   Vcl.Dialogs,
   cxGraphics,
   cxControls,
   cxLookAndFeels,
   cxLookAndFeelPainters,
   cxContainer,
   cxEdit,
   Vcl.Menus,
   Vcl.StdCtrls,
   cxButtons,
   cxTextEdit,
   cxLabel,
   Vcl.ExtCtrls,
   Core.Conexao,
   Data.FMTBcd,
   Data.DB,
   Data.SqlExpr,
   FireDAC.Stan.Intf,
   FireDAC.Stan.Option,
   FireDAC.Stan.Param,
   FireDAC.Stan.Error,
   FireDAC.DatS,
   FireDAC.Phys.Intf,
   FireDAC.DApt.Intf,
   FireDAC.Stan.Async,
   FireDAC.DApt,
   FireDAC.Comp.DataSet,
   FireDAC.Comp.Client,
   Core.Classes.Apoio,
   System.IniFiles,
   Aurelius.Engine.ObjectManager,
   Core.Entities,
   Aurelius.Drivers.Interfaces,
   Aurelius.Criteria.Linq,
   Generics.Collections;
{$ENDREGION}

type
  TfrmLogin = class(TForm)
    pnlLogin: TPanel;
    cxLabel1: TcxLabel;
    cxLabel2: TcxLabel;
    edtLogin: TcxTextEdit;
    edtSenha: TcxTextEdit;
    btnAcessar: TcxButton;
    btnCancelar: TcxButton;
    procedure btnAcessarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure edtSenhaKeyPress(Sender: TObject; var Key: Char);
    procedure FormShow(Sender: TObject);
  private
    function usuarioExiste: Boolean;
    procedure Login;
  public
    { Public declarations }
  end;

var
  frmLogin: TfrmLogin;

implementation

{$R *.dfm}

procedure TfrmLogin.btnAcessarClick(Sender: TObject);
begin
   Login;
end;

procedure TfrmLogin.btnCancelarClick(Sender: TObject);
begin
   Application.Terminate;
end;

procedure TfrmLogin.edtSenhaKeyPress(Sender: TObject; var Key: Char);
begin
   if Key = #13 then
   begin
      Key := #0;
      Login;
   end;

end;

procedure TfrmLogin.FormShow(Sender: TObject);
begin
   edtLogin.Text := Tapoio.lerParametro('LOGIN', 'USUARIO', '');
   if Trim(edtLogin.Text).IsEmpty then
      Exit;
         
   if edtSenha.CanFocus then
      edtSenha.SetFocus;

end;

procedure TfrmLogin.Login;
begin
   try
      usuarioExiste;

      TApoio.salvarParametro('LOGIN', 'USUARIO', Trim(edtLogin.Text));
      Close;
   except
      on E: Exception do
         raise Exception.Create(E.Message);

   end;
end;

function TfrmLogin.usuarioExiste: Boolean;
var
   Manager: TObjectManager;
   Usuarios: TList<TUsuarios>;
   Usuario: TUsuarios;
begin
   try
      try
         Manager := TObjectManager.Create(TdmConexao.CreateConnection);
         Usuarios := Manager.
                        Find<TUsuarios>
                        .Add(Linq['USUARIO'] = Trim(edtLogin.Text))
                        .Add(Linq.Eq('STATUS', 1))
                        .List;

         if ( not Assigned(Usuarios)) or (Usuarios.Count <= 0)then
            raise Exception.Create('Usuário não encontrado');

         if Trim(edtSenha.Text) <> Usuarios[0].Senha.ValueOrDefault then
            raise Exception.Create('Senha incorreta');

      except
         raise;

      end;
   finally
      if Assigned(Usuarios) then
         FreeAndNil(Usuarios);

      if Assigned(Manager) then
      begin
         Manager.Connection.Disconnect;
         FreeAndNil(Manager);
      end;
   end;
end;

end.
