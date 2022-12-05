library empresasService;

uses
  Horse,
  Horse.CORS,
  Horse.Jhonson,
  Horse.JWT,
  Horse.HandleException;

begin
  THorse.Use(CORS).Use(Jhonson()).Use(HorseJWT('MY-PASSWORD'))
    .Use(HandleException);

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('pong');
    end);

  THorse.Listen;

end.
