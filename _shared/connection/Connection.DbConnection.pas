unit Connection.DbConnection;
interface
uses
  System.JSON,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  Data.DB,
  FireDAC.Comp.Client,
  Firedac.DApt,
  FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, 
  FireDAC.VCLUI.Wait,  
  FireDAC.Comp.UI,
  System.Generics.Collections, Winapi.Windows, SimpleQueryFiredac;
var
  FCursor: TFDGUIxWaitCursor;
  FDriver : TFDPhysMySQLDriverLink;
  FConnList : TObjectList<TFDConnection>;
function Connected : Integer;
procedure Disconnected(Index : Integer);
implementation

uses
  System.SysUtils;
function Connected : Integer;
var
  caminho: String;
  szFileName: array[0..MAX_PATH] of Char;
begin
  FillChar(szFileName, SizeOf(szFileName), #0);
  GetModuleFileName(hInstance, szFileName, MAX_PATH);

//  caminho := copy(szFileName, 1, pos('libmysql.dll', szFileName) -1);
    caminho := 'C:\Users\Usu�rio-008\Desktop\code\NFe Web\Server';

//  FCursor := TFDGUIxWaitCursor.Create(nil);
//  FCursor.ScreenCursor := gcrNone;
  
  FDriver := TFDPhysMySQLDriverLink.Create(nil);
  FDriver.VendorLib := caminho + '\libmysql.dll';

  if not Assigned(FConnList) then
    FConnList := TObjectList<TFDConnection>.Create;
  FConnList.Add(TFDConnection.Create(nil));
  Result := Pred(FConnList.Count);
  FConnList.Items[Result].Params.DriverID := 'MySQL';
  FConnList.Items[Result].Params.Database := 'bancao';
  FConnList.Items[Result].Params.UserName := 'softclever';
  FConnList.Items[Result].Params.Password := 'soft@1973';
  FConnList.Items[Result].Params.Values['Server'] := 'localhost';
  FConnList.Items[Result].Params.Values['Port'] := '3306';
  FConnList.Items[Result].Connected;
end;

procedure Disconnected(Index : Integer);
begin
  FConnList.Items[Index].Connected := False;
  FConnList.Items[Index].Free;
  FConnList.TrimExcess;
end;
end.
