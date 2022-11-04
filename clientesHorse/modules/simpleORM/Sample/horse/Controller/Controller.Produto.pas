unit Controller.Produto;

interface

uses
  Horse,
  System.JSON,
  IdHashMessageDigest;

procedure Registry(App : THorse);
procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);
procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

uses Model.DaoGeneric, Model.Entity.Produto;



procedure Registry(App : THorse);
begin
  App.Get('/produto', Get);
  App.Get('/produto/:id', GetID);
  App.Post('/produto', Insert);
  App.Put('/produto/:id', Update);
  App.Delete('/produto/:id', Delete);
end;

procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  FDAO : iDAOGeneric<TProduto>;
begin
  FDAO := TDAOGeneric<TProduto>.New;
  Res.Send<TJSonArray>(FDAO.Find);
end;

procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  FDAO : iDAOGeneric<TProduto>;
begin
  FDAO := TDAOGeneric<TProduto>.New;
  Res.Send<TJSONObject>(FDAO.Find(Req.Params.Items['id']));
end;

procedure Insert(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  FDAO : iDAOGeneric<TProduto>;
  vJSONResult : TJSONObject;
begin
  FDAO := TDAOGeneric<TProduto>.New;

  vJSONResult := FDAO.Insert(Req.Body<TJSONObject>);

  Res.Send<TJSONObject>(vJSONResult).Status(THTTPStatus.Created);;
end;

procedure Update(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  FDAO : iDAOGeneric<TProduto>;
begin
  FDAO := TDAOGeneric<TProduto>.New;
  Res.Send<TJSONObject>(FDAO.Update(Req.Body<TJSONObject>)).Status(THTTPStatus.Accepted);
end;

procedure Delete(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  FDAO : iDAOGeneric<TProduto>;
begin
  FDAO := TDAOGeneric<TProduto>.New;
  Res.Send<TJSONObject>(FDAO.Delete('GUUID', Req.Params.Items['id'])).Status(THTTPStatus.NoContent);
end;


end.
