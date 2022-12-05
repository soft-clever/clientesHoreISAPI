unit DeleteProduto.UseCase;

interface

uses
  Models.DaoGeneric, Produto.Entity, System.JSON;

type
  iDeleteProdutoUseCase = interface
    ['{36360f71-191f-44fe-9439-22c698cbbb9f}']
    function execute(idProduto: String): TProduto;
  end;

  TDeleteProdutoUseCase = class(TInterfacedObject, iDeleteProdutoUseCase)
  private
    FDAOProdutos: iDAOGeneric<TProduto>;
  public
    constructor Create(Value: iDAOGeneric<TProduto>);
    function execute(id: String): TProduto;
  end;

implementation

uses
  REST.JSON;

constructor TDeleteProdutoUseCase.Create(Value: iDAOGeneric<TProduto>);
begin
  FDAOProdutos := Value;
end;

function TDeleteProdutoUseCase.execute(id: String): TProduto;
begin
  FDAOProdutos.Find(id, result);
  FDAOProdutos.Delete(result);
end;

end.
