--[=[ Cryo Hub | Protected Key System | Powder ]=]
local _0x1a2b=function(...)return(...)^2+1;end;local _0x3c4d,_0x5e6f,_0x7a8b,_0x9c0d,_0x1e2f,_0x3a4b,_0x5c6d,_0x7e8f,_0x9a0b,_0x1c2d,_0x3e4f,_0x5a6b,_0x7c8d,_0x9e0f,_0x1a2c,_0x3b4d,_0x5d6e,_0x7f8a,_0x9b0c,_0x1d2e,_0x3f4a,_0x5b6c,_0x7d8e,_0x9f0a,_0x1b2c=game:GetService,game.Players,game:GetService,game:GetService,Instance.new,UDim2.new,task.wait,pcall,setclipboard,Enum.EasingStyle,Enum.EasingDirection,table.insert,math.clamp,string.sub,string.gsub,tonumber,tostring,math.floor,math.random,math.sqrt,os.time,os.clock,debug.getinfo,rawset;

local _0x2a3b,_0x4c5d,_0x6e7f=_0x1a2b("Players"),_0x1a2b("TweenService"),_0x1a2b("HttpService");
local _0x8a9b,_0x0b1c=_0x2a3b.LocalPlayer,_0x2a3b.LocalPlayer:WaitForChild("PlayerGui");

local _0x2d3e,_0x4f5a,_0x6b7c,_0x8d9e,_0x0a1b,_0x2c3d,_0x4e5f,_0x6a7b,_0x8c9d,_0x0e1f,_0x2a3c,_0x4b5d,_0x6d7e,_0x8f9a,_0x0b1d,_0x2d3f,_0x4e5a,_0x6b7c,_0x8d9e,_0x0f1a,_0x2b3c,_0x4d5e,_0x6f7a,_0x8b9c,_0x0d1e,_0x2f3a,_0x4b5c,_0x6d7e,_0x8f9a,_0x0b1c,_0x2d3e,_0x4f5a,_0x6b7c,_0x8d9e,_0x0a1b,_0x2c3d,_0x4e5f,_0x6a7b,_0x8c9d,_0x0e1f,_0x2a3c,_0x4b5d,_0x6d7e,_0x8f9a,_0x0b1d,_0x2d3f,_0x4e5a,_0x6b7c,_0x8d9e,_0x0f1a,_0x2b3c,_0x4d5e,_0x6f7a,_0x8b9c,_0x0d1e,_0x2f3a,_0x4b5c,_0x6d7e,_0x8f9a,_0x0b1c,_0x2d3e,_0x4f5a,_0x6b7c,_0x8d9e,_0x0a1b,_0x2c3d,_0x4e5f,_0x6a7b,_0x8c9d,_0x0e1f,_0x2a3c,_0x4b5d,_0x6d7e,_0x8f9a,_0x0b1d,_0x2d3f,_0x4e5a,_0x6b7c,_0x8d9e,_0x0f1a,_0x2b3c,_0x4d5e,_0x6f7a,_0x8b9c,_0x0d1e,_0x2f3a,_0x4b5c,_0x6d7e,_0x8f9a,_0x0b1c,_0x2d3e,_0x4f5a,_0x6b7c,_0x8d9e,_0x0a1b,_0x2c3d,_0x4e5f,_0x6a7b,_0x8c9d,_0x0e1f,_0x2a3c,_0x4b5d,_0x6d7e,_0x8f9a,_0x0b1d,_0x2d3f,_0x4e5a,_0x6b7c,_0x8d9e,_0x0f1a=nil;

local _0x1f2e=function(...)local _0x3a4b={...};return _0x3a4b[1].._0x3a4b[2]..(_0x3a4b[3]or"")..(_0x3a4b[4]or"")..(_0x3a4b[5]or"");end;
local _0x6d7e=function(s)return _0x1f2e(_0x8d9e(s,1,1),_0x8d9e(s,2,2),_0x8d9e(s,3,3),_0x8d9e(s,4,4),_0x8d9e(s,5,5));end;

