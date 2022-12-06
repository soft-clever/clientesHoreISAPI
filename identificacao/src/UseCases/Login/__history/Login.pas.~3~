unit Login;

interface

uses
  Login.Controller;

function GetController: TLoginController;

implementation

uses
  Models.DaoGeneric, Usuario.Entity, Login.UseCase;

function GetController: TLoginController;
var
  DaoUsuarios: iDAOGeneric<TUsuarios>;
  LoginUseCase: TLoginUseCase;
begin
  DaoUsuarios := TDAOGeneric<TUsuarios>.Create;

  LoginUseCase := TLoginUseCase.Create(DaoUsuarios);

  result := TLoginController.Create(LoginUseCase);
end;

end.
