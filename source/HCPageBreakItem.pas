{*******************************************************}
{                                                       }
{               HCView V1.0  作者：荆通                 }
{                                                       }
{      本代码遵循BSD协议，你可以加入QQ群 649023932      }
{            来获取更多的技术交流 2018-5-4              }
{                                                       }
{         文档PageBreakItem(分页）对象实现单元          }
{                                                       }
{*******************************************************}

unit HCPageBreakItem;

interface

uses
  Windows, HCRectItem, HCStyle, HCCommon, HCCustomData;

type
  TPageBreakItem = class(THCCustomRectItem)
  protected
    function JustifySplit: Boolean; override;
    //function GetOffsetAt(const X: Integer): Integer; override;
  public
    constructor Create(const AOwnerData: THCCustomData); override;
  end;

implementation

{ TPageBreakItem }

constructor TPageBreakItem.Create(const AOwnerData: THCCustomData);
var
  vSize: TSize;
begin
  inherited Create(AOwnerData);
  StyleNo := THCStyle.RsPageBreak;

  if AOwnerData.Style.CurStyleNo > THCStyle.RsNull then
    AOwnerData.Style.TextStyles[AOwnerData.Style.CurStyleNo].ApplyStyle(AOwnerData.Style.DefCanvas)
  else
    AOwnerData.Style.TextStyles[0].ApplyStyle(AOwnerData.Style.DefCanvas);

  vSize := AOwnerData.Style.DefCanvas.TextExtent('字');

  Width := 0;
  Height := vSize.cy;
end;

{function TPageBreakItem.GetOffsetAt(const X: Integer): Integer;
begin
  if X < 0 then
    Result := OffsetBefor
  else
    Result := OffsetAfter;
end;}

function TPageBreakItem.JustifySplit: Boolean;
begin
  Result := False;
end;

end.
