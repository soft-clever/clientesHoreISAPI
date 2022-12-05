unit RefreshToken;

interface

uses
  RefreshToken.Controller;

function GetController: TRefreshTokenController;

implementation

uses
  Models.DaoGeneric, Usuario.Entity, RefreshToken.UseCase;

function GetController: TRefreshTokenController;
var
  DaoUsuarios: iDAOGeneric<TUsuarios>;
  RefreshTokenUseCase: TRefreshTokenUseCase;
begin
  DaoUsuarios := TDAOGeneric<TUsuarios>.Create;

  RefreshTokenUseCase := TRefreshTokenUseCase.Create(DaoUsuarios);

  result := TRefreshTokenController.Create(RefreshTokenUseCase);
end;

end.
