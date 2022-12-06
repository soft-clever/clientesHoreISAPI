unit GetAllProdutos.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Produto.Entity;

type
  TGetAllProdutosUseCase = class
  private
    FDAOProdutos: iDAOGeneric<TProduto>;
  public
    constructor Create(Value: iDAOGeneric<TProduto>);
    function execute(limit: Integer = 20; page: Integer = 1)
      : TObjectList<TProduto>;
  end;

implementation

{ TListAllClientesUseCase }
constructor TGetAllProdutosUseCase.Create(Value: iDAOGeneric<TProduto>);
begin
  FDAOProdutos := Value;
end;

function TGetAllProdutosUseCase.execute(limit: Integer = 20; page: Integer = 1)
  : TObjectList<TProduto>;
begin
  result := TObjectList<TProduto>.Create();
  FDAOProdutos.Find(result, limit, page);
end;

end.
