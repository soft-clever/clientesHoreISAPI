unit CreateUsuario;

interface

uses CreateUsuario.Controller;

function getController(): TCreateUsuarioController;

implementation

uses Models.DaoGeneric, Usuario.Entity, CreateUsuario.UseCase;

function getController(): TCreateUsuarioController;
var
  DaoUsuario: iDAOGeneric<TUsuarios>;
  CreateUsuarioUseCase: TCreateUsuarioUseCase;
begin
  DaoUsuario := TDAOGeneric<TUsuarios>.Create;
  CreateUsuarioUseCase := TCreateUsuarioUseCase.Create(DaoUsuario);
  result := TCreateUsuarioController.Create(CreateUsuarioUseCase);
end;

end.
