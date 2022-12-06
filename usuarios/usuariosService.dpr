library usuariosService;

{$R *.res}

uses
  Horse,
  Horse.CORS,
  Horse.Logger,
  Horse.Jhonson,
  Horse.GBSwagger,
  Horse.HandleException,
  Horse.JWT,
  Horse.Provider.Console,
  Usuario.Entity in 'src\Entities\Usuario.Entity.pas',
  Service.Utils in '..\_shared\utils\Service.Utils.pas',
  Connection.DbConnection in '..\_shared\connection\Connection.DbConnection.pas',
  Models.DaoGeneric in '..\_shared\connection\Models.DaoGeneric.pas',
  Usuarios.Routes in 'src\Routes\Usuarios.Routes.pas',
  CreateUsuario.Controller in 'src\UseCases\CreateUsuario\CreateUsuario.Controller.pas',
  CreateUsuario in 'src\UseCases\CreateUsuario\CreateUsuario.pas',
  CreateUsuario.UseCase in 'src\UseCases\CreateUsuario\CreateUsuario.UseCase.pas',
  DeleteUsuario.Controller in 'src\UseCases\DeleteUsuario\DeleteUsuario.Controller.pas',
  DeleteUsuario in 'src\UseCases\DeleteUsuario\DeleteUsuario.pas',
  DeleteUsuario.UseCase in 'src\UseCases\DeleteUsuario\DeleteUsuario.UseCase.pas',
  GetAllUsuarios.Controller in 'src\UseCases\GetAllUsuarios\GetAllUsuarios.Controller.pas',
  GetAllUsuarios in 'src\UseCases\GetAllUsuarios\GetAllUsuarios.pas',
  GetAllUsuarios.UseCase in 'src\UseCases\GetAllUsuarios\GetAllUsuarios.UseCase.pas',
  GetUsuarioById.Controller in 'src\UseCases\GetUsuarioById\GetUsuarioById.Controller.pas',
  GetUsuarioById in 'src\UseCases\GetUsuarioById\GetUsuarioById.pas',
  GetUsuarioById.UseCase in 'src\UseCases\GetUsuarioById\GetUsuarioById.UseCase.pas',
  UpdateUsuario.Controller in 'src\UseCases\UpdateUsuario\UpdateUsuario.Controller.pas',
  UpdateUsuario in 'src\UseCases\UpdateUsuario\UpdateUsuario.pas',
  UpdateUsuario.UseCase in 'src\UseCases\UpdateUsuario\UpdateUsuario.UseCase.pas',
  Login in 'src\UseCases\Login\Login.pas',
  Login.Controller in 'src\UseCases\Login\Login.Controller.pas',
  Login.UseCase in 'src\UseCases\Login\Login.UseCase.pas',
  Auth.Token in '..\_shared\auth\Auth.Token.pas',
  Auth.Middleware in '..\_shared\auth\Auth.Middleware.pas',
  Cadastro.Controller in 'src\UseCases\Cadastro\Cadastro.Controller.pas',
  Cadastro in 'src\UseCases\Cadastro\Cadastro.pas',
  Cadastro.UseCase in 'src\UseCases\Cadastro\Cadastro.UseCase.pas',
  Validacoes.Utils in '..\_shared\utils\Validacoes.Utils.pas';

begin
  THorse
    .Use(CORS)
    .Use(Jhonson())
    .Use(HandleException)
    .Use(THorseLoggerManager.HorseCallback())
    .Use(HorseJWT(
      TAuthToken.senhaToken,
      THorseJWTConfig.New.SkipRoutes(['login', 'cadastro'])));

  Usuarios.Routes.Registry();

  THorse.Listen;

end.
