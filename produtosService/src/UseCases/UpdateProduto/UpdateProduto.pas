unit UpdateProduto;

interface

uses
  UpdateProduto.Controller;

function GetController: TUpdateProdutoController;

implementation

uses
  Models.DaoGeneric, Produto.Entity, UpdateProduto.UseCase;

function GetController: TUpdateProdutoController;
var
  DaoProdutos: iDAOGeneric<TProduto>;
  UpdateProdutoUseCase: iUpdateProdutoUseCase;
begin
  DaoProdutos := TDAOGeneric<TProduto>.Create;
  UpdateProdutoUseCase := TUpdateProdutoUseCase.Create(DaoProdutos);
  result := TUpdateProdutoController.Create(UpdateProdutoUseCase);
end;

end.
