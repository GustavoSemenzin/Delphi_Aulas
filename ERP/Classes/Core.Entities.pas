unit Core.Entities;

interface

{$REGION 'Uses'}
Uses
   system.classes,
   System.SysUtils,
   Aurelius.Mapping.Attributes,
   Bcl.Types.Nullable;
{$ENDREGION}
type
   [Entity]
   [Table('TUSUARIOS')]
   [Sequence('GEN_TUSUARIOS_ID')]
   [Id('FID',TIdGenerator.IdentityOrSequence)]
   TUsuarios = class
   private
      [Column('ID', [TColumnProp.Required, TColumnProp.Unique])]
      FID: Integer;
      [Column('USUARIO', [], 25)]
      FUsuario: Nullable<String>;
      [Column('SENHA', [], 100)]
      FSenha: Nullable<String>;
      [Column('ATIVO', [TColumnProp.Required])]
      FStatus: Integer;
   public
      property ID: Integer read FID write FID;
      property Usuario: Nullable<String> read FUsuario write FUsuario;
      property Senha: Nullable<String> read FSenha write FSenha;
      property Status: Integer read FStatus write FStatus;
   end;

implementation

initialization
   RegisterEntity(TUsuarios);


end.
