unit Models.Entities.Cliente;

interface

uses
  SimpleAttributes, SimpleDAO, Endereco.Entity,
  System.Generics.Collections;

type

  [Tabela('clientes')]
  TCliente = class
  private
    FId: Integer;
    FInscMunicipal: String;
    FindIE: String;
    FFantasia: String;
    FTipoCliente: String;
    FInscEstadual: String;
    FCpfCnpj: String;
    FStatus: String;
    FRazaoSocial: String;
    FDataUltimaAtualizacao: TDateTime;
    FDataFoiCadastrado: TDateTime;

    FEnderecos: TObjectList<TEndereco>;
  public
    destructor Destroy; override;

    [Campo('id'), PK, AutoInc]
    property Id: Integer read FId write FId;

    [Campo('status')]
    property Status: String read FStatus write FStatus;

    [Campo('dataFoiCadastrado')]
    property DataFoiCadastrado: TDateTime read FDataFoiCadastrado write FDataFoiCadastrado;

    [Campo('dataUltimaAtualizacao')]
    property DataUltimaAtualizacao: TDateTime read FDataUltimaAtualizacao write FDataUltimaAtualizacao;

    [Campo('razaoSocial')]
    property RazaoSocial: String read FRazaoSocial write FRazaoSocial;

    [Campo('fantasia')]
    property Fantasia: String read FFantasia write FFantasia;

    [Campo('cpfCnpj')]
    property CpfCnpj: String read FCpfCnpj write FCpfCnpj;

    [Campo('indIE')]
    property indIE: String read FindIE write FindIE;

    [Campo('inscEstadual')]
    property InscEstadual: String read FInscEstadual write FInscEstadual;

    [Campo('inscMunicipal')]
    property InscMunicipal: String read FInscMunicipal write FInscMunicipal;

    [Campo('tipoCliente')]
    property TipoCliente: String read FTipoCliente write FTipoCliente;

    [HasMany('TEndereco'), Ignore]
    property Enderecos: TObjectList<TEndereco> read FEnderecos write FEnderecos;

  end;

implementation

destructor TCliente.Destroy;
begin

  inherited;
end;

end.