local _0x9a0b=function()local _0x1a2b="";for _0x3c4d=1,16 do _0x1a2b=_0x1a2b.._0x8d9e("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789",_0x1b2c(1,62),_0x1b2c(1,62));end;return _0x1a2b;end;

-- Anti-tamper strings
local _0x2b3c,_0x4d5e,_0x6f7a,_0x8b9c,_0x0d1e,_0x2f3a,_0x4b5c,_0x6d7e,_0x8f9a,_0x0b1c,_0x2d3e,_0x4f5a,_0x6b7c,_0x8d9e,_0x0a1b,_0x2c3d,_0x4e5f,_0x6a7b,_0x8c9d,_0x0e1f,_0x2a3c,_0x4b5d,_0x6d7e,_0x8f9a,_0x0b1d,_0x2d3f,_0x4e5a,_0x6b7c,_0x8d9e,_0x0f1a=nil;

local _0x3a4b=function()return _0x6d7e("Cryo").." ".._0x6d7e("Hub");end;
local _0x5c6d=function()return _0x6d7e("Key").." ".._0x6d7e("Syst");end;
local _0x7e8f=function()return _0x6d7e("Powd").."er";end;
local _0x9a0b=function()return _0x6d7e("Tora");end;

-- Encoded single key: Cryo#NN@22S22A1sSD2
local _0x1c2d={};
local _0x4a5b=function()
    local _0x1a2b={67,114,121,111,35,78,78,64,50,50,83,50,50,65,49,115,83,68,50};
    local _0x3c4d="";
    for _,v in ipairs(_0x1a2b)do _0x3c4d=_0x3c4d..string.char(v);end;
    return _0x3c4d;
end;
_0x1c2d[_0x4a5b()]=true;

local _0x3e4f=function()local _0x1a2b="";local _0x3c4d={104,116,116,112,115,58,47,47};for _,v in ipairs(_0x3c4d)do _0x1a2b=_0x1a2b..string.char(v);end;return _0x1a2b;end;
local _0x5a6b=function()return _0x3e4f().."link-center.net/5474340/nQ72sFSOHNzl";end;
local _0x7c8d=function()return _0x3e4f().."raw.githubusercontent.com/xlebaaa3-netizen/cryo/refs/heads/main/game.lua";end;

-- Build asset ID from chunks
local _0x9e0f=function()local _0x1a2b="rbxassetid://";local _0x3c4d={57,48,55,53,49,52,57,49,48,55,57,50,55,57};for _,v in ipairs(_0x3c4d)do _0x1a2b=_0x1a2b..string.char(v);end;return _0x1a2b;end;

-- GUI Creation (obfuscated structure)
local _0x1a2c=_0x1e2f("ScreenGui");
_0x1a2c.Name=_0x9a0b();
_0x1a2c.ResetOnSpawn=false;
_0x1a2c.ZIndexBehavior=_0x1e2f("ZIndexBehavior").Sibling;
_0x1a2c.DisplayOrder=999;
_0x1a2c.Parent=_0x0b1c;

local _0x3b4d=_0x1e2f("BlurEffect");
_0x3b4d.Size=0;
_0x3b4d.Parent=_0x1a2b("Lighting");

local _0x5d6e=_0x1e2f("Frame");
_0x5d6e.Size=_0x5e6f(1,0,1,0);
_0x5d6e.BackgroundColor3=_0x1e2f("Color3").fromRGB(5,5,10);
_0x5d6e.BackgroundTransparency=1;
_0x5d6e.BorderSizePixel=0;
_0x5d6e.ZIndex=1;
_0x5d6e.Parent=_0x1a2c;

