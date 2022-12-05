unit Endereco.Entity;

interface

uses
  SimpleAttributes, SimpleDAO;

type

  [Tabela('enderecos')]
  TEndereco = class
  private
    FId: Integer;
    FCep: String;
    FLogradouro: String;
    FNumero: String;
    FComplemento: String;
    FBairro: String;
    FCidade: String;
    FCodMun: String;
    FCodUf: String;
    FUf: String;
    FCliente_id: Integer;
    FTipoEndereco: String;

  public
    [Campo('id'), PK]
    property Id: Integer read FId write FId;

    [Campo('cep')]
    property Cep: String read FCep write FCep;

    [Campo('logradouro')]
    property Logradouro: String read FLogradouro write FLogradouro;

    [Campo('numero')]
    property Numero: String read FNumero write FNumero;

    [Campo('complemento')]
    property Complemento: String read FComplemento write FComplemento;

    [Campo('bairro')]
    property Bairro: String read FBairro write FBairro;

    [Campo('cidade')]
    property Cidade: String read FCidade write FCidade;

    [Campo('codMun')]
    property CodMun: String read FCodMun write FCodMun;

    [Campo('codUF')]
    property CodUf: String read FCodUf write FCodUf;

    [Campo('uf')]
    property Uf: String read FUf write FUf;

    [Campo('cliente_id'), FK]
    property Cliente_id: Integer read FCliente_id write FCliente_id;

    [Campo('tipoEndereco')]
    property TipoEndereco: String read FTipoEndereco write FTipoEndereco;
  end;

implementation

end.
