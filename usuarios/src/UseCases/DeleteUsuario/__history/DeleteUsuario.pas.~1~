unit DeleteProduto;

interface

uses
  DeleteProduto.Controller;

function GetController: TDeleteProdutoController;

implementation

uses
  Models.DaoGeneric, Produto.Entity, DeleteProduto.UseCase;

function GetController: TDeleteProdutoController;
var
  DaoProdutos: iDAOGeneric<TProduto>;
  DeleteProdutoUseCase: iDeleteProdutoUseCase;
begin
  DaoProdutos := TDAOGeneric<TProduto>.Create;
  DeleteProdutoUseCase := TDeleteProdutoUseCase.Create(DaoProdutos);
  result := TDeleteProdutoController.Create(DeleteProdutoUseCase);
end;

end.
