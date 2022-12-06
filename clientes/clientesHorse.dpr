library clientesHorse;

uses
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  Horse.GBSwagger,
  Horse.HandleException,
  Service.Utils in 'src\Services\Service.Utils.pas',
  Endereco.Entity in 'src\Modulos\Clientes\Models\Entities\Endereco.Entity.pas',
  Models.Entities.Cliente in 'src\Modulos\Clientes\Models\Entities\Models.Entities.Cliente.pas',
  Connection.DbConnection in 'src\Connection\Connection.DbConnection.pas',
  Models.DaoGeneric in 'src\Connection\Models.DaoGeneric.pas' {/  Horse.Compression,},
  Route.Clientes in 'src\Modulos\Clientes\Routes\Route.Clientes.pas',
  UpdateCliente.Controller in 'src\Modulos\Clientes\UseCases\Clientes\UpdateCliente\UpdateCliente.Controller.pas',
  UpdateCliente in 'src\Modulos\Clientes\UseCases\Clientes\UpdateCliente\UpdateCliente.pas',
  UpdateCliente.UseCase in 'src\Modulos\Clientes\UseCases\Clientes\UpdateCliente\UpdateCliente.UseCase.pas',
  ListAllClientes.Controller in 'src\Modulos\Clientes\UseCases\Clientes\ListAllClientes\ListAllClientes.Controller.pas',
  ListAllClientes in 'src\Modulos\Clientes\UseCases\Clientes\ListAllClientes\ListAllClientes.pas',
  ListAllClientes.UseCase in 'src\Modulos\Clientes\UseCases\Clientes\ListAllClientes\ListAllClientes.UseCase.pas',
  DeleteCliente.Controller in 'src\Modulos\Clientes\UseCases\Clientes\DeleteCliente\DeleteCliente.Controller.pas',
  DeleteCliente in 'src\Modulos\Clientes\UseCases\Clientes\DeleteCliente\DeleteCliente.pas',
  DeleteCliente.UseCase in 'src\Modulos\Clientes\UseCases\Clientes\DeleteCliente\DeleteCliente.UseCase.pas',
  CreateCliente.Controller in 'src\Modulos\Clientes\UseCases\Clientes\CreateCliente\CreateCliente.Controller.pas',
  CreateCliente in 'src\Modulos\Clientes\UseCases\Clientes\CreateCliente\CreateCliente.pas',
  CreateCliente.UseCase in 'src\Modulos\Clientes\UseCases\Clientes\CreateCliente\CreateCliente.UseCase.pas',
  ClienteById.Controller in 'src\Modulos\Clientes\UseCases\Clientes\ClienteByID\ClienteById.Controller.pas',
  ClienteById in 'src\Modulos\Clientes\UseCases\Clientes\ClienteByID\ClienteById.pas',
  ClienteById.UseCase in 'src\Modulos\Clientes\UseCases\Clientes\ClienteByID\ClienteById.UseCase.pas';

//  Horse.Compression,
//  Horse.OctetStream,
//  Horse.JWT,
//  Horse.Logger,
//  Horse.BasicAuthentication;


begin
//  ReportMemoryLeaksOnShutdown := True;

  THorse
    .Use(CORS)
//    .Use(Compression()) // Must come before Jhonson middleware
    .Use(Jhonson())
//    .Use(OctetStream)
//    .Use(HorseJWT('MY-PASSWORD'))
    .Use(HandleException);
//    .Use(THorseLoggerManager.HorseCallback())
//    .Use(HorseBasicAuthentication(
//      function(const AUsername, APassword: string): Boolean
//        begin
//            Result := AUsername.Equals('user') and APassword.Equals('password');
//              end));

  Swagger
    .Info
      .Title('API de Cadastro de Clientes')
      .Description('Realiza operações CRUD')
      .Contact
        .Name('Soft Clever')
        .URL('https://www.github.com/soft-clever')
      .&End
    .&End;

  Route.CLientes.Registry();

  THorse.Listen;
end.