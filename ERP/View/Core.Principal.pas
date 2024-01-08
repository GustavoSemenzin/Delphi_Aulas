unit Core.Principal;

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
   Core.Login,
   Vcl.Menus,
   Core.Classes.Apoio,
   Core.Cadastro.Usuarios;
{$ENDREGION}

type
  TfrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    miCadastros: TMenuItem;
    miSair: TMenuItem;
    miUsuarios: TMenuItem;
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
     procedure FormCreate(Sender: TObject);
    procedure miSairClick(Sender: TObject);
    procedure miUsuariosClick(Sender: TObject);
  private
  public
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

procedure TfrmPrincipal.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
   CanClose := Tapoio.perguntar('Deseja sair do sistema?');
end;

procedure TfrmPrincipal.FormCreate(Sender: TObject);
begin
   try
      if frmLogin = nil then
         frmLogin := TfrmLogin.Create(nil);

      frmLogin.ShowModal;
   finally
      if Assigned(frmLogin) then
         FreeAndNil(frmLogin);

   end;
end;

procedure TfrmPrincipal.miSairClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmPrincipal.miUsuariosClick(Sender: TObject);
begin
   try
      if frmCadUsuarios = nil then
         frmCadUsuarios := TfrmCadUsuarios.Create(nil);

      frmCadUsuarios.ShowModal;
   finally
      if Assigned(frmCadUsuarios) then
         FreeAndNil(frmCadUsuarios);

   end;
end;

end.
