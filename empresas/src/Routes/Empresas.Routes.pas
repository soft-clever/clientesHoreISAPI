unit Empresas.Routes;

interface

procedure Registry();

implementation

uses
  Horse, GetAllEmpresas, GetEmpresaById, CreateEmpresa;

procedure Registry();
begin
  // GET ALL
  THorse.Get('/empresas', GetAllEmpresas.getController.handle);
  // GET BY ID
  THorse.Get('/empresas/:id', GetEmpresaById.getController.handle);
  // CREATE
  THorse.Post('/empresas', CreateEmpresa.getController.handle);
end;

end.
