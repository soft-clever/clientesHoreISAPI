unit ClienteById;

interface

uses
  ClienteById.Controller;

function GetController: TClienteByIdController;

implementation

uses
  Models.DaoGeneric, Models.Entities.Cliente, ClienteById.UseCase;

function GetController: TClienteByIdController;
var
  DaoClientes: iDAOGeneric<TCliente>;
  ClienteByIdUseCase: iClienteByIdUseCase;
begin
  DaoClientes := TDAOGeneric<TCliente>.Create;
  ClienteByIdUseCase := TClienteByIdUseCase.Create(DaoClientes);
  result := TClienteByIdController.Create(ClienteByIdUseCase);
end;

end.
