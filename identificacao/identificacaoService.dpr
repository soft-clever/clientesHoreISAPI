library identificacaoService;

uses
  Horse,
  Horse.CORS,
  Horse.Compression,
  Horse.Jhonson,
  Horse.OctetStream,
  Horse.JWT,
  Horse.HandleException,
  Horse.Logger,
  Horse.BasicAuthentication,
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
  Usuario.Entity in '..\usuarios\src\Entities\Usuario.Entity.pas';

begin
  THorse
    .Use(CORS)
    .Use(Jhonson())
    .Use(HandleException)
    .Use(THorseLoggerManager.HorseCallback())
    .Use(HorseJWT(TAuthToken.senhaToken, THorseJWTConfig.New.SessionClass.Create));

//  THorse.Use(HorseJWT(TAuthToken.senhaToken,
//    THorseJWTConfig.New.SkipRoutes(['login', 'cadastro'])));
// THorse.Use(TAuthMiddleware.verfTokens);

  Identificacao.Routes.Registry();

  THorse.Listen;

end.
