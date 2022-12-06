unit CreateProduto;

interface

  uses CreateProduto.Controller;

function getController(): iCreateProdutoController;

implementation

  uses Models.DaoGeneric, Produto.Entity, CreateProduto.UseCase;

  function getController(): iCreateProdutoController;
  var
    DaoProduto: iDAOGeneric<TProduto>;
    CreateProdutoUseCase: iCreateProdutoUseCase;
  begin
    DaoProduto := TDAOGeneric<TProduto>.Create;
    CreateProdutoUseCase := TCreateProdutoUseCase.Create(DaoProduto);
    result := TCreateProdutoController.Create(CreateProdutoUseCase);
  end;

end.
