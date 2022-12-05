library produtosService;

uses
  Horse,
  Horse.CORS,
  Horse.Logger,
  Horse.Jhonson,
  Horse.GBSwagger,
  Horse.HandleException,
  Service.Utils in '..\_shared\utils\Service.Utils.pas',
  Models.DaoGeneric in '..\_shared\connection\Models.DaoGeneric.pas',
  Connection.DbConnection in '..\_shared\connection\Connection.DbConnection.pas',
  Produto.Entity in 'src\Entities\Produto.Entity.pas',
  Produtos.Routes in 'src\Routes\Produtos.Routes.pas',
  GetAllProdutos in 'src\UseCases\GetAllProdutos\GetAllProdutos.pas',
  GetAllProdutos.Controller in 'src\UseCases\GetAllProdutos\GetAllProdutos.Controller.pas',
  GetAllProdutos.UseCase in 'src\UseCases\GetAllProdutos\GetAllProdutos.UseCase.pas',
  GetProdutoById.Controller in 'src\UseCases\GetProdutoById\GetProdutoById.Controller.pas',
  GetProdutoById in 'src\UseCases\GetProdutoById\GetProdutoById.pas',
  GetProdutoById.UseCase in 'src\UseCases\GetProdutoById\GetProdutoById.UseCase.pas',
  CreateProduto.Controller in 'src\UseCases\CreateProduto\CreateProduto.Controller.pas',
  CreateProduto in 'src\UseCases\CreateProduto\CreateProduto.pas',
  CreateProduto.UseCase in 'src\UseCases\CreateProduto\CreateProduto.UseCase.pas',
  UpdateProduto.Controller in 'src\UseCases\UpdateProduto\UpdateProduto.Controller.pas',
  UpdateProduto in 'src\UseCases\UpdateProduto\UpdateProduto.pas',
  UpdateProduto.UseCase in 'src\UseCases\UpdateProduto\UpdateProduto.UseCase.pas',
  DeleteProduto.Controller in 'src\UseCases\DeleteProduto\DeleteProduto.Controller.pas',
  DeleteProduto in 'src\UseCases\DeleteProduto\DeleteProduto.pas',
  DeleteProduto.UseCase in 'src\UseCases\DeleteProduto\DeleteProduto.UseCase.pas';

begin
  THorse
    .Use(CORS)
    .Use(Jhonson())
    .Use(HandleException)
    .Use(HorseSwagger)
    .Use(THorseLoggerManager.HorseCallback());

  Swagger
    .Info
      .Title('API de Cadastro de Produtos')
      .Description('Realiza operações CRUD')
      .Contact
        .Name('Soft Clever')
        .URL('https://www.github.com/soft-clever')
      .&End
    .&End;

  Produtos.Routes.Registry();

  THorse.Listen;
end.