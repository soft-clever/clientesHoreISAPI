unit UpdateProduto.UseCase;

interface

uses
  Models.DaoGeneric, Produto.Entity, System.JSON;

type
  iUpdateProdutoUseCase = interface
    ['{90b35eda-f7ff-471d-9d2f-7e9eebe09e52}']
    function execute(idProduto: String; JSON: TJsonObject): TProduto;
  end;

  TUpdateProdutoUseCase = class(TInterfacedObject, iUpdateProdutoUseCase)
  private
    FDAOProdutos: iDAOGeneric<TProduto>;
  public
    constructor Create(Value: iDAOGeneric<TProduto>);
    function execute(id: String; JSON: TJsonObject): TProduto;
  end;

implementation

uses
  REST.JSON;

constructor TUpdateProdutoUseCase.Create(Value: iDAOGeneric<TProduto>);
begin
  FDAOProdutos := Value;
end;

function TUpdateProdutoUseCase.execute(id: String; JSON: TJsonObject): TProduto;
begin
  FDAOProdutos.Find(id, result);
  result := TJSon.JsonToObject<TProduto>(JSON);
  FDAOProdutos.Update(result);
end;

end.
