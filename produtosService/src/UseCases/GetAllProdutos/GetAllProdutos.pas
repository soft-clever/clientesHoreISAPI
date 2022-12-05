unit GetAllProdutos;

interface

uses
  GetAllProdutos.Controller;

function GetController: TGetAllProdutosController;

implementation

uses
  Models.DaoGeneric, Produto.Entity, GetAllProdutos.UseCase;

function GetController: TGetAllProdutosController;
var
  DaoProdutos: iDAOGeneric<TProduto>;
  GetAllProdutosUseCase: TGetAllProdutosUseCase;
begin
  DaoProdutos := TDAOGeneric<TProduto>.Create;

  GetAllProdutosUseCase := TGetAllProdutosUseCase.Create(DaoProdutos);

  result := TGetAllProdutosController.Create(GetAllProdutosUseCase);
end;

end.
