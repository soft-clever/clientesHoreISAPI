unit Produto.Entity;

interface

uses
  SimpleAttributes, SimpleDAO,
  System.Generics.Collections;

type

  [Tabela('produtos')]
  TProduto = class

  private
    FId: Integer;
    FcodProduto: String;
    Fdescricao: String;
    FcodEAN: String;
    Fncm: String;
    Fcfop: String;
    FunCom: String;
    FqtdCom: Real;
    FvlrUnCom: Real;
    FvlrProd: Real;
    FcodEANTrib: String;
    FunTrib: String;
    FqtdTrib: Real;
    FvlrUnTrib: Real;
    Fsaldo: Real;
    Fstatus: String;

  public
    [Campo('id'), PK, AutoInc]
      property Id: Integer read FId write FId;
    [Campo('codProduto')]
      property codProduto: String read FcodProduto write FcodProduto;
    [Campo('descricao')]
      property descricao: String read Fdescricao write Fdescricao;
    [Campo('codEAN')]
      property codEAN: String read FcodEAN write FcodEAN;
    [Campo('ncm')]
      property ncm: String read Fncm write Fncm;
    [Campo('cfop')]
      property cfop: String read Fcfop write Fcfop;
    [Campo('unCom')]
      property unCom: String read FunCom write FunCom;
    [Campo('qtdCom')]
      property qtdCom: Real read FqtdCom write FqtdCom;
    [Campo('vlrUnCom')]
      property vlrUnCom: Real read FvlrUnCom write FvlrUnCom;
    [Campo('vlrProd')]
      property vlrProd: Real read FvlrProd write FvlrProd;
    [Campo('codEANTrib')]
      property codEANTrib: String read FcodEANTrib write FcodEANTrib;
    [Campo('unTrib')]
      property unTrib: String read FunTrib write FunTrib;
    [Campo('qtdTrib')]
      property qtdTrib: Real read FqtdTrib write FqtdTrib;
    [Campo('vlrUnTrib')]
      property vlrUnTrib: Real read FvlrUnTrib write FvlrUnTrib;
    [Campo('status')]
      property Status: String read FStatus write FStatus;

    destructor Destroy; override;

  end;

implementation

destructor TProduto.Destroy;
begin
  inherited;
end;

end.
