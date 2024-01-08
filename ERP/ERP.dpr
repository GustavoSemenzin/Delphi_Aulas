program ERP;

uses
  Vcl.Forms,
  Core.Principal in 'View\Core.Principal.pas' {frmPrincipal},
  Core.Conexao in 'DM\Core.Conexao.pas' {dmConexao: TDataModule},
  Core.Login in 'View\Core.Login.pas' {frmLogin},
  Core.Classes.Apoio in 'Classes\Core.Classes.Apoio.pas',
  Core.Default.Cadastro in 'View\Core.Default.Cadastro.pas' {frmDefaultCadastro},
  Core.Cadastro.Usuarios in 'View\Core.Cadastro.Usuarios.pas' {frmCadUsuarios},
  Core.Entities in 'Classes\Core.Entities.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := true;
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.Run;
end.
