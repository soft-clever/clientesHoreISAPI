library identificacaoService;

uses
  Horse,
  Horse.JWT,
  Horse.CORS,
  Horse.Logger,
  Horse.Jhonson,
  Horse.HandleException,
  Identificacao.Routes in 'src\Routes\Identificacao.Routes.pas',
  RefreshToken in 'src\UseCases\RefreshToken\RefreshToken.pas',
  RefreshToken.Controller in 'src\UseCases\RefreshToken\RefreshToken.Controller.pas',
  RefreshToken.UseCase in 'src\UseCases\RefreshToken\RefreshToken.UseCase.pas',
  Service.Utils in '..\_shared\utils\Service.Utils.pas',
  Validacoes.Utils in '..\_shared\utils\Validacoes.Utils.pas',
  Auth.Middleware in '..\_shared\auth\Auth.Middleware.pas',
  Auth.Token in '..\_shared\auth\Auth.Token.pas',
  Connection.DbConnection in '..\_shared\connection\Connection.DbConnection.pas',
  Models.DaoGeneric in '..\_shared\connection\Models.DaoGeneric.pas',
  Usuario.Entity in '..\usuarios\src\Entities\Usuario.Entity.pas',
  Cadastro.Controller in 'src\UseCases\Cadastro\Cadastro.Controller.pas',
  Cadastro in 'src\UseCases\Cadastro\Cadastro.pas',
  Cadastro.UseCase in 'src\UseCases\Cadastro\Cadastro.UseCase.pas',
  Login.Controller in 'src\UseCases\Login\Login.Controller.pas',
  Login in 'src\UseCases\Login\Login.pas',
  Login.UseCase in 'src\UseCases\Login\Login.UseCase.pas';

begin
  THorse
    .Use(CORS)
    .Use(Jhonson())
    .Use(HandleException)
    .Use(THorseLoggerManager.HorseCallback())
    .Use(HorseJWT(TAuthToken.senhaToken,
      THorseJWTConfig.New.SkipRoutes(['login', 'cadastro'])));

  Identificacao.Routes.Registry();

  THorse.Listen;
end.
