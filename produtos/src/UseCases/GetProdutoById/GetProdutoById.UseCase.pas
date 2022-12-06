unit GetProdutoById.UseCase;

interface

uses
  Models.DaoGeneric, Produto.Entity;

type
  iGetProdutoByIdUseCase = interface
    ['{879aaffb-e718-437f-a84e-0cfd104fe96d}']
    function execute(id: String): TProduto;
  end;

  TGetProdutoByIdUseCase = class(TInterfacedObject, iGetProdutoByIdUseCase)
  private
    FDAOClientes: iDAOGeneric<TProduto>;
  public
    constructor Create(Value: iDAOGeneric<TProduto>);
    function execute(id: String): TProduto;
  end;

implementation

{ TGetProdutoByIdUseCase }

constructor TGetProdutoByIdUseCase.Create(Value: iDAOGeneric<TProduto>);
begin
  FDAOClientes := Value;
end;

function TGetProdutoByIdUseCase.execute(id: String): TProduto;
begin
  result := TProduto.Create;
  FDAOClientes.Find(id, result);
end;

end.
