classdef ModelExporter < SwigRef
  methods
    function this = swig_this(self)
      this = iDynTreeMEX(3, self);
    end
    function self = ModelExporter(varargin)
      if nargin==1 && strcmp(class(varargin{1}),'SwigRef')
        if ~isnull(varargin{1})
          self.swigPtr = varargin{1}.swigPtr;
        end
      else
        tmp = iDynTreeMEX(1560, varargin{:});
        self.swigPtr = tmp.swigPtr;
        tmp.SwigClear();
      end
    end
    function delete(self)
      if self.swigPtr
        iDynTreeMEX(1561, self);
        self.SwigClear();
      end
    end
    function varargout = exportingOptions(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1562, self, varargin{:});
    end
    function varargout = setExportingOptions(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1563, self, varargin{:});
    end
    function varargout = init(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1564, self, varargin{:});
    end
    function varargout = model(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1565, self, varargin{:});
    end
    function varargout = sensors(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1566, self, varargin{:});
    end
    function varargout = isValid(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1567, self, varargin{:});
    end
    function varargout = exportModelToString(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1568, self, varargin{:});
    end
    function varargout = exportModelToFile(self,varargin)
      [varargout{1:nargout}] = iDynTreeMEX(1569, self, varargin{:});
    end
  end
  methods(Static)
  end
end