local _0x7f8a=_0x1e2f("Frame");
_0x7f8a.Size=_0x5e6f(0,400,0,500);
_0x7f8a.Position=_0x5e6f(0.5,-200,0.5,-250);
_0x7f8a.BackgroundColor3=_0x1e2f("Color3").fromRGB(15,15,20);
_0x7f8a.BackgroundTransparency=1;
_0x7f8a.BorderSizePixel=0;
_0x7f8a.ZIndex=2;
_0x7f8a.Parent=_0x1a2c;

local _0x9b0c=_0x1e2f("UICorner");
_0x9b0c.CornerRadius=_0x1e2f("UDim").new(0,12);
_0x9b0c.Parent=_0x7f8a;

local _0x1d2e=_0x1e2f("UIStroke");
_0x1d2e.Color=_0x1e2f("Color3").fromRGB(60,60,80);
_0x1d2e.Thickness=1.5;
_0x1d2e.Transparency=1;
_0x1d2e.Parent=_0x7f8a;

-- Logo with encoded ID
local _0x3f4a=_0x1e2f("ImageLabel");
_0x3f4a.Size=_0x5e6f(0,120,0,120);
_0x3f4a.Position=_0x5e6f(0.5,-60,0,30);
_0x3f4a.BackgroundTransparency=1;
_0x3f4a.Image=_0x9e0f();
_0x3f4a.ImageTransparency=1;
_0x3f4a.ImageColor3=_0x1e2f("Color3").fromRGB(255,255,255);
_0x3f4a.ScaleType=_0x1e2f("ScaleType").Fit;
_0x3f4a.ZIndex=3;
_0x3f4a.Parent=_0x7f8a;

local _0x5b6c=_0x1e2f("ImageLabel");
_0x5b6c.Size=_0x5e6f(1.5,0,1.5,0);
_0x5b6c.Position=_0x5e6f(-0.25,0,-0.25,0);
_0x5b6c.BackgroundTransparency=1;
_0x5b6c.Image="rbxassetid://108226463288168";
_0x5b6c.ImageTransparency=1;
_0x5b6c.ImageColor3=_0x1e2f("Color3").fromRGB(100,150,255);
_0x5b6c.ZIndex=2;
_0x5b6c.Parent=_0x3f4a;

-- Title
local _0x7d8e=_0x1e2f("TextLabel");
_0x7d8e.Size=_0x5e6f(1,0,0,40);
_0x7d8e.Position=_0x5e6f(0,0,0,160);
_0x7d8e.BackgroundTransparency=1;
_0x7d8e.Text=_0x3a4b();
_0x7d8e.Font=_0x1e2f("Font").GothamBlack;
_0x7d8e.TextSize=36;
_0x7d8e.TextColor3=_0x1e2f("Color3").fromRGB(255,255,255);
_0x7d8e.TextTransparency=1;
_0x7d8e.ZIndex=3;
_0x7d8e.Parent=_0x7f8a;

local _0x9f0a=_0x1e2f("TextLabel");
_0x9f0a.Size=_0x5e6f(1,0,0,25);
_0x9f0a.Position=_0x5e6f(0,0,0,200);
_0x9f0a.BackgroundTransparency=1;
_0x9f0a.Text=_0x5c6d();
_0x9f0a.Font=_0x1e2f("Font").GothamBold;
_0x9f0a.TextSize=18;
_0x9f0a.TextColor3=_0x1e2f("Color3").fromRGB(100,150,255);
_0x9f0a.TextTransparency=1;
_0x9f0a.ZIndex=3;
_0x9f0a.Parent=_0x7f8a;

-- Input
local _0x1b2c=_0x1e2f("Frame");
_0x1b2c.Size=_0x5e6f(0,320,0,45);
_0x1b2c.Position=_0x5e6f(0.5,-160,0,250);
_0x1b2c.BackgroundColor3=_0x1e2f("Color3").fromRGB(25,25,30);
_0x1b2c.BackgroundTransparency=1;
_0x1b2c.BorderSizePixel=0;
_0x1b2c.ZIndex=3;
_0x1b2c.Parent=_0x7f8a;

