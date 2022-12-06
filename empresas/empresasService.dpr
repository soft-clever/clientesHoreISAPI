library empresasService;

uses
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  Horse.JWT,
  Horse.HandleException,
  Service.Utils in '..\_shared\utils\Service.Utils.pas',
  Validacoes.Utils in '..\_shared\utils\Validacoes.Utils.pas',
  Connection.DbConnection in '..\_shared\connection\Connection.DbConnection.pas',
  Models.DaoGeneric in '..\_shared\connection\Models.DaoGeneric.pas',
  Auth.Token in '..\_shared\auth\Auth.Token.pas',
  Empresas.Routes in 'src\Routes\Empresas.Routes.pas',
  Empresa.Entity in 'src\Entities\Empresa.Entity.pas',
  GetAllEmpresas in 'src\UseCases\GetAllEmpresas\GetAllEmpresas.pas',
  GetAllEmpresas.Controller in 'src\UseCases\GetAllEmpresas\GetAllEmpresas.Controller.pas',
  GetAllEmpresas.UseCase in 'src\UseCases\GetAllEmpresas\GetAllEmpresas.UseCase.pas';

begin
  THorse
    .Use(CORS)
    .Use(Jhonson())
    .Use(HorseJWT(TAuthToken.senhaToken))
    .Use(HandleException);

  Empresas.Routes.Registry();
  THorse.Listen;
end.
