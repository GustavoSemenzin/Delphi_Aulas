unit Core.Cadastro.Usuarios;

interface

{$REGION 'uses'}
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
   Core.Default.Cadastro,
   cxGraphics,
   cxLookAndFeels,
   cxLookAndFeelPainters,
   Vcl.Menus,
   cxControls,
   cxContainer,
   cxEdit,
   cxStyles,
   cxCustomData,
   cxFilter,
   cxData,
   cxDataStorage,
   cxNavigator,
   Data.DB,
   cxDBData,
   cxGridLevel,
   cxClasses,
   cxGridCustomView,
   cxGridCustomTableView,
   cxGridTableView,
   cxGridDBTableView,
   cxGrid,
   cxGroupBox,
   Vcl.ComCtrls,
   Vcl.StdCtrls,
   cxButtons,
   Vcl.ExtCtrls,
   cxTextEdit,
   cxLabel,
   cxMaskEdit,
   cxDropDownEdit,
   cxImageComboBox,
   System.ImageList,
   Vcl.ImgList,
   Core.Classes.Apoio,
   Aurelius.Drivers.Interfaces,
   Aurelius.Engine.ObjectManager,
   Aurelius.Criteria.Linq,
   Core.Entities,
   Core.Conexao,
   Aurelius.Bind.BaseDataset,
   Aurelius.Bind.Dataset,
   Generics.Collections;
{$ENDREGION}

type
   TfrmCadUsuarios = class(TfrmDefaultCadastro)
      cxLabel1: TcxLabel;
      cxLabel2: TcxLabel;
      cxLabel3: TcxLabel;
      edtSequencia: TcxTextEdit;
      edtLogin: TcxTextEdit;
      edtSenha: TcxTextEdit;
      cxLabel4: TcxLabel;
      edtConfirmarSenha: TcxTextEdit;
      cxLabel5: TcxLabel;
      cxLabel6: TcxLabel;
      edtPSequencia: TcxTextEdit;
      edtPUsuario: TcxTextEdit;
      cmbStatus: TcxImageComboBox;
      cxLabel7: TcxLabel;
      ilImagens: TcxImageList;
      cdsDadosID: TIntegerField;
      cdsDadosUSUARIO: TStringField;
      cdsDadosSENHA: TStringField;
      cdsDadosSTATUS: TIntegerField;
    grdDadosTVID: TcxGridDBColumn;
    grdDadosTVUSUARIO: TcxGridDBColumn;
    grdDadosTVSENHA: TcxGridDBColumn;
    grdDadosTVSTATUS: TcxGridDBColumn;
      procedure FormCreate(Sender: TObject);
      procedure dsDadosDataChange(Sender: TObject; Field: TField);
      procedure edtLoginPropertiesChange(Sender: TObject);
      procedure FormClose(Sender: TObject; var Action: TCloseAction);
   private
      FListaGeral: TList<TUsuarios>;
      FManager: TObjectManager;
   protected
      procedure limparCampos; override;
      procedure validarDados(var erro: String); override;
      procedure Pesquisar; override;
   public
   end;

var
  frmCadUsuarios: TfrmCadUsuarios;

implementation

{$R *.dfm}

procedure TfrmCadUsuarios.FormCreate(Sender: TObject);
begin
   inherited;
   FManager:= TObjectManager.Create(TdmConexao.CreateConnection);
end;

procedure TfrmCadUsuarios.dsDadosDataChange(Sender: TObject; Field: TField);
begin
   inherited;
end;

{ TfrmCadUsuarios }

procedure TfrmCadUsuarios.edtLoginPropertiesChange(Sender: TObject);
begin
   inherited;
   RegistroAlterado := true;
end;

procedure TfrmCadUsuarios.FormClose(Sender: TObject; var Action: TCloseAction);
begin
   if Assigned(FManager) then
   begin
      FManager.Connection.Disconnect;
      FreeAndNil(FManager);
   end;

   if Assigned(FListaGeral) then
      FreeAndNil(FListaGeral);

   inherited;
end;

procedure TfrmCadUsuarios.limparCampos;
begin
   edtSequencia.Clear;
   edtLogin.Clear;
   edtSenha.Clear;
   edtConfirmarSenha.Clear;
   cmbStatus.ItemIndex := 0;
   inherited;
end;


procedure TfrmCadUsuarios.Pesquisar;
begin
  try
      try
         cdsDados.DisableControls;
         if not Trim(edtPSequencia.Text).IsEmpty then
         begin
            FListaGeral := FManager.Find<TUsuarios>
                  .Add(Linq.Eq('ID', Trim(edtPSequencia.Text)))
                  .List;
         end
         else
         begin
            FListaGeral := FManager.Find<TUsuarios>
                           .Add(Linq.Like('USUARIO','%' + Trim(edtPUsuario.Text + '%')))
                           .List;
         end;

         if cdsDados.Active then
            cdsDados.Close;

         cdsDados.SetSourceList(FListaGeral);
         cdsDados.Open;

      except on E: Exception do
         TApoio.alerta(E.Message);
      end;
  finally
      cdsDados.EnableControls;
  end;
end;

procedure TfrmCadUsuarios.validarDados(var erro: String);
begin
   erro := EmptyStr;
   if Trim(edtLogin.Text).IsEmpty then
      erro := 'Informe um Usuário/login' + sLineBreak;

   if cmbStatus.Text = EmptyStr then
      erro := 'Informe um status para o usuário' + sLineBreak;

   if Trim(edtSenha.Text).IsEmpty then
      erro := erro + 'Informe uma senha' + sLineBreak;

   if Trim(edtSenha.Text) <> Trim(edtConfirmarSenha.Text) then
      erro := erro +  'Confirmação de senha incorreta!' + sLineBreak;

   inherited;
end;

end.
