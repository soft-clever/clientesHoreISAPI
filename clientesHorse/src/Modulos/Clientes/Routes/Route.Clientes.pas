unit Route.Clientes;

interface

uses
  Horse;

procedure Registry();

implementation

uses
  ListAllClientes, ClienteById, CreateCliente, UpdateCliente, DeleteCliente;

procedure Registry();
begin
  THorse.Get('/clientes', ListAllClientes.GetController.handle);
  THorse.Get('/clientes/:id', ClienteById.GetController.handle);
  THorse.Post('/clientes', CreateCliente.getController.handle);
  THorse.Put('/clientes/:id', UpdateCliente.GetController.handle);
  THorse.Delete('/clientes/:id', DeleteCliente.GetController.handle);
end;


end.