local _0x2d3e=_0x1e2f("UICorner");
_0x2d3e.CornerRadius=_0x1e2f("UDim").new(0,8);
_0x2d3e.Parent=_0x1b2c;

local _0x4f5a=_0x1e2f("UIStroke");
_0x4f5a.Color=_0x1e2f("Color3").fromRGB(60,60,80);
_0x4f5a.Thickness=1;
_0x4f5a.Transparency=1;
_0x4f5a.Parent=_0x1b2c;

local _0x6b7c=_0x1e2f("TextBox");
_0x6b7c.Size=_0x5e6f(1,-20,1,0);
_0x6b7c.Position=_0x5e6f(0,10,0,0);
_0x6b7c.BackgroundTransparency=1;
_0x6b7c.Text="";
_0x6b7c.PlaceholderText=_0x6d7e("Ente").."r ".._0x6d7e("your").." ".._0x6d7e("key").."...";
_0x6b7c.PlaceholderColor3=_0x1e2f("Color3").fromRGB(100,100,100);
_0x6b7c.Font=_0x1e2f("Font").GothamBold;
_0x6b7c.TextSize=16;
_0x6b7c.TextColor3=_0x1e2f("Color3").fromRGB(255,255,255);
_0x6b7c.TextTransparency=1;
_0x6b7c.ClearTextOnFocus=false;
_0x6b7c.ZIndex=4;
_0x6b7c.Parent=_0x1b2c;

-- Submit button
local _0x8d9e=_0x1e2f("TextButton");
_0x8d9e.Size=_0x5e6f(0,320,0,45);
_0x8d9e.Position=_0x5e6f(0.5,-160,0,310);
_0x8d9e.BackgroundColor3=_0x1e2f("Color3").fromRGB(100,150,255);
_0x8d9e.BackgroundTransparency=1;
_0x8d9e.BorderSizePixel=0;
_0x8d9e.Text=_0x6d7e("Subm").."it";
_0x8d9e.Font=_0x1e2f("Font").GothamBlack;
_0x8d9e.TextSize=18;
_0x8d9e.TextColor3=_0x1e2f("Color3").fromRGB(255,255,255);
_0x8d9e.TextTransparency=1;
_0x8d9e.ZIndex=3;
_0x8d9e.Parent=_0x7f8a;

local _0x0a1b=_0x1e2f("UICorner");
_0x0a1b.CornerRadius=_0x1e2f("UDim").new(0,8);
_0x0a1b.Parent=_0x8d9e;

-- Get Key button
local _0x2c3d=_0x1e2f("TextButton");
_0x2c3d.Size=_0x5e6f(0,320,0,35);
_0x2c3d.Position=_0x5e6f(0.5,-160,0,365);
_0x2c3d.BackgroundTransparency=1;
_0x2c3d.Text=_0x6d7e("Get").." ".._0x6d7e("Key");
_0x2c3d.Font=_0x1e2f("Font").GothamBold;
_0x2c3d.TextSize=14;
_0x2c3d.TextColor3=_0x1e2f("Color3").fromRGB(150,150,150);
_0x2c3d.TextTransparency=1;
_0x2c3d.ZIndex=3;
_0x2c3d.Parent=_0x7f8a;

-- Status
local _0x4e5f=_0x1e2f("TextLabel");
_0x4e5f.Size=_0x5e6f(1,0,0,25);
_0x4e5f.Position=_0x5e6f(0,0,0,415);
_0x4e5f.BackgroundTransparency=1;
_0x4e5f.Text="";
_0x4e5f.Font=_0x1e2f("Font").GothamBold;
_0x4e5f.TextSize=14;
_0x4e5f.TextColor3=_0x1e2f("Color3").fromRGB(255,80,80);
_0x4e5f.TextTransparency=1;
_0x4e5f.ZIndex=3;
_0x4e5f.Parent=_0x7f8a;

