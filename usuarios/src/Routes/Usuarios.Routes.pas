unit Usuarios.Routes;

interface

uses
  Horse;

procedure Registry();

implementation

uses
  GetAllUsuarios, GetUsuarioById, CreateUsuario;

procedure Registry();
begin

//  GET ALL
  THorse.Get('/usuarios', GetAllUsuarios.GetController.handle);
//  GET BY ID
  THorse.Get('/usuarios/:id', GetUsuarioById.GetController.handle);
//  CREATE
  THorse.Post('/usuarios', CreateUsuario.getController.handle);
end;

end.
