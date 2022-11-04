unit ListAllClientes;

interface

uses
  ListAllClientes.Controller;

function GetController: TListAllClientesController;

implementation

uses
  Models.DaoGeneric, Models.Entities.Cliente, ListAllClientes.UseCase;

function GetController: TListAllClientesController;
var
  DaoClientes: iDAOGeneric<TCliente>;
  ListAllClientesUseCase: TListAllClientesUseCase;
begin
  DaoClientes := TDAOGeneric<TCliente>.Create;

  ListAllClientesUseCase := TListAllClientesUseCase.Create(DaoClientes);

  result := TListAllClientesController.Create(ListAllClientesUseCase);
end;

end.
