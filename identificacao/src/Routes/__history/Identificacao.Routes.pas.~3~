unit Identificacao.Routes;

interface

uses
  Horse, Horse.JWT;

procedure Registry();

implementation

uses
  RefreshToken;

procedure Registry();
begin
  // REFRESH TOKEN
  THorse.Post('/token', RefreshToken.GetController.handle);
end;

end.
