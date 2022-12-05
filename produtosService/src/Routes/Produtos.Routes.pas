unit Produtos.Routes;

interface

uses
  Horse;

procedure Registry();

implementation

uses
  GetAllProdutos, GetProdutoById;

procedure Registry();
begin
  THorse.Get('/produtos', GetAllProdutos.GetController.handle);
  THorse.Get('/produtos/:id', GetProdutoById.GetController.handle);
end;

end.
