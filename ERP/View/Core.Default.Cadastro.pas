unit Core.Default.Cadastro;

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
   cxLookAndFeels,
   cxLookAndFeelPainters,
   Vcl.Menus,
   Vcl.StdCtrls,
   cxButtons,
   Vcl.ExtCtrls,
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
   cxLabel,
   cxGridLevel,
   cxGridCustomTableView,
   cxGridTableView,
   cxGridDBTableView,
   cxClasses,
   cxGridCustomView,
   cxGrid,
   cxGroupBox,
   Vcl.ComCtrls,
   Datasnap.DBClient,
   Core.Classes.Apoio,
   Core.Conexao, Aurelius.Bind.BaseDataset, Aurelius.Bind.Dataset;
 {$ENDREGION}

type
  TfrmDefaultCadastro = class(TForm)
    pnlControle: TPanel;
    btnFechar: TcxButton;
    btnPrimeiro: TcxButton;
    btnAnterior: TcxButton;
    btnExcluir: TcxButton;
    btnCancelar: TcxButton;
    btnGravar: TcxButton;
    btnNovo: TcxButton;
    btnUltimo: TcxButton;
    btnProximo: TcxButton;
    pcPrincipal: TPageControl;
    tsPesquisa: TTabSheet;
    gbPesquisa: TcxGroupBox;
    btnPesquisar: TcxButton;
    grdDados: TcxGrid;
    grdDadosTV: TcxGridDBTableView;
    grdDadosL: TcxGridLevel;
    tsCadastro: TTabSheet;
    gbCadastro: TcxGroupBox;
    dsDados: TDataSource;
    cdsDados: TAureliusDataset;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnPesquisarClick(Sender: TObject);
    procedure grdDadosTVDblClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure btnPrimeiroClick(Sender: TObject);
    procedure btnUltimoClick(Sender: TObject);
  private
    FRegistroAlterado: Boolean;
    FChave: Integer;
  protected
    procedure inicializar; virtual;
    procedure controlePadrao; virtual;
    procedure ManipularRegistro; virtual;
    procedure LimparCampos; virtual;
    procedure SetRegistroAlterado(const Value: Boolean);
    procedure pesquisarRegistro(const id: integer); virtual;
    procedure validarDados(var erro: String); virtual;
    procedure pesquisar; virtual;
    procedure excluir; virtual;
    procedure EntradaNaoPermitida; virtual;
  public
    property RegistroAlterado: Boolean read FRegistroAlterado write SetRegistroAlterado;
    property Chave: Integer read FChave write FChave;
  end;

var
  frmDefaultCadastro: TfrmDefaultCadastro;

implementation

{$R *.dfm}

procedure TfrmDefaultCadastro.FormCreate(Sender: TObject);
begin
   inicializar;
end;

{ TfrmDefaultCadastro }

procedure TfrmDefaultCadastro.btnCancelarClick(Sender: TObject);
begin
   LimparCampos;
end;

procedure TfrmDefaultCadastro.btnExcluirClick(Sender: TObject);
begin
   if Tapoio.perguntar('Deseja excluir o registro?') then
      excluir;

end;

procedure TfrmDefaultCadastro.btnFecharClick(Sender: TObject);
begin
   Close;
end;

procedure TfrmDefaultCadastro.btnGravarClick(Sender: TObject);
begin
   ManipularRegistro;
end;

procedure TfrmDefaultCadastro.btnNovoClick(Sender: TObject);
begin
   LimparCampos;
   pcPrincipal.ActivePage := tsCadastro;
end;

procedure TfrmDefaultCadastro.btnPesquisarClick(Sender: TObject);
begin
   pesquisar;
end;

procedure TfrmDefaultCadastro.btnPrimeiroClick(Sender: TObject);
begin
//   cdsDados.First;
end;

procedure TfrmDefaultCadastro.btnUltimoClick(Sender: TObject);
begin
//   cdsDados.Last;
end;

procedure TfrmDefaultCadastro.controlePadrao;
begin
   pcPrincipal.ActivePage := tsPesquisa;
end;

procedure TfrmDefaultCadastro.EntradaNaoPermitida;
begin
   Perform(WM_NEXTDLGCTL, 0, 0);
end;

procedure TfrmDefaultCadastro.excluir;
begin
   LimparCampos;
   pcPrincipal.ActivePage := tsPesquisa;
   pesquisar;
end;

procedure TfrmDefaultCadastro.grdDadosTVDblClick(Sender: TObject);
begin
   pesquisarRegistro(Chave);
end;

procedure TfrmDefaultCadastro.inicializar;
begin
   controlePadrao;
end;

procedure TfrmDefaultCadastro.LimparCampos;
begin
   btnGravar.Enabled := false;
   btnCancelar.Enabled := false;
   btnExcluir.Enabled := false
end;

procedure TfrmDefaultCadastro.ManipularRegistro;
begin
   validarDados(EmptyStr);
end;

procedure TfrmDefaultCadastro.pesquisar;
begin
//   Tapoio.prepararCDS(cdsDados, false);
end;

procedure TfrmDefaultCadastro.pesquisarRegistro(const id: integer);
begin
   pcPrincipal.ActivePage := tsCadastro;
   btnExcluir.Enabled := Chave > 0;
   RegistroAlterado := false;
end;

procedure TfrmDefaultCadastro.SetRegistroAlterado(const Value: Boolean);
begin
   FRegistroAlterado := Value;
   btnCancelar.Enabled := Value;
   btnGravar.Enabled := Value;
end;

procedure TfrmDefaultCadastro.validarDados(var erro: String);
begin
   try
      if not erro.IsEmpty then
         raise Exception.Create(erro);

   except
      raise;
   end;
end;

end.