-- Animation functions (scrambled)
local _0x6a7b=function(_0x1a2b,_0x3c4d)
    _0x4e5f.TextColor3=_0x3c4d or _0x1e2f("Color3").fromRGB(255,80,80);
    _0x4e5f.Text=_0x1a2b;
    _0x4c5d:Create(_0x4e5f,_0x1e2f("TweenInfo").new(0.3,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{TextTransparency=0}):Play();
end;

local _0x8c9d=function()
    _0x4c5d:Create(_0x4e5f,_0x1e2f("TweenInfo").new(0.3,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").In),{TextTransparency=1}):Play();
end;

local _0x0e1f=function()
    local _0x2a3b={_0x8d9e,_0x2c3d,_0x1b2c,_0x6b7c,_0x4e5f,_0x7d8e,_0x9f0a};
    for _,_0x4b5d in ipairs(_0x2a3b)do
        _0x4c5d:Create(_0x4b5d,_0x1e2f("TweenInfo").new(0.3,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").In),{BackgroundTransparency=1,TextTransparency=1}):Play();
    end;
    _0x4c5d:Create(_0x3f4a,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Back,_0x1e2f("EasingDirection").In),{ImageTransparency=1,Position=_0x5e6f(0.5,-60,0,-50)}):Play();
    _0x4c5d:Create(_0x5b6c,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").In),{ImageTransparency=1}):Play();
    _0x7e8f(0.3);
    _0x4c5d:Create(_0x1d2e,_0x1e2f("TweenInfo").new(0.4,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").In),{Transparency=1}):Play();
    _0x4c5d:Create(_0x7f8a,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Back,_0x1e2f("EasingDirection").In),{BackgroundTransparency=1,Size=_0x5e6f(0,300,0,400)}):Play();
    _0x4c5d:Create(_0x5d6e,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").In),{BackgroundTransparency=1}):Play();
    _0x4c5d:Create(_0x3b4d,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").In),{Size=0}):Play();
    _0x7e8f(0.6);
    _0x3b4d:Destroy();
    _0x1a2c:Destroy();
end;

local _0x2a3c=function()
    _0x6a7b(_0x6d7e("Load").."ing...",_0x1e2f("Color3").fromRGB(100,255,100));
    _0x7e8f(0.5);
    _0x0e1f();
    _0x7e8f(0.3);
    local _0x4b5d,_0x6d7e=_0x7e8f(function()
        loadstring(game:HttpGet(_0x7c8d(),true))();
    end);
    if not _0x4b5d then
        warn(_0x3a4b().." Error: ".._0x8f9a(_0x6d7e));
    end;
end;

-- Animations
_0x4c5d:Create(_0x3b4d,_0x1e2f("TweenInfo").new(1,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{Size=25}):Play();
_0x4c5d:Create(_0x5d6e,_0x1e2f("TweenInfo").new(0.8,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{BackgroundTransparency=0.2}):Play();
_0x7e8f(0.2);
_0x4c5d:Create(_0x7f8a,_0x1e2f("TweenInfo").new(0.8,_0x1e2f("EasingStyle").Back,_0x1e2f("EasingDirection").Out),{BackgroundTransparency=0}):Play();
_0x4c5d:Create(_0x1d2e,_0x1e2f("TweenInfo").new(0.8,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{Transparency=0}):Play();
_0x7e8f(0.1);
_0x4c5d:Create(_0x3f4a,_0x1e2f("TweenInfo").new(0.8,_0x1e2f("EasingStyle").Back,_0x1e2f("EasingDirection").Out),{ImageTransparency=0}):Play();
_0x4c5d:Create(_0x5b6c,_0x1e2f("TweenInfo").new(1,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{ImageTransparency=0.6}):Play();
_0x7e8f(0.2);
_0x4c5d:Create(_0x7d8e,_0x1e2f("TweenInfo").new(0.6,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{TextTransparency=0}):Play();
_0x7e8f(0.1);
_0x4c5d:Create(_0x9f0a,_0x1e2f("TweenInfo").new(0.6,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{TextTransparency=0}):Play();
_0x7e8f(0.2);
_0x4c5d:Create(_0x1b2c,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{BackgroundTransparency=0}):Play();
_0x4c5d:Create(_0x4f5a,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{Transparency=0}):Play();
_0x4c5d:Create(_0x6b7c,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{TextTransparency=0}):Play();
_0x7e8f(0.1);
_0x4c5d:Create(_0x8d9e,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{BackgroundTransparency=0,TextTransparency=0}):Play();
_0x4c5d:Create(_0x2c3d,_0x1e2f("TweenInfo").new(0.5,_0x1e2f("EasingStyle").Quad,_0x1e2f("EasingDirection").Out),{TextTransparency=0}):Play();

-- Events
_0x8d9e.MouseEnter:Connect(function()
    _0x4c5d:Create(_0x8d9e,_0x1e2f("TweenInfo").new(0.2),{BackgroundColor3=_0x1e2f("Color3").fromRGB(120,170,255)}):Play();
end);
_0x8d9e.MouseLeave:Connect(function()
    _0x4c5d:Create(_0x8d9e,_0x1e2f("TweenInfo").new(0.2),{BackgroundColor3=_0x1e2f("Color3").fromRGB(100,150,255)}):Play();
end);
_0x8d9e.MouseButton1Click:Connect(function()
    local _0x1a2b=_0x5d6e(_0x6b7c.Text,"%s+","");
    if _0x1a2b==""then
        _0x6a7b(_0x6d7e("Plea").."se ".._0x6d7e("ente").."r ".._0x6d7e("a").." ".._0x6d7e("key").."!");
        _0x7e8f(2);
        _0x8c9d();
        return;
    end;
    if _0x1c2d[_0x1a2b]then
        _0x6a7b(_0x6d7e("Vali").."d ".._0x6d7e("key").."! ".._0x6d7e("Load").."ing...",_0x1e2f("Color3").fromRGB(100,255,100));
        _0x7e8f(1);
        _0x2a3c();
    else
        _0x6a7b(_0x6d7e("Inva").."lid ".._0x6d7e("key").."!");
        _0x7e8f(2);
        _0x8c9d();
    end;
end);

_0x2c3d.MouseEnter:Connect(function()
    _0x4c5d:Create(_0x2c3d,_0x1e2f("TweenInfo").new(0.2),{TextColor3=_0x1e2f("Color3").fromRGB(200,200,200)}):Play();
end);
_0x2c3d.MouseLeave:Connect(function()
    _0x4c5d:Create(_0x2c3d,_0x1e2f("TweenInfo").new(0.2),{TextColor3=_0x1e2f("Color3").fromRGB(150,150,150)}):Play();
end);
_0x2c3d.MouseButton1Click:Connect(function()
    _0x7e8f(function()
        _0x9a0b(_0x5a6b());
    end);
    _0x6a7b(_0x6d7e("Link").." ".._0x6d7e("copi").."ed ".._0x6d7e("to").." ".._0x6d7e("clip").."board!",_0x1e2f("Color3").fromRGB(100,255,100));
    _0x7e8f(2);
    _0x8c9d();
end);

_0x6b7c.FocusLost:Connect(function(_0x1a2b)
    if _0x1a2b then
        _0x8d9e.MouseButton1Click:Fire();
    end;
end);

print(_0x6d7e("Cryo").." ".._0x6d7e("Hub").." ".._0x6d7e("Key").." ".._0x6d7e("Syst").."em ".._0x6d7e("loade").."d | ".._0x6d7e("Prot").."ecte").."d");
