package;

import openfl.desktop.Clipboard;
import openfl.desktop.ClipboardFormats;
import openfl.desktop.ClipboardTransferMode;
#if !openfljs
import openfl.display.Application;
import openfl.display.AVM1Movie;
#end
import openfl.display.Bitmap;
import openfl.display.BitmapData;
import openfl.display.BitmapDataChannel;
import openfl.display.BlendMode;
import openfl.display.CairoRenderer;
import openfl.display.CanvasRenderer;
import openfl.display.CapsStyle;
import openfl.display.DisplayObject;
import openfl.display.DisplayObjectContainer;
import openfl.display.DisplayObjectRenderer;
import openfl.display.DisplayObjectShader;
import openfl.display.DOMElement;
import openfl.display.DOMRenderer;
import openfl.display.FPS;
import openfl.display.FrameLabel;
import openfl.display.GradientType;
import openfl.display.Graphics;
import openfl.display.GraphicsBitmapFill;
import openfl.display.GraphicsEndFill;
import openfl.display.GraphicsGradientFill;
import openfl.display.GraphicsShader;
import openfl.display.GraphicsShaderFill;
import openfl.display.GraphicsPath;
import openfl.display.GraphicsPathCommand;
import openfl.display.GraphicsPathWinding;
import openfl.display.GraphicsQuadPath;
import openfl.display.GraphicsSolidFill;
import openfl.display.GraphicsStroke;
import openfl.display.GraphicsTrianglePath;
import openfl.display.IBitmapDrawable;
import openfl.display.IGraphicsData;
import openfl.display.IGraphicsFill;
import openfl.display.IGraphicsPath;
import openfl.display.IGraphicsStroke;
import openfl.display.InteractiveObject;
import openfl.display.InterpolationMethod;
import openfl.display.ITileContainer;
import openfl.display.JointStyle;
import openfl.display.JPEGEncoderOptions;
import openfl.display.LineScaleMode;
import openfl.display.Loader;
import openfl.display.LoaderInfo;
import openfl.display.MovieClip;
import openfl.display.OpenGLRenderer;
import openfl.display.PixelSnapping;
import openfl.display.PNGEncoderOptions;
import openfl.display.Preloader;
import openfl.display.Shader;
import openfl.display.ShaderData;
import openfl.display.ShaderInput;
import openfl.display.ShaderJob;
import openfl.display.ShaderParameter;
import openfl.display.ShaderParameterType;
import openfl.display.ShaderPrecision;
import openfl.display.Shape;
import openfl.display.SimpleButton;
import openfl.display.SpreadMethod;
import openfl.display.Sprite;
import openfl.display.Stage;
import openfl.display.Stage3D;
import openfl.display.StageAlign;
import openfl.display.StageDisplayState;
import openfl.display.StageQuality;
import openfl.display.StageScaleMode;
import openfl.display.Tile;
import openfl.display.TileContainer;
import openfl.display.Tilemap;
import openfl.display.Tileset;
import openfl.display.TriangleCulling;
#if !openfljs
import openfl.display.Window;
#end
import openfl.display3D.textures.CubeTexture;
import openfl.display3D.textures.RectangleTexture;
import openfl.display3D.textures.Texture;
import openfl.display3D.textures.TextureBase;
import openfl.display3D.textures.VideoTexture;
import openfl.display3D.Context3D;
import openfl.display3D.Context3DBlendFactor;
import openfl.display3D.Context3DBufferUsage;
import openfl.display3D.Context3DClearMask;
import openfl.display3D.Context3DCompareMode;
import openfl.display3D.Context3DMipFilter;
import openfl.display3D.Context3DProfile;
import openfl.display3D.Context3DProgramType;
import openfl.display3D.Context3DRenderMode;
import openfl.display3D.Context3DStencilAction;
import openfl.display3D.Context3DTextureFilter;
import openfl.display3D.Context3DTextureFormat;
import openfl.display3D.Context3DTriangleFace;
import openfl.display3D.Context3DVertexBufferFormat;
import openfl.display3D.Context3DWrapMode;
import openfl.display3D.IndexBuffer3D;
import openfl.display3D.Program3D;
import openfl.display3D.VertexBuffer3D;
import openfl.errors.ArgumentError;
import openfl.errors.EOFError;
import openfl.errors.Error;
import openfl.errors.IllegalOperationError;
import openfl.errors.IOError;
import openfl.errors.RangeError;
import openfl.errors.SecurityError;
import openfl.errors.TypeError;
import openfl.events.AccelerometerEvent;
import openfl.events.ActivityEvent;
import openfl.events.AsyncErrorEvent;
import openfl.events.DataEvent;
import openfl.events.ErrorEvent;
import openfl.events.Event;
import openfl.events.EventDispatcher;
import openfl.events.EventPhase;
import openfl.events.FocusEvent;
import openfl.events.FullScreenEvent;
import openfl.events.GameInputEvent;
import openfl.events.HTTPStatusEvent;
import openfl.events.IEventDispatcher;
import openfl.events.IOErrorEvent;
import openfl.events.KeyboardEvent;
import openfl.events.MouseEvent;
import openfl.events.NetStatusEvent;
import openfl.events.ProgressEvent;
import openfl.events.RenderEvent;
import openfl.events.SampleDataEvent;
import openfl.events.SecurityErrorEvent;
import openfl.events.TextEvent;
import openfl.events.TimerEvent;
import openfl.events.TouchEvent;
import openfl.events.UncaughtErrorEvent;
import openfl.events.UncaughtErrorEvents;
import openfl.events.VideoTextureEvent;
import openfl.external.ExternalInterface;
import openfl.filters.BitmapFilter;
import openfl.filters.BitmapFilterQuality;
import openfl.filters.BitmapFilterShader;
import openfl.filters.BitmapFilterType;
import openfl.filters.BlurFilter;
import openfl.filters.ColorMatrixFilter;
import openfl.filters.ConvolutionFilter;
import openfl.filters.DropShadowFilter;
import openfl.filters.GlowFilter;
import openfl.filters.ShaderFilter;
import openfl.geom.ColorTransform;
import openfl.geom.Matrix;
import openfl.geom.Matrix3D;
import openfl.geom.Orientation3D;
import openfl.geom.PerspectiveProjection;
import openfl.geom.Point;
import openfl.geom.Rectangle;
import openfl.geom.Transform;
import openfl.geom.Utils3D;
import openfl.geom.Vector3D;
import openfl.media.ID3Info;
import openfl.media.Sound;
import openfl.media.SoundChannel;
import openfl.media.SoundLoaderContext;
import openfl.media.SoundMixer;
import openfl.media.SoundTransform;
import openfl.media.Video;
import openfl.net.FileFilter;
import openfl.net.FileReference;
import openfl.net.FileReferenceList;
import openfl.net.NetConnection;
import openfl.net.NetStream;
import openfl.net.ObjectEncoding;
import openfl.net.SharedObject;
import openfl.net.SharedObjectFlushStatus;
import openfl.net.Socket;
import openfl.net.URLLoader;
import openfl.net.URLLoaderDataFormat;
import openfl.net.URLRequest;
import openfl.net.URLRequestDefaults;
import openfl.net.URLRequestHeader;
import openfl.net.URLRequestMethod;
import openfl.net.URLStream;
import openfl.net.URLVariables;
import openfl.net.XMLSocket;
import openfl.printing.PrintJob;
import openfl.printing.PrintJobOptions;
import openfl.printing.PrintJobOrientation;
import openfl.profiler.Telemetry;
import openfl.sensors.Accelerometer;
import openfl.system.ApplicationDomain;
import openfl.system.Capabilities;
import openfl.system.LoaderContext;
import openfl.system.Security;
import openfl.system.SecurityDomain;
import openfl.system.System;
import openfl.system.TouchscreenType;
import openfl.text.AntiAliasType;
import openfl.text.Font;
import openfl.text.FontStyle;
import openfl.text.FontType;
import openfl.text.GridFitType;
import openfl.text.StaticText;
import openfl.text.TextField;
import openfl.text.TextFieldAutoSize;
import openfl.text.TextFieldType;
import openfl.text.TextFormat;
import openfl.text.TextFormatAlign;
import openfl.text.TextLineMetrics;
import openfl.ui.GameInput;
import openfl.ui.GameInputControl;
import openfl.ui.GameInputDevice;
import openfl.ui.Keyboard;
import openfl.ui.KeyLocation;
import openfl.ui.Mouse;
import openfl.ui.MouseCursor;
import openfl.ui.Multitouch;
import openfl.ui.MultitouchInputMode;
import openfl.utils.AGALMiniAssembler;
import openfl.utils.AssetCache;
import openfl.utils.AssetLibrary;
import openfl.utils.AssetManifest;
import openfl.utils.Assets;
import openfl.utils.AssetType;
import openfl.utils.ByteArray;
import openfl.utils.CompressionAlgorithm;
import openfl.utils.Dictionary;
import openfl.utils.Endian;
import openfl.utils.Function;
import openfl.utils.IAssetCache;
import openfl.utils.IDataInput;
import openfl.utils.IDataOutput;
import openfl.utils.IExternalizable;
import openfl.utils.Object;
import openfl.utils.Timer;
import openfl.Lib;
import openfl.Memory;
import openfl.Vector;

// #if !display
// import openfl._internal.formats.swf.SWFLiteLibrary;
// #end