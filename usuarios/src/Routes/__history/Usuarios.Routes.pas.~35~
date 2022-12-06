unit Usuarios.Routes;

interface

uses
  Horse, Horse.JWT, Login.Controller;

procedure Registry();

implementation

uses
  GetAllUsuarios, GetUsuarioById, CreateUsuario, Login, Cadastro;

procedure Registry();
begin
//  LOGIN
  THorse.Post('/login', Login.GetController.handle);
//  CADASTRO
  THorse.Post('/cadastro', Cadastro.GetController.handle);

//  GET ALL
  THorse.Get('/usuarios', GetAllUsuarios.GetController.handle);
//  GET BY ID
  THorse.Get('/usuarios/:id', GetUsuarioById.GetController.handle);
//  CREATE
  THorse.Post('/usuarios', CreateUsuario.getController.handle);
end;

end.
