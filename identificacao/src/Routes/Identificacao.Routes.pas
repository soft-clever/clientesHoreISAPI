unit Identificacao.Routes;

interface

uses
  Horse, Horse.JWT;

procedure Registry();

implementation

uses
  RefreshToken, Login, Cadastro;

procedure Registry();
begin
  // LOGIN
  THorse.Post('/login', Login.GetController.handle);
  // CADASTRO
  THorse.Post('/cadastro', Cadastro.GetController.handle);
  // REFRESH TOKEN
  THorse.Post('/token', RefreshToken.GetController.handle);
end;

end.
