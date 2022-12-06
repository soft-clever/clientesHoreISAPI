unit CreateCliente;

interface

  uses CreateCliente.Controller;

function getController(): TCreateClienteController;

implementation

  uses Models.DaoGeneric, Models.Entities.Cliente, CreateCliente.UseCase;

  function getController(): TCreateClienteController;
  var
    DaoCliente: TDAOGeneric<TCliente>;
    CreateClienteUseCase: TCreateClienteUseCase;
  begin
    DaoCliente := TDAOGeneric<TCliente>.Create;
    CreateClienteUseCase := TCreateClienteUseCase.Create(DaoCliente);
    result := TCreateClienteController.Create(CreateClienteUseCase);
  end;

end.
