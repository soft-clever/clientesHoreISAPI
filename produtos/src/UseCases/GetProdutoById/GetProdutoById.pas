unit GetProdutoById;

interface

uses
  GetProdutoById.Controller;

function GetController: TGetProdutoByIdController;

implementation

uses
  Models.DaoGeneric, Produto.Entity	, GetProdutoById.UseCase;

function GetController: TGetProdutoByIdController;
var
  DaoProdutos: iDAOGeneric<TProduto>;
  GetProdutoByIdUseCase: iGetProdutoByIdUseCase;
begin
  DaoProdutos := TDAOGeneric<TProduto>.Create;
  GetProdutoByIdUseCase := TGetProdutoByIdUseCase.Create(DaoProdutos);
  result := TGetProdutoByIdController.Create(GetProdutoByIdUseCase);
end;

end.
