unit UpdateCliente;

interface

uses
  UpdateCliente.Controller;

function GetController: TUpdateClienteController;

implementation

uses
  Models.DaoGeneric, Models.Entities.Cliente, UpdateCliente.UseCase;

function GetController: TUpdateClienteController;
var
  DaoClientes: iDAOGeneric<TCliente>;
  UpdateClienteUseCase: iUpdateClienteUseCase;
begin
  DaoClientes := TDAOGeneric<TCliente>.Create;
  UpdateClienteUseCase := TUpdateClienteUseCase.Create(DaoClientes);
  result := TUpdateClienteController.Create(UpdateClienteUseCase);
end;

end.
