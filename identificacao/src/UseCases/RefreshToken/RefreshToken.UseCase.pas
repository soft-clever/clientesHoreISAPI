unit RefreshToken.UseCase;

interface

uses
  Models.DaoGeneric, System.Generics.Collections,
  Usuario.Entity, System.SysUtils, System.JSON, REST.JSON, Validacoes.Utils,
  Horse.Exception, Service.Utils, JOSE.Core.JWK, JOSE.Core.JWT,
  JOSE.Core.Builder, Auth.Token, Horse;

type
  iRefreshTokenUseCase = interface
    ['{8db7119b-f8a4-4e26-adf7-79364dc12f61}']
    function execute(compactToken: string): string;
  end;

  TRefreshTokenUseCase = class(TInterfacedObject, iRefreshTokenUseCase)
  private
    FDAOUsuarios: iDAOGeneric<TUsuarios>;
  public
    constructor Create(Value: iDAOGeneric<TUsuarios>);
    function execute(compactToken: string): string;
  end;

implementation

constructor TRefreshTokenUseCase.Create(Value: iDAOGeneric<TUsuarios>);
begin
  FDAOUsuarios := Value;
end;

function TRefreshTokenUseCase.execute(compactToken: string): string;
var
  LKey: TJWK;
  LToken: TJWT;
  teste: string;
begin
  LKey := TJWK.Create(TAuthToken.senhaToken);
  LToken := TJOSE.Verify(LKey, compactToken);

  try
    if LToken.Verified then
    begin
      teste := LToken.Claims.Clone.ToJSON;
    end
    else
      raise EHorseException.New.Error('Unauthorized')
        .Status(THTTPStatus.Unauthorized);
  finally
    LToken.Free;
  end;
end;

end.
