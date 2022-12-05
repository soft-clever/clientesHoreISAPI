unit DeleteCliente;

interface

uses
  DeleteCliente.Controller;

function GetController: TDeleteClienteController;

implementation

uses
  Models.DaoGeneric, Models.Entities.Cliente, DeleteCliente.UseCase;

function GetController: TDeleteClienteController;
var
  DaoClientes: iDAOGeneric<TCliente>;
  DeleteClienteUseCase: iDeleteClienteUseCase;
begin
  DaoClientes := TDAOGeneric<TCliente>.Create;
  DeleteClienteUseCase := TDeleteClienteUseCase.Create(DaoClientes);
  result := TDeleteClienteController.Create(DeleteClienteUseCase);
end;

end.
